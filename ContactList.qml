import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

ListView {
    id: list
    property int menuIndex: null
    signal menu()


    clip: true
    boundsBehavior: ListView.StopAtBounds
    ScrollBar.vertical: ScrollBar {}
    delegate: ContactItem {
        text: name
        icon: avatar
        cityText: city
        selected: list.currentIndex === index
        onLeftClick: {
            list.currentIndex = index
        }
        onRightClick: {
            menuIndex = index;
            menu();
        }
    }
}
