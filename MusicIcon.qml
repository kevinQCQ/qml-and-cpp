import QtQuick
import QtQuick.Window
import QtQuick.Controls 2.2
import QtQuick.Layouts



Button
{
    property string iconSource

    property int iconHeight

    property int iconWidth

    property bool isChecked: false

    property bool isCheckable: false

    property string tipText

    id:self

    icon.source: iconSource

    icon.height: iconHeight

    icon.width: iconWidth

    background: Rectangle
    {
        //color:self.down&&(checkable&&checked)?"#eeeeee":"#00000000"
        color:"#00000000"
    }

    //icon.color: self.down&&(checkable&&checked)?"#00000000":"#eeeeee"

    ToolTip.text: tipText

    ToolTip.visible: hovered

    // checked: isChecked

    // checkable: isCheckable

}
