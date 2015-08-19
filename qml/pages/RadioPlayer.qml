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

    ControlPanel { id:playerPanel }

    SilicaListView {
        id: listView
        clip: true
        VerticalScrollDecorator {}

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            bottomMargin: playerPanel.visibleSize
        }

        model: fiModel

        header: PageHeader { title: ctitle } //Radio stations

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

                    if (ctitle == "Favourites") {
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
                    if (ctitle == "Favourites") {
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
                    text: "Listen"
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
                    text: "Add to favorites"
                    onClicked: addDb(rpsource,rptitle,rpsite,rpsection,rpicon);
                    }
                MenuItem {
                    id:mdelete
                    visible: favo
                    text: "Delete favourite"
                    RemorsePopup {id: remorse}
                    onClicked: remorse.execute("Deleting channel", function() {delDb(rpsource)}, 5000);
            }
            }
        }
    }
}



