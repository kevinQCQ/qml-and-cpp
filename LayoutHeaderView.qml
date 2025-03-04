import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts

/*
  播放顶部栏
*/

Rectangle
{

    width: parent.width
    Layout.fillWidth: true
    height: window.height/14


    color:"#bbb1ecb6"


    RowLayout
    {
        anchors.fill: parent
        ImageButton
        {
            width:24
            height:24
            imageSource: "./image/about.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
            onClicked:function()
            {
                aboutPopup.open()
            }
        }

        Item
        {
            width:24
            height:24
        }
        Item
        {
            width:24
            height:24
        }


        Item
        {
            height:24

            Layout.fillWidth: true;
            Text
            {
                anchors.centerIn: parent
                text: qsTr("混沌武士")
                font.family: "微软雅黑"
                font.pointSize: 12
            }
        }
        ImageButton
        {
            width:24
            height:24
            imageSource: "./image/set.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        ImageButton
        {
            width:24
            height:24
            imageSource: "./image/small.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        ImageButton
        {
            width:24
            height:24
            imageSource: "image/close.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
            onClicked:function()
            {
                Qt.quit()
            }
        }

    }

    Popup
    {
        id:aboutPopup
        property int poWidth: 680/4
        property int poHeight: 480/4
        x:(parent.width-poWidth)/2
        y:(parent.height-poHeight)/2+80

        width:poWidth
        height: poHeight

        background: Rectangle
        {
            anchors.fill:parent
            Image
            {
                anchors.centerIn: parent
                width: 680/4
                height: 480/4
                id: aboutImage
                source: "./image/混沌武士.jpg"
            }
            color:"#5558a038"
        }

        contentItem: ColumnLayout
        {
            anchors.fill:parent
            id:aboutColumn
            Item
            {
                Layout.preferredHeight: parent.height*3/4
                Layout.preferredWidth: parent.width
                Layout.fillWidth: parent
                Layout.fillHeight: parent
            }

            Rectangle
            {
                Layout.preferredHeight: parent.height*1/4
                Layout.preferredWidth: parent.width

                Text
                {
                    Layout.fillHeight: parent
                    anchors.centerIn: parent
                    id: aboutText
                    font.family: "微软雅黑"
                    font.pixelSize: 12

                    text: qsTr("这是一个qt的练手项目")
                }
            }

        }
    }


}
