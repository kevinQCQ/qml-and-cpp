import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

/*
  单首音乐播放界面
  */

Rectangle
{
    id:play_song_rec

    width:window.width
    height:headerView.height+pageView.height

    property string imageUrl
    property string playPath
    property string lyric   //根据位置传来的歌词
    property string s_name  //歌曲名
    property string s_id    //作者

    BackgroudColor
    {
        anchors.fill: parent
    }

    MouseArea
    {
        anchors.fill: parent
    }


    ColumnLayout
    {
        anchors.fill: parent
        spacing:0

        //顶部返回条
        Rectangle
        {
            id:playHeader
            color:"#00000000"
            Layout.preferredWidth: window.width
            Layout.preferredHeight: headerView.height
            ImageButton
            {
                width:28
                height:28
                imageSource: "./image/comeback.svg"
                color: "#00000000"
                from_color: "#00000000"
                to_color:"#00000000"
                onClicked:function()
                {
                    playView.visible=false;
                }
            }

        }

        //展示歌曲图片和歌词的区域
        Rectangle
        {
            id:playMain

            color:"#110ae86b"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Row
            {
                anchors.fill:parent
                Rectangle
                {
                    width: parent.width/3
                    height: parent.height
                    color:"#00000000"
                    ColumnLayout
                    {
                        anchors.fill: parent

                        Item
                        {
                            Layout.preferredHeight: parent.height/10*1
                            Layout.preferredWidth: parent.width
                        }

                        Rectangle
                        {
                            Layout.preferredHeight: parent.height/6*3
                            Layout.preferredWidth: parent.width
                            color:"#00000000"
                            radius: 10

                            Image
                            {
                                id: bug
                                source: imageUrl
                                anchors.centerIn:parent
                                width:parent.width/5*4
                                height:parent.width/5*4
                                smooth: true
                                visible: false
                            }

                            Rectangle
                            {
                                id: mask
                                anchors.fill:bug
                                radius: bug.width/2
                                smooth: true
                                visible: false
                            }

                            OpacityMask
                            {
                                anchors.fill: bug
                                source: bug
                                maskSource: mask
                            }

                        }

                        Item
                        {
                            Layout.preferredHeight: parent.height/8*1
                            Layout.preferredWidth: parent.width
                        }

                        //歌曲名字及作者
                        Rectangle
                        {
                            Layout.preferredHeight: parent.height/6*2
                            Layout.preferredWidth: parent.width
                            color:"#00000000"
                            ColumnLayout
                            {
                                Text
                                {
                                    id:song_name
                                    text: s_name
                                }
                                Text
                                {
                                    id:song_id
                                    text: s_id
                                }
                            }
                        }
                    }
                }

                Rectangle
                {
                    width: parent.width/3*2
                    height: parent.height
                    color: "#00000000"

                    Rectangle
                    {
                        color:"#00000000"
                        anchors.fill: parent
                        clip:true
                        Text
                        {
                            id: lyrics
                            text: lyric
                            anchors.centerIn: parent
                            font.pixelSize: 16 // 设置字体大小为 36 像素
                            font.family: "微软雅黑"
                        }
                    }

                }

            }
        }
    }

}
