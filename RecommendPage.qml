import QtQuick
import QtQuick.Controls
import QtQuick.Layouts




ScrollView
{
    id:scroll
    clip: true
    width: window.width-menuRectangle.width
    Layout.fillHeight: true
    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff // 禁止水平滚动条

    ColumnLayout
    {
        id:pageCol
        Text
        {
            text:"推荐页面"
        }
        BannerPage
        {
            clip:true
            Layout.preferredHeight:(window.height)*0.35
            Layout.preferredWidth:(window.width-menuRectangle.width)*0.95
            Layout.fillHeight: true

        }
        Text
        {
            text:"推荐内容"
        }
        GridPage
        {
            Layout.preferredWidth: window.width-menuRectangle.width-15
            Layout.fillHeight: true
        }
    }


}

