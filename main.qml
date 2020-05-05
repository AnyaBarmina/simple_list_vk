import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Window {
    visible: true
    width: 320
    height: 480
    title: qsTr("Контакты")

    ListModel {
        id: contactsModel
        ListElement {
            name: "Петр"
            avatar: "icons/person1.png"
            city: "Санкт-Петербург"
        }
        ListElement {
            name: "Анастасия"
            avatar: "icons/person2.png"
            city: "Екатеринбург"
        }
        ListElement {
            name: "Варвара"
            avatar: "icons/person3.png"
            city: "Иркутск"
        }
    }
    ColumnLayout {
        anchors.fill: parent
        MainToolBar {
            Layout.fillWidth: true
            onNewItem: {
                contactsModel.append({name: text})
            }
        }
        ContactList {
            id: list
            Layout.fillHeight: true
            Layout.fillWidth: true
            model: contactsModel
            onMenu: {
                contactListMenu.popup();
            }
        }
    }

    Menu {
        id: contactListMenu
        modal: true
        MenuItem {
            text: "Удалить"
            onTriggered: {
               contactsModel.remove(list.menuIndex);
            }
        }
    }
}
