import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qml_learn 1.0

/*
导入本地音乐界面
*/

Rectangle
{
    id:searchPage

    property var iconSource: [
        "./image/new_play.svg",
        "./image/new_load.svg",
        "./image/new_msg.svg",
        "./image/new_search.svg"
    ]

    //导入歌曲的CPP类
    ImportMusic
    {
        id:im
    }

    color: "#00000000"
    width: 500
    Layout.fillHeight: true

    ColumnLayout
    {
        id:columnSearchPage
        anchors.fill: parent

        Rectangle
        {
            color: "#00000000"
            Layout.preferredWidth: 130
            Layout.preferredHeight: 40
            Text
            {
                anchors.centerIn: parent
                text:"发现音乐"
                font.pixelSize: 15
                font.family: "微软雅黑"
                color: "#05d25f"
            }
        }

        Rectangle
        {
            Layout.preferredWidth: 130
            Layout.preferredHeight: 40
            topRightRadius: 4
            radius: 5
            color: "#0002f908"

            RowLayout
            {
                anchors.centerIn:parent
                spacing: 0

                Repeater
                {
                    model:iconSource
                    ImageButton
                    {
                        width:27
                        height:27
                        topLeftRadius:index===0?5:0
                        bottomLeftRadius: index==0?5:0
                        topRightRadius: index===iconSource.length-1?5:0
                        bottomRightRadius: index===iconSource.length-1?5:0
                        imageSource: iconSource[index]
                        onClicked:function()
                        {
                            //根据点击进行导入
                            if(index==1)musicList.model=im.addMusic()
                        }
                    }
                }
            }
        }

        Rectangle
        {
            Layout.preferredWidth:  searchPage.width*5/6
            Layout.fillHeight: true
            color: "#00000000"
            ScrollView
            {
                id:musicScroll
                anchors.fill:parent

                ListView
                {

                    id:musicList
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    //model:5
                    clip: true


                    delegate: Rectangle {
                        width: ListView.view.width
                        height: 100
                        color: "#3318b63e"

                        Row {
                            spacing: 10
                            anchors.verticalCenter: parent.verticalCenter

                            Image {
                                width: 80
                                height: 80
                                source: imageUrl
                                fillMode: Image.PreserveAspectFit
                            }

                            Column {
                                spacing: 5
                                Text { text: title; font.bold: true }
                                Text { text: artist }
                                Text { text: album }
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked:
                            {
                                console.log("点击播放：" + filePath);

                                window.cur_music_index=index

                                //根据im中返回的AudioModel
                                playView.s_name=title
                                playView.s_id=album
                                playView.visible=true
                                playView.playPath=filePath
                                playView.imageUrl=imageUrl
                                window.musicChange(filePath)
                                ly.loadLyrics(ly.findLrcFileByTitle(title,"C:\\Users\\Administrator\\Desktop\\music"))
                            }
                        }
                    }
                }
            }
        }
    }

    function play_music(index)
    {
        window.cur_music_index=index

        var delegate=musicList.itemAtIndex(index)

        //根据im中返回的AudioModel
        playView.s_name=delegate.title
        playView.s_id=delegate.album
        playView.visible=true
        playView.playPath=delegate.filePath
        playView.imageUrl=delegate.imageUrl
        window.musicChange(delegate.filePath)
        ly.loadLyrics(ly.findLrcFileByTitle(title,"C:\\Users\\Administrator\\Desktop\\music"))
    }

}
