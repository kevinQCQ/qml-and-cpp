#ifndef IMPORTMUSIC_H
#define IMPORTMUSIC_H

#include "PlaylistModel.h"
#include <QObject>
#include <QMediaPlayer>
#include <QUrl>
#include <QtQml>
#include <QWidget>

class ImportMusic : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit ImportMusic(QObject *parent = nullptr);
    Q_INVOKABLE AudioModel* addMusic();


public:



};

#endif // IMPORTMUSIC_H
