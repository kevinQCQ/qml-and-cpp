#include "importmusic.h"
#include <QApplication>
#include <QFileDialog>
#include <QDir>
#include <QDebug>
#include <QTemporaryFile>
#include <QUrl>
#include <QDateTime>

ImportMusic::ImportMusic(QObject *parent) : QObject(parent)
{

}

//临时保存图像，便于打开显示
QUrl saveImageToTempFile(const QImage &image) {
    if (image.isNull()) {
        return QUrl(); // 如果图像为空，返回无效的 QUrl
    }

    // 生成唯一文件名
    QString tempFilePath = QDir::tempPath() + "/cover_" + QString::number(QDateTime::currentSecsSinceEpoch()) + ".png";

    // 保存图像到文件
    QFile tempFile(tempFilePath);
    if (tempFile.open(QIODevice::WriteOnly)) {
        image.save(&tempFile, "PNG"); // 保存为 PNG 文件
        return QUrl::fromLocalFile(tempFilePath);
    }

    return QUrl(); // 如果保存失败，返回空的 QUrl
}

AudioInfo my_extractMetadata(const QString &filePath) {
    AudioInfo audio;

    QMediaPlayer player;
    player.setSource(QUrl::fromLocalFile(filePath));

    // 等待媒体加载完成
    QEventLoop loop;
    QObject::connect(&player, &QMediaPlayer::mediaStatusChanged, [&](QMediaPlayer::MediaStatus status) {
        if (status == QMediaPlayer::LoadedMedia) {
            loop.quit();
        }
    });
    loop.exec();

    // 提取元数据
    QMediaMetaData metaData = player.metaData();
    QString title = metaData.value(QMediaMetaData::Title).toString();
    QString artist = metaData.value(QMediaMetaData::Author).toString();
    QString album = metaData.value(QMediaMetaData::AlbumTitle).toString();
    QImage coverImage = metaData.value(QMediaMetaData::ThumbnailImage).value<QImage>();

    qDebug() << "Title:" << title;
    qDebug() << "Artist:" << artist;
    qDebug() << "Album:" << album;
    qDebug() << "Cover Image:" << (coverImage.isNull() ? "Not available" : "Available");

    audio.title=title;
    audio.artist=artist;
    audio.album=album;
    audio.imageUrl=saveImageToTempFile(coverImage);
    audio.coverImage=coverImage;
    audio.filePath=filePath;

    return audio;
}

//直接进行导入歌曲操作
AudioModel* ImportMusic::addMusic()
{

    AudioModel *audioModel=new AudioModel;
    // 打开文件对话框，选择多个音频文件
    QStringList fileList = QFileDialog::getOpenFileNames(nullptr, "请选择音频文件", "C:\\Users\\Administrator\\Desktop\\music", "音频文件 (*.mp3 *.wav)");

    // 如果用户取消选择，直接返回
    if (fileList.isEmpty()) {
        qDebug() << "未选择任何文件";
        return audioModel;
    }

    // 将文件路径添加到播放列表
    for (const QString &filePath : fileList) {
        AudioInfo audio = my_extractMetadata(filePath);
        if (audio.title.isEmpty())
        {
            QFileInfo fileInfo(filePath);
            audio.title = fileInfo.baseName(); // 使用文件名作为标题
        }
        audioModel->addAudio(audio);
    }

    qDebug() << "成功添加音频文件到播放列表：" << fileList;

    return audioModel;
}


