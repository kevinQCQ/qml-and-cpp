import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects


Rectangle
{
    anchors.fill: parent
    Image
    {
        id:backgroudImage
        source: "./image/aurora2.jpg"
        anchors.fill: parent
    }

    ColorOverlay
    {
        anchors.fill: backgroudImage
        source:backgroudImage
        color: "#55000000"
    }

    FastBlur
    {
        anchors.fill: backgroudImage
        source:backgroudImage
        radius:80
    }

}
