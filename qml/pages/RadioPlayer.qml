/****************************************************************************************
** JSONListModel used here:
** ------------------------
** Copyright (c) 2007 Stefan Goessner (goessner.net)
** Copyright (c) 2012 Romain Pokrzywka (KDAB) (romain@kdab.com)
**
** Permission is hereby granted, free of charge, to any person obtaining
** a copy of this software and associated documentation files (the "Software"),
** to deal in the Software without restriction, including without limitation
** the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
** sell copies of the Software, and to permit persons to whom the Software is furnished
** to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all copies
** or substantial portions of the Software.
*****************************************************************************************/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "../JSONListModel"

Page {
    id: radioPage
   // allowedOrientations: Orientation.All
    property alias model: listView.model
    property bool searching: false

    SilicaListView {
        id: listView

        quickScroll: false
        anchors.fill: parent
        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        JSONListModel {
            id: jsonModel1
            source: "https://raw.githubusercontent.com/nesnomis/allradio-data/master/stations/"+country+".json"  //country + ".json"
            query: "$."+country+".channel[*]" //"$."+ country + ".channel[*]"
            sortby: "title"
            filterby: filter
            filterkey: key
        }

        model: jsonModel1.model

        header: PageHeader {
            id: pHeader
            title: favorites ? ctitle : ""

            Row {
                enabled: !favorites
                visible: !favorites
                anchors.topMargin: Theme.paddingMedium
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.rightMargin: Theme.paddingMedium
                spacing: Theme.paddingLarge

                SearchField {
                    id: searchField
                    width: parent.width - logo2.width - (Theme.paddingMedium * 2 )
                    placeholderText: "Search"
                    inputMethodHints: Qt.ImhNoAutoUppercase | Qt.ImhNoPredictiveText
                    EnterKey.iconSource: "image://theme/icon-m-enter-close"
                    EnterKey.onClicked: {focus = false;searching= false}
                    focus: true
                    onTextChanged: if (text.length > 0) filter = text; else {filter = "";focus=true;}
                    onClicked: {listView.currentIndex = -1;showPlayer = false;searching=true}
                }

                Image {
                    id: logo2
                    height: parent.height / 2
                    fillMode: Image.PreserveAspectFit
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: Theme.paddingMedium
                    source:  country !== "" ? "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+ country + ".png" : "../harbour-allradio.png"
                }
            }
        }


        VerticalScrollDecorator {}

        property int retning: 0
        onContentYChanged: {
            if (!searching && atYBeginning) showPlayer = true
            }
            onMovementStarted: {
                retning = contentY
            }
            onVerticalVelocityChanged: {
                if (!searching && contentY > retning+10) showPlayer = false; else if (!searching && contentY < retning-10) showPlayer = true;
            }
            onMovementEnded: {
                //if (!showPlayer && contentY == -110) showPlayer = true
                    //console.log("verticalVolocity: "+verticalVelocity+" - contentY: "+contentY)
            }

            delegate: ListItem {
            id: myListItem
            menu: contextMenu
            showMenuOnPressAndHold: true
            ListView.onRemove: animateRemoval(myListItem)

            width: ListView.view.width
            height: menuOpen ? contextMenu.height + contentItem.height : contentItem.height

            function remove() {
                remorseAction("Deleting", function() { delDb(source);listView.model.remove(index) })
            }

            Label {
                 id: firstName
                 text: model.title
                 color: highlighted ? Theme.highlightColor : Theme.primaryColor
                 anchors.verticalCenter: parent.verticalCenter
                 font.pixelSize: Theme.fontSizeLarge
             }

            onClicked: {
                ps(source)
                radioStation = title
                if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                else if (favorites) picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+icon+".png"; else picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+country+".png"
                website = (Qt.resolvedUrl(site))
            }

             ContextMenu {
                 id: contextMenu
                 MenuItem {
                     id:mlisten
                     visible: true
                     text: qsTr("Listen")
                     onClicked: {
                         ps(source)
                         radioStation = title
                         if (favorites && icon.search(".png")>0) picon = icon.toLowerCase(); // The old save in database
                         else if (favorites) picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+icon+".png"; else picon = "https://raw.githubusercontent.com/nesnomis/allradio-data/master/images/"+country+".png"
                         website = (Qt.resolvedUrl(site))
                     }
                 }
                 MenuItem {
                     id:madd
                     visible: !favorites
                     text: qsTr("Add to favorites")
                     onClicked: addDb(source,title,site,section,country);
                     }
                 MenuItem {
                     id:mdelete
                     visible: favorites
                     text: qsTr("Delete favourite")

                     onClicked: remove()//listView.currentItem.remove(rpindex,rpsource) //listView.remorseAction();
                     //remorse.execute(qsTr("Deleting channel"), function() {delDb(rpsource)}, 5000);
                 }
             }

            }
            PullMenu {}
    }
    PlayerPanel { id:playerPanel;visible: !searching }
}



