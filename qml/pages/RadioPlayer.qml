import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: radioPage
    allowedOrientations: Orientation.All
    property Item contextMenu
    property alias model: listView.model
    property bool favo: false
    property string rptitle: ""
    property string rpsite: ""
    property string rpsource: ""
    property string rpsection: ""
    property string rpicon: ""

    SilicaListView {
        id: listView

        quickScroll: false
        anchors.fill: parent

        model: fiModel

        header: PageHeader { title: ctitle } //Radio stations

        VerticalScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (!showPlayer && contentY == -110) showPlayer = true
            }
            onMovementStarted: {
                retning = contentY
            }
            onVerticalVelocityChanged: {
                if (showPlayer && contentY > retning+10) showPlayer = false; else if (!showPlayer && contentY < retning-10) showPlayer = true;
            }

        PullMenu {}

        delegate: Item {
            id: myListItem
            property bool menuOpen: contextMenu != null && contextMenu.parent === myListItem

            width: ListView.view.width
            height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height



            BackgroundItem {
                id: contentItem
                width: parent.width

                Label {
                    id: firstName
                    text: title
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: Theme.fontSizeLarge
                    x: Theme.paddingLarge
                }
                onPressAndHold: {
                    if (!contextMenu)
                        contextMenu = contextMenuComponent.createObject(listView)

                    rptitle = title
                    rpsite = site
                    rpsource = source
                    rpsection = section

                    if (favorites) {
                        rpicon = icon
                        favo = true
                    } else {
                        rpicon = cicon
                        favo = false
                    }

                    contextMenu.show(myListItem)
                }
                onClicked: {
                    ps(source)
                    radioStation = title
                    playStream()
                    website = (Qt.resolvedUrl(site))
                    if (favorites) {
                        picon = icon
                    } else picon = cicon;
                }
            }

        }
        Component {
            id: contextMenuComponent

            ContextMenu {
                MenuItem {
                    id:mlisten
                    visible: true
                    text: qsTr("Listen")
                    onClicked: {
                        ps(rpsource)
                        radioStation = rptitle
                        picon = rpicon
                        website = (Qt.resolvedUrl(rpsite))
                        playStream()
                    }
                }
                MenuItem {
                    id:madd
                    visible: !favo
                    text: qsTr("Add to favorites")
                    onClicked: addDb(rpsource,rptitle,rpsite,rpsection,rpicon);
                    }
                MenuItem {
                    id:mdelete
                    visible: favo
                    text: qsTr("Delete favourite")
                    RemorsePopup {id: remorse}
                    onClicked: remorse.execute(qsTr("Deleting channel"), function() {delDb(rpsource)}, 5000);
            }
            }
        }
    }
    PlayerPanel { id:playerPanel }
}



