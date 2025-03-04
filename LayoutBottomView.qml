import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts

/*
  播放底部栏
  */

Rectangle
{
    property int sliderValue
    property int maxSliderValue

    Layout.fillWidth: true
    height:50
    color:"#aaa1e478"
    RowLayout
    {
        anchors.fill: parent
        Item
        {
            Layout.fillHeight: true
            Layout.preferredWidth: 5
            Layout.fillWidth: true
        }
        //上一首
        ImageButton
        {
            width:28
            height:28
            imageSource: "./image/previous.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"

            onClicked: function()
            {
                last_Music()
            }
        }
        //暂停
        ImageButton
        {
            width:28
            height:28
            imageSource: "./image/pause.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        //下一首
        ImageButton
        {
            width:28
            height:28
            imageSource: "./image/next.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        Item
        {
            id:sliderItem

            Layout.preferredWidth: parent.width/2.5
            Layout.fillWidth: true
            Layout.topMargin: 14
            Layout.preferredHeight: parent.height/2
            Text
            {
                id:nameText
                text: "混沌武士"
                anchors.bottom: slider.top
                anchors.left: slider.left
            }

            Text
            {
                id:timeText
                text: "00:00:00:00"
                anchors.right: slider.right
                anchors.bottom: slider.top
            }

            Slider
            {
                id:slider
                width: parent.width
                Layout.fillWidth: true
                height: 18
                from:0
                to:maxSliderValue
                value: sliderValue
                //不获取焦点
                focusPolicy: Qt.NoFocus

                background:Rectangle
                {
                    x:slider.x
                    y:(slider.height-height)/2
                    width:slider.width
                    height:3

                    Rectangle
                    {
                        x:0
                        y:0
                        width: parent.width*slider.visualPosition
                        height:parent.height
                        color: "green"
                    }

                }

                handle: Rectangle
                {
                    x:slider.leftPadding+(slider.width-slider.leftPadding-slider.rightPadding-width)*slider.visualPosition
                    y:(slider.height-height)/2
                    width: 10
                    height: 14
                    radius:3
                }
            }
        }
        ImageButton
        {
            width:28
            height:28
            imageSource: "./image/random_play.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        ImageButton
        {
            width:28
            height:28
            imageSource: "./image/love.svg"
            color: "#00000000"
            from_color: "#00000000"
            to_color: "#00000000"
        }
        Item
        {
            Layout.fillHeight: true
            Layout.preferredWidth: 10
        }
    }
}
