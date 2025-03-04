import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts
import QtMultimedia
import qml_learn 1.0

ApplicationWindow {
    id:window
    width: 800
    height: 500
    visible: true
    title: qsTr("musicPlayer")
    background: BackgroudColor
    {
        id:backgroudColor
    }

    //返回歌词，作者等，以及歌曲的地址
    LyricsHandler
    {
        id:ly
    }

    property real slider_rate

    //用于标记现在播放的音乐的index
    property int cur_music_index: -1

    property int max_music_index: 9999999

    signal musicChange(string musicPath)

    onMusicChange:function (path)
    {
        mediaPlayer.source=path
        mediaPlayer.play()
    }

    signal last_Music()

    onLast_Music: function()
    {
        main_col.pageView.page_playMusic()

        cur_music_index+=1;
        if(cur_music_index>max_music_index)cur_music_index=0;
        play_Music(cur_music_index)
    }

    signal play_Music(int index)



    MediaPlayer
    {
        id: mediaPlayer
        audioOutput: AudioOutput {
            volume: 0.8
        }
        onPlayingChanged:
        {
            if(mediaPlayer.playing)
            {
                bottomView.maxSliderValue=ly.back_maxtime()
                console.log("正在播放"+bottomView.maxSliderValue)
            }
            else
            {
                console.log("未在播放")
            }
        }
        onPositionChanged:function()
        {
            playView.lyric=ly.getLyricForPosition(position)
            bottomView.sliderValue=position
            console.log(playView.lyric)
        }
    }


    ColumnLayout
    {
        id:main_col
        anchors.fill: parent
        spacing: 0

        property string temp: "......"

        LayoutHeaderView
        {
            id:headerView
        }

        LayoutPageView
        {
            id:pageView

        }

        LayoutBottomView
        {
            id:bottomView
        }

    }


    Play_song
    {
        id:playView

    }

    Component.onCompleted:
    {
        playView.visible=false
    }

}
