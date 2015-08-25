import QtQuick 2.0
import Sailfish.Silica 1.0

DockedPanel {
    id: searchPanel
    width: parent.width
    height: Theme.itemSizeLarge + Theme.paddingLarge + combo.height
    dock: Dock.Top
    open: showSearch

    ComboBox {
        id: combo
        label: "   " +qsTr("Search by")+": "

        menu: ContextMenu {
            MenuItem { text: qsTr("Name") }
            MenuItem { text: qsTr("Tag") }
            MenuItem { text: qsTr("Location") }
            onClicked: {
                if (!favorites)
                    if (combo.currentIndex == 0) key="title"; else if (combo.currentIndex == 1) key="section"; else key="location";
                else
                    console.log("Search from database") // Database should be updated to contain location and section.
            }
        }
    }

    SearchField {
        id: searchField
        anchors.top: combo.bottom
        width: parent.width
        visible: searchPanel.open
        focus: searchPanel.open
        inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
        onTextChanged: if (text.length > 0) filter = text
    }
}
