#include "lyricshandler.h"

LyricsHandler::LyricsHandler(QObject *parent)
    : QObject{parent}
{
    max_time=0;
}

//找到.wav对应的.lrc文件
QString LyricsHandler::findLrcFileByTitle(const QString &title, const QString &directoryPath)
{
    // 创建一个 QDir 对象，用于访问指定的目录
    QDir dir(directoryPath);

    // 设置 QDir 对象的名称过滤器，使其只列出扩展名为 .lrc 的文件
    dir.setNameFilters(QStringList() << "*.lrc");

    // 设置 QDir 对象的过滤器，使其只列出文件（不包括目录）
    dir.setFilter(QDir::Files);

    // 获取目录中所有符合过滤器条件的文件信息列表
    QFileInfoList fileList = dir.entryInfoList();

    qDebug()<<"title"<<title<<"\n";
    // 遍历文件信息列表
    for (const QFileInfo &fileInfo : fileList)
    {
        // 获取当前文件的文件名
        QString fileName = fileInfo.fileName();
        qDebug()<<fileName<<"\n";
        // 检查文件名是否包含指定的标题，并且文件扩展名为 .lrc
        if (fileName.contains(title) && fileName.endsWith(".lrc"))
        {
            // 如果找到匹配的文件，返回其绝对路径
            return fileInfo.absoluteFilePath();
        }
    }

    // 如果遍历完整个列表后没有找到匹配的文件，返回空字符串
    return QString();
    // 如果没有找到，返回空字符串
}

//将.lrc的时间和歌词通过哈希表对应起来，存入 lyricsMap
QMap<int, QString> LyricsHandler::loadLyrics(const QString &Path)
{
    QString filePath="";
    for(int i=0;i<Path.size();i++)
    {
        if(Path[i]=='/')filePath+="//";
        else filePath+=Path[i];
    }
    QFile file(filePath);
    qDebug()<<filePath<<"\n";
    if (file.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QTextStream in(&file);
        while (!in.atEnd())
        {
            QString line = in.readLine();
            if (line.startsWith('[') && line.contains(']'))
            {
                QString timeStr = line.section('[', 1, 1).section(']', 0, 0);
                QString lyricText = line.section(']', 1, 1).trimmed();
                qDebug()<<timeStr<<" "<<lyricText<<"\n";
                int time = timeStrToMs(timeStr);
                if(time==-1)continue;
                lyricsMap.insert(time, lyricText);
                max_time=fmax(max_time,time);
                qDebug()<<"insert"<<time<<" "<<lyricText<<"\n";
            }
        }
        file.close();
    }
    return lyricsMap;
}

//根据位置返回歌词
QString LyricsHandler::getLyricForPosition(int position)
{
    qDebug()<<position<<"\n";
    QMap<int, QString>::const_iterator it = lyricsMap.lowerBound(position);
    if (it != lyricsMap.end())
    {
        if(it!=lyricsMap.begin())it--;
        return it.value();
    }
    return QString();
}


int LyricsHandler::timeStrToMs(const QString &timeStr)
{
    qDebug()<<timeStr;
    if(timeStr.contains(":"))
    {
        QStringList parts = timeStr.split(":");

        int minutes = parts[0].toInt();

        // 再次分割秒和毫秒部分
        QStringList secMsParts = parts[1].split(".");
        int seconds = secMsParts[0].toInt();

        // 如果存在毫秒部分，则使用它，否则默认毫秒为0
        int milliseconds = secMsParts.size() > 1 ? secMsParts[1].toInt() : 0;

        // 返回总毫秒数
        return minutes * 60 * 1000 + seconds * 1000 + milliseconds;
    }
    else return -1;

}

int LyricsHandler::back_maxtime()
{
    return max_time;
}
