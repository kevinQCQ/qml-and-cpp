import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts



Rectangle {
    id: bannerPage
    clip: true

    Layout.leftMargin: 10

    //border.color: "red"
    color:"#00000000"

    property int current: 0
    property var urlArray: [
        "http://p1.music.126.net/90LDCsjGsTNqaHN4QmYKEg==/109951170278964307.jpg?imageView&quality=89",
        "http://p1.music.126.net/2lsrH2BiI9Bq6jvZqfj2Bw==/109951170278917430.jpg?imageView&quality=89",
        "http://p1.music.126.net/CjXjgwv27bURsiKm_P-WTQ==/109951170278967492.jpg?imageView&quality=89",
        "http://p1.music.126.net/PfijfxxR2FGUK0vjITDyLA==/109951170278962094.jpg?imageView&quality=89",
        "http://p1.music.126.net/lU8_b-_-cDp6UJBe8lnxSg==/109951170278969454.jpg?imageView&quality=89",
    ]

    PathView
    {
        clip:true
        id:pathView
        width: parent.width
        height:parent.height
        pathItemCount:3
        model:urlArray
        delegate: Item
        {
            width:parent.width*0.45
            height:parent.height
            id:pathItem
            scale: PathView.scale
            z:PathView.z
            Image {
                id: leftimage
                height: parent.height
                width: parent.width
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 30

                source: urlArray[index]

            }
        }
        path: itemPath
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5

    }
    Path
    {
        id:itemPath
        startX: 0
        startY: bannerPage.height/2.3-15
        PathAttribute
        {
            name:"z"
            value: 0
        }
        PathAttribute
        {
            name:"scale"
            value: 0.48
        }
        PathLine
        {
            x:bannerPage.width/2
            y:bannerPage.height/2.3-30
        }
        PathAttribute
        {
            name:"z"
            value: 1
        }
        PathAttribute
        {
            name:"scale"
            value: 0.95
        }
        PathLine
        {
            x:bannerPage.width
            y:bannerPage.height/2.3-15
        }
        PathAttribute
        {
            name:"z"
            value: 0
        }
        PathAttribute
        {
            name:"scale"
            value: 0.48
        }

    }

    PageIndicator
    {
        id:pageIndicator
        count:pathView.count
        interactive: true
        currentIndex: pathView.currentIndex
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        delegate: Rectangle
        {
            width:10
            height:5
            color:index===pathView.currentIndex?"black":"gray"

            Behavior on color
            {
                ColorAnimation {
                    duration: 200
                }
            }

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                onEntered:
                {
                    pageTimer.stop()
                    pathView.currentIndex=index
                }
                onExited:
                {
                    pageTimer.start()
                }
            }

        }

    }

    Timer
    {
        id:pageTimer
        interval: 1000
        repeat: true
        onTriggered:
        {
            pathView.currentIndex=(pathView.currentIndex+1)%pathView.count
        }
    }

    Component.onCompleted:
    {
        pageTimer.start()
    }


}
