#ifndef LYRICSHANDLER_H
#define LYRICSHANDLER_H

#include <QObject>
#include <qdir.h>
#include <qqmlintegration.h>

class LyricsHandler : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit LyricsHandler(QObject *parent = nullptr);

    Q_INVOKABLE QMap<int, QString> loadLyrics(const QString &filePath);

    Q_INVOKABLE QString getLyricForPosition(int position);

    Q_INVOKABLE QString findLrcFileByTitle(const QString &title, const QString &directoryPath);

    Q_INVOKABLE int back_maxtime();

private:
    QMap<int, QString> lyricsMap;

    int timeStrToMs(const QString &timeStr);

    int max_time;

signals:
};

#endif // LYRICSHANDLER_H
