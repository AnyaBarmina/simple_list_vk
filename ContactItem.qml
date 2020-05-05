import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: me
    property alias icon: icon.source
    property alias text: label.text
    property alias cityText: city.text
    property bool selected: false

    signal leftClick()
    signal rightClick()

    width: parent.width
    height: 50

    color: {
        if (selected)
            return "#4A76A8"
        if (area.containsMouse)
            return "#EDEEF0"
        return "#FFFFFF";
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 7
        Image {
            id: icon
            source: "icons/person.png"
            Layout.fillHeight: true
            Layout.preferredWidth: height
            Layout.margins: 7
        }
        ColumnLayout{
            Label{
                id: label
                font.pixelSize: 16
                Layout.fillWidth: true
            }
            Label{
                id: city
                Layout.fillWidth: true
            }
        }
    }
    MouseArea {
        id: area
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if(mouse.button === Qt.LeftButton)
                leftClick();
            if(mouse.button === Qt.RightButton)
                rightClick();
        }
    }
}
