#ifndef PLAYLISTMODEL_H
#define PLAYLISTMODEL_H


#include <QImage>
#include <qabstractitemmodel.h>
#include <qeventloop.h>
#include <qurl.h>
#include <QMediaPlayer>
#include <QMediaMetaData>
#include <QDebug>



class AudioInfo {
public:
    QString title;
    QString artist;
    QString album;
    QString filePath;
    QUrl imageUrl;
    QImage coverImage; // 专辑封面
};

class AudioModel : public QAbstractListModel {
    Q_OBJECT
public:
    enum Roles {
        TitleRole = Qt::UserRole + 1,
        ArtistRole,
        AlbumRole,
        FilePathRole,
        ImageUrl,
        CoverImageRole
    };

    explicit AudioModel(QObject *parent = nullptr) : QAbstractListModel(parent) {}

    int rowCount(const QModelIndex &parent = QModelIndex()) const override {
        Q_UNUSED(parent);
        return m_audioList.size();
    }

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override {
        if (!index.isValid() || index.row() >= m_audioList.size())
            return QVariant();

        const AudioInfo &audio = m_audioList.at(index.row());
        switch (role) {
        case TitleRole:
            return audio.title;
        case ArtistRole:
            return audio.artist;
        case AlbumRole:
            return audio.album;
        case FilePathRole:
            return audio.filePath;
        case ImageUrl:
            return audio.imageUrl;
        case CoverImageRole:
            return audio.coverImage;
        default:
            return QVariant();
        }
    }

    QHash<int, QByteArray> roleNames() const override {
        return {
            {TitleRole, "title"},
            {ArtistRole, "artist"},
            {AlbumRole, "album"},
            {FilePathRole, "filePath"},
            {ImageUrl,"imageUrl"},
            {CoverImageRole, "coverImage"}
        };
    }

    void addAudio(const AudioInfo &audio) {
        beginInsertRows(QModelIndex(), m_audioList.size(), m_audioList.size());
        m_audioList.append(audio);
        endInsertRows();
    }

private:
    QList<AudioInfo> m_audioList;
};



#endif // PLAYLISTMODEL_H
