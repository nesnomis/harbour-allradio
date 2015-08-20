import QtQuick 2.0
import Sailfish.Silica 1.0
import "../stations"

Page {
    id: countryPage
    allowedOrientations: Orientation.All

    /* --------------- START of Country edit --------------- */
    /* Add StationsListXX.qml to the stationsfolder, as with */
    /* country icons (size 200x125) */
    property variant albania: Albania {}
    property variant andorra: Andorra {}
    property variant armenia: Armenia {}
    property variant austria: Austria {}
    property variant azerbaijan: Azerbaijan {}
    property variant belarus: Belarus {}
    property variant belgium: Belgium {}
    property variant bosnia: Bosnia {}
    property variant bulgaria: Bulgaria {}
    property variant croatia: Croatia {}
    property variant cyprus: Cyprus {}
    property variant czechrepublic: Czechrepublic {}
    property variant denmark: Denmark {}
    property variant estonia: Estonia {}
    property variant faroe: Faroe {}
    property variant finland: Finland {}
    property variant france: France {}
    property variant georgia: Georgia {}
    property variant germany: Germany {}
    property variant gibraltar: Gibraltar {}
    property variant greece: Greece {}
    property variant hungary: Hungary {}
    property variant iceland: Iceland {}
    property variant ireland: Ireland {}
    property variant italy: Italy {}
    property variant latvia: Latvia {}
    property variant liechtenstein: Liechtenstein {}
    property variant lithuania: Lithuania {}
    property variant luxembourg: Luxembourg {}
    property variant macedonia: Macedonia {}
    property variant malta: Malta {}
    property variant moldova: Moldova {}
    property variant monaco: Monaco {}
    property variant montenegro: Montenegro {}
    property variant netherlands: Netherlands {}
    property variant norway: Norway {}
    property variant poland: Poland {}
    property variant portugal: Portugal {}
    property variant romania: Romania {}
    property variant russia: Russia {}
    property variant serbia: Serbia {}
    property variant slovakia: Slovakia {}
    property variant slovenia: Slovenia {}
    property variant spain: Spain {}
    property variant sweden: Sweden {}
    property variant switzerland: Switzerland {}
    property variant turkey: Turkey {}
    property variant uk: UK {}
    property variant ukraine: Ukraine {}
    property variant vatican: Vatican {}

    // Cant use qsTr in a ListElement, so maybe use javascript instead?
    // ListElement should be like this:
    /*ListElement {
        country: "Albania"
        coid: "_albania
        icon: "../stations/Albania.png"
    }*/

    ListModel {
        id: galleryModel

        ListElement {
            country: "Albania"
            icon: "../stations/Albania.png"
        }
        ListElement {
            country: "Andorra"
            icon: "../stations/Andorra.png"
        }
        ListElement {
            country: "Armenia"
            icon: "../stations/Armenia.png"
        }
        ListElement {
            country: "Austria"
            icon: "../stations/Austria.png"
        }
        ListElement {
            country: "Azerbaijan"
            icon: "../stations/Azerbaijan.png"
        }
        ListElement {
            country: "Belarus"
            icon: "../stations/Belarus.png"
        }
        ListElement {
            country: "Belgium"
            icon: "../stations/Belgium.png"
        }
        ListElement {
            country: "Bosnia"
            icon: "../stations/Bosnia.png"
        }
        ListElement {
            country: "Bulgaria"
            icon: "../stations/Bulgaria.png"
        }
        ListElement {
            country: "Croatia"
            icon: "../stations/Croatia.png"
        }
        ListElement {
            country: "Cyprus"
            icon: "../stations/Cyprus.png"
        }
        ListElement {
            country: "Czech-republic"
            icon: "../stations/Czechrepublic.png"
        }
        ListElement {
            country: "Denmark"
            icon: "../stations/Denmark.png"
        }
        ListElement {
            country: "Estonia"
            icon: "../stations/Estonia.png"
        }
        ListElement {
            country: "Faroe"
            icon: "../stations/Faroe.png"
        }
        ListElement {
            country: "Finland"
            icon: "../stations/Finland.png"
        }
        ListElement {
            country: "France"
            icon: "../stations/France.png"
        }
        ListElement {
            country: "Georgia"
            icon: "../stations/Georgia.png"
        }
        ListElement {
            country: "Germany"
            icon: "../stations/Germany.png"
        }
        ListElement {
            country: "Gibraltar"
            icon: "../stations/Gibraltar.png"
        }
        ListElement {
            country: "Greece"
            icon: "../stations/Greece.png"
        }
        ListElement {
            country: "Hungary"
            icon: "../stations/Hungary.png"
        }
        ListElement {
            country: "Iceland"
            icon: "../stations/Iceland.png"
        }
        ListElement {
            country: "Ireland"
            icon: "../stations/Ireland.png"
        }
        ListElement {
            country: "Italy"
            icon: "../stations/Italy.png"
        }
        ListElement {
            country: "Latvia"
            icon: "../stations/Latvia.png"
        }
        ListElement {
            country: "Liechtenstein"
            icon: "../stations/Liechtenstein.png"
        }
        ListElement {
            country: "Lithuania"
            icon: "../stations/Lithuania.png"
        }
        ListElement {
            country: "Luxembourg"
            icon: "../stations/Luxembourg.png"
        }
        ListElement {
            country: "Macedonia"
            icon: "../stations/Macedonia.png"
        }
        ListElement {
            country: "Malta"
            icon: "../stations/Malta.png"
        }
        ListElement {
            country: "Moldova"
            icon: "../stations/Moldova.png"
        }
        ListElement {
            country: "Monaco"
            icon: "../stations/Monaco.png"
        }
        ListElement {
            country: "Montenegro"
            icon: "../stations/Montenegro.png"
        }
        ListElement {
            country: "Netherlands"
            icon: "../stations/Netherlands.png"
        }
        ListElement {
            country: "Norway"
            icon: "../stations/Norway.png"
        }
        ListElement {
            country: "Poland"
            icon: "../stations/Poland.png"
        }
        ListElement {
            country: "Portugal"
            icon: "../stations/Portugal.png"
        }
        ListElement {
            country: "Romania"
            icon: "../stations/Romania.png"
        }
        ListElement {
            country: "Russia"
            icon: "../stations/Russia.png"
        }
        ListElement {
            country: "Serbia"
            icon: "../stations/Serbia.png"
        }
        ListElement {
            country: "Slovakia"
            icon: "../stations/Slovakia.png"
        }
        ListElement {
            country: "Slovenia"
            icon: "../stations/Slovenia.png"
        }
        ListElement {
            country: "Spain"
            icon: "../stations/Spain.png"
        }
        ListElement {
            country: "Sweden"
            icon: "../stations/Sweden.png"
        }
        ListElement {
            country: "Switzerland"
            icon: "../stations/Switzerland.png"
        }
        ListElement {
            country: "Turkey"
            icon: "../stations/Turkey.png"
        }
        ListElement {
            country: "UK"
            icon: "../stations/UK.png"
        }
        ListElement {
            country: "Ukraine"
            icon: "../stations/Ukraine.png"
        }
        ListElement {
            country: "Vatican"
            icon: "../stations/Vatican.png"
        }
    }

    function chooseCountry(icon,country) {
        ctitle = country
        cicon = icon

        if (country == "Albania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: albania})
        if (country == "Andorra" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: andorra})
        if (country == "Armenia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: armenia})
        if (country == "Austria" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: austria})
        if (country == "Azerbaijan" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: azerbaijan})
        if (country == "Belarus" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: belarus})
        if (country == "Belgium" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: belgium})
        if (country == "Bosnia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: bosnia})
        if (country == "Bulgaria" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: bulgaria})
        if (country == "Croatia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: croatia})
        if (country == "Cyprus" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: cyprus})
        if (country == "Czech-republic" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: czechrepublic})
        if (country == "Denmark" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: denmark})
        if (country == "Estonia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: estonia})
        if (country == "Faroe" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: faroe})
        if (country == "Finland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: finland})
        if (country == "France" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: france})
        if (country == "Georgia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: georgia})
        if (country == "Germany" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: germany})
        if (country == "Gibraltar" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: gibraltar})
        if (country == "Greece" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: greece})
        if (country == "Hungary" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: hungary})
        if (country == "Iceland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: iceland})
        if (country == "Ireland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: ireland})
        if (country == "Italy" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: italy})
        if (country == "Latvia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: latvia})
        if (country == "Liechtenstein" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: liechtenstein})
        if (country == "Lithuania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: lithuania})
        if (country == "Luxembourg" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: luxembourg})
        if (country == "Macedonia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: macedonia})
        if (country == "Malta" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: malta})
        if (country == "Moldova" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: moldova})
        if (country == "Monaco" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: monaco})
        if (country == "Montenegro" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: montenegro})
        if (country == "Netherlands" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: netherlands})
        if (country == "Norway" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: norway})
        if (country == "Poland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: poland})
        if (country == "Portugal" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: portugal})
        if (country == "Romania" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: romania})
        if (country == "Russia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: russia})
        if (country == "Serbia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: serbia})
        if (country == "Slovakia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: slovakia})
        if (country == "Slovenia" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: slovenia})
        if (country == "Spain" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: spain})
        if (country == "Sweden" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: sweden})
        if (country == "Switzerland" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: switzerland})
        if (country == "Turkey" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: turkey})
        if (country == "UK" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: uk})
        if (country == "Ukraine" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: ukraine})
        if (country == "Vatican" ) window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),{model: vatican})
    }
    /* --------------- END of Country edit --------------- */

    ControlPanel { id:playerPanel }

    SilicaGridView {
        id: grid
        visible: true
        cellWidth: width / 2
        cellHeight: width / 2
        anchors.fill: parent

        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        model: galleryModel

        PullMenu {
            MenuItem {
                text: qsTr("Show as list")
                onClicked: grid.visible = false
            }
        }

        header: BackgroundItem {
            id: favHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }

                Image {
                    id: favIcon
                    anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                    source: "../harbour-allradio.png"
                    x: 70
                    y: 70
                    width: favHeader.width / 3.7
                    height: favHeader.width / 3.7
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                    text: qsTr("Favorites")
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeHuge

                }

            }

        delegate: BackgroundItem {
                    width: (parent.width / 2); height: (parent.width / 2)

                    Image {
                        id: myIcon
                        y: 20; anchors.horizontalCenter: parent.horizontalCenter
                        source: icon
                        width: parent.width / 1.5
                        height: parent.width / 1.5
                        opacity: 0.6
                        fillMode: Image.PreserveAspectFit
                    }

                    Text {
                        anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
                        text: country
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                        font.pixelSize: Theme.fontSizeLarge

                    }

                    onClicked: {
                        favorites = false
                        chooseCountry(icon,country)
                    }
                }
        ScrollDecorator {}
    }

    SilicaListView {
        id: list
        //cellWidth: width / 2
        //cellHeight: width / 2
        visible: !grid.visible
        anchors.fill: parent

        anchors.bottomMargin: playerPanel.visibleSize
        clip: true

        model: galleryModel

        PullMenu {            MenuItem {
                text: qsTr("Show as grid")
                onClicked: grid.visible = true
            }}

        header: BackgroundItem {
            id: listfavHeader
            width: parent.width
            height: parent.width / 2.3
            onClicked: {
                ctitle = qsTr("Favorites")
                favorites = true
                window.pageStack.push(Qt.resolvedUrl("RadioPlayer.qml"),
                                             {model: dbModel} )
            }
            //Row {
                //spacing: Theme.paddingLarge
                //width: parent.width * 0.83
                //anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: favIcon
                    anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                    source: "../harbour-allradio.png"
                    x: 70
                    y: 70
                    width: listfavHeader.width / 3.7
                    height: listfavHeader.width / 3.7
                    opacity: 0.6
                    fillMode: Image.PreserveAspectFit
                }

                Label {
                    anchors { left: parent.left; leftMargin: 40; bottom: favIcon.bottom }
                    text: qsTr("Favorites")
                    color: highlighted ? Theme.highlightColor : Theme.primaryColor
                    font.pixelSize: Theme.fontSizeHuge

                }
            //}
            }

        delegate: BackgroundItem {
            width: (parent.width)
            anchors { horizontalCenter: parent.horizontalCenter}

            //width: parent.width
            Image {
                id: myListIcon
                y: 20; //anchors.horizontalCenter: parent.horizontalCenter
                anchors { right: parent.right; rightMargin: 40; verticalCenter: parent.verticalCenter }
                source: icon
                height: listText.height


                //horizontalAlignment: right
                //width: 60
                //height: parent.width / 1.5
                opacity: 0.6
                fillMode: Image.PreserveAspectFit
            }

            Text {
                id: listText
                anchors { left: parent.left; leftMargin: 40; verticalCenter: parent.verticalCenter }
                text: country
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                font.pixelSize: Theme.fontSizeLarge

            }

                    onClicked: {
                        favorites = false
                        chooseCountry(icon,country)
                    }
                }
        ScrollDecorator {}
    }
}
