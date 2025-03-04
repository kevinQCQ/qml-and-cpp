import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts

Grid
{
    id:pageGrid
    clip: true

    //Layout.leftMargin: 15
    property var array: [
        "http://p1.music.126.net/vZ5ef3WzRneTTydXSzPauQ==/109951165994871935.jpg?param=140y140",
        "http://p1.music.126.net/Y3GdVYAd3zAWIRfHLFfuAQ==/109951168212216948.jpg?param=140y140",
        "http://p1.music.126.net/OjlAjd43ajVIns8-M98ugA==/109951165177312849.jpg?param=140y140",
        "http://p2.music.126.net/SXvFWHI6_h9OhE02_5yeFQ==/109951170278112887.jpg?param=140y140",
        "http://p1.music.126.net/8g2Pn9Xw1m7cFhxOlc3BMg==/109951167875709379.jpg?param=140y140",
        "http://p2.music.126.net/2JnE0IzXEUSxLuw66ny7Rg==/109951170240335631.jpg?param=140y140",
        "http://p1.music.126.net/fIIlHjEpHVe83hmDn3Zfiw==/109951168616082867.jpg?param=140y140",
        "http://p2.music.126.net/9RTZZBe8imWkL0I8BNfvXw==/109951166370677719.jpg?param=140y140",
        "http://p2.music.126.net/WCE6Za49yYQyDvnNJykJ-w==/109951170209787177.jpg?param=140y140",
        "http://p2.music.126.net/I4Mvo01PpVOsv6mKzBM66Q==/109951170023819375.jpg?param=140y140",
        "http://p2.music.126.net/8fQ9jzTJnMweLNm7VoyPSw==/6623458045881301.jpg?param=140y140",
        "http://p2.music.126.net/g2MCdTuQleEftx6RAnz7MA==/109951169989845498.jpg?param=140y140",
        "http://p2.music.126.net/iafNZhxcTc_uGo5IXIKouA==/109951170137641890.jpg?param=140y140"
    ]

    columns: 5
    spacing: 10

    Repeater
    {
        id:gridRepeater
        model:array
        delegate: Item
        {
            width:pageGrid.width/5-10
            height: pageGrid.width/5-10
            Rectangle
            {
                radius: 5
                width:pageGrid.width/5-10
                height: pageGrid.width/5-10
                color:"#00000000"
                Image
                {
                    width: parent.width
                    height:parent.height
                    source: array[index]
                }

            }
        }
    }

}

