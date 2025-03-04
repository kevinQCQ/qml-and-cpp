import QtQuick


/*
自定义按钮
*/

Rectangle
{
    id:imageButtonRectangle

    property string imageSource
    property var onClicked:null

    property string from_color:"#dd80ff8a"
    property string to_color:"#77bc86"
    color: "#dd80ff8a"

    Image
    {
        id:imageButton
        width: parent.width
        height: parent.height
        source: imageSource
        mipmap:true
        MouseArea
        {
            id:my_area
            anchors.fill: parent
            hoverEnabled: true
            onEntered:
            {
                animation1.start()
                animation3.start()
            }
            onExited:
            {
                animation2.start()
                animation4.start()
            }
            onClicked:
            {
                if(imageButtonRectangle.onClicked)imageButtonRectangle.onClicked()
            }
        }
    }


    NumberAnimation
    {
        id:animation1
        target: imageButton
        property: "scale"
        from:1
        to:0.85
        duration: 200
    }
    NumberAnimation
    {
        id:animation2
        target: imageButton
        property: "scale"
        from:0.85
        to:1
        duration: 200
    }

    ColorAnimation
    {
        id:animation3
        target: imageButtonRectangle
        property: "color"
        from: from_color
        to: to_color
        duration: 200
    }

    ColorAnimation
    {
        id:animation4
        target: imageButtonRectangle
        property: "color"
        from: to_color
        to: from_color
        duration: 200
    }

}
