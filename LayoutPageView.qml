import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts
import QtQml

/*
  播放内容界面
*/
RowLayout
{
    property var listViewModel: [
        {image:"./image/recommend.png",value:"推荐内容",qml:"RecommendPage.qml" },
        {image:"./image/search.png",value:"搜索音乐",qml:"SearchPage.qml" },
        {image:"./image/local.png",value:"本地音乐",qml:"LocalPage.qml" },
        {image:"./image/history.png",value:"播放历史",qml:"HistoryPage.qml" },
        {image:"./image/like.png",value:"我的喜欢",qml:"LikePage.qml" },
        {image:"./image/album.png",value:"专辑歌单",qml:"AlbumPage.qml" }
    ]
    spacing: 0

    signal page_playMusic()
    onPage_playMusic:function()
    {

    }

    Rectangle
    {
        id:menuRectangle
        clip: true
        Layout.preferredWidth:140
        Layout.fillHeight: true
        color: "#8889d594"

        ListView
        {
            id:menuListView

            anchors.fill: parent
            model: ListModel{
                id:menuModel
            }

            delegate: listItemComponent
            highlight:Rectangle
            {
                z:100
                color: "#999de19a"
                RowLayout
                {
                    anchors.fill: parent
                    spacing: 5
                    Item
                    {
                        width:8
                        height: 32
                    }
                    Image
                    {
                        Layout.preferredHeight: 18
                        Layout.preferredWidth: 18
                        mipmap:true
                        source: listViewModel[menuListView.currentIndex].image
                    }
                    Text
                    {
                        text: listViewModel[menuListView.currentIndex].value
                    }
                }
            }
        }
        Component
        {
            id:listItemComponent
            Rectangle
            {
                width: 140
                height: 32
                color: "#8889d594"
                RowLayout
                {
                    anchors.fill: parent
                    spacing: 5
                    Item {
                        width:8
                        height: 32
                    }
                    Image {
                        Layout.preferredHeight: 18
                        Layout.preferredWidth: 18
                        mipmap:true
                        source: image
                    }
                    Text {
                        text: value
                    }
                }
                MouseArea
                {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered:
                    {
                        color="#999de19a"
                        //console.log(menuListView.currentIndex)
                    }
                    onExited:
                    {
                        color="#8889d594"
                    }
                    onClicked:
                    {
                        pageRepeater.itemAt(menuListView.currentIndex).visible=false
                        menuListView.currentIndex=index
                        var loa=pageRepeater.itemAt(index)
                        loa.source=listViewModel[index].qml
                        loa.visible=true
                    }
                }
            }
        }
    }

    Repeater
    {
        id:pageRepeater
        model: listViewModel.length

        delegate: Loader{
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: listViewModel[index].qml
            visible: index===0?true:false
        }
    }
    Component.onCompleted:
    {
        menuModel.append(listViewModel)
    }

    function p_s(index)
    {
        var delegate=pageRepeater.itemAt(1)
        delegate.play_song(index)
    }
}


