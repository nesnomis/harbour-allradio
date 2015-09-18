import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "pages"
import "js/favorites.js" as Db
import "js/stream.js" as Stream

ApplicationWindow {
id: window
property variant dbModel: favChannels
property alias mp3: playMusic.source
property string ctitle: ""
property string picon: "../harbour-allradio.png"
property string ficon: ""
property string cicon: ""
property string radioStation: ""
property string website: ""
property int sleepTime: 0
property int userPlay: 0 // 0 Stopped, 1 Paused, 2 Playing
property bool favorites: false
property bool showPlayer: false;
property string country
property string filter: ""
property string key: "title"
property bool sloading: false
property bool streaming: false
property string currentUrl: ""
//property int wakeUp: 0
//property string wakeupChannel: ""
//property string wakeupChannelName: ""
//property string wakeupIcon: ""

/*function pauseStream() {
    userPlay = 1;
    playMusic.pause();
    streaming = false
    sloading = false
}*/

function playStream() {
    sloading = true
    mp3 = currentUrl
    userPlay=2;
    playMusic.play();
    streaming = true
    if (!showPlayer)
        showPlayer = true
}

function stopStream() {
    playMusic.stop();
    if (mp3 !== "") currentUrl = mp3
    mp3 = ""
    //userPlay=0;
    streaming = false
    sloading = false
}

function ps(source) {
        playMusic.stop()
        userPlay = 0
        streaming = false
        sloading = true;
        Stream.func(source);
        playStream()
        //currentUrl = mp3
}

function unknownError() {
    radioStation = "Uknown Error"
    mp3 = "";
    userPlay=0;
    streaming = false
    sloading = false
}

function dropDb() {
    Db.drop()
    Db.initialize()
    Db.load(favChannels)
}

function addDb(source,title,site,section,icon) {
    console.log("ICON: "+icon)

    Db.add(source,title,site,section,icon)
    Db.load(favChannels)
}

function delDb(source) {
    Db.del(source)
}

Component.onCompleted: {
    Db.initialize()
    Db.load(favChannels)
}

CountryModel {id: countryModel}
ListModel{id: favChannels}

Timer {
    id: sleepTimer
    interval: 60000
    repeat: false
    onTriggered: {
        if (sleepTime == 1) { stopStream();sleepTime = 0;} else sleepTime = (sleepTime = sleepTime -1);
    }
    running: sleepTime > 0
}


Audio {
        id: playMusic
        source: mp3
        autoPlay: true

        //onStopped:{console.log("Stopped")}

        onError: {
            switch (error) {
                case 0: return;
                //case 1: break //ResourceError (The audio cannot be played due to a problem allocating resources.The audio cannot be played due to a problem allocating resources.)
                //case 2: break //FormatError (The audio format is not supported.)
                case 3: if (userPlay == 2 && errorString !== "File Not Found") {mp3 = "";stopStream(); radioStation = errorString;userPlay = 0}
                        else if (userPlay == 2 && position == 0) stopStream();startStream();break // Seek Error
                //case 4: break; //AccessDenied (The audio cannot be played due to insufficient permissions.)
                //case 5: break; //ServiceMissing (The audio cannot be played because the media service could not be instantiated.)
            default: mp3 = "";stopStream(); radioStation = errorString;break}

            console.log("ERROR: "+error+" ("+errorString+") POSITIONS: "+position)
        }

        onPaused: stopStream()

        //onPlaying: console.log("PLAYING")

        onPlaybackStateChanged: {
            switch (playbackState) {
                case 0: streaming = false; break
                case 1: if (userPlay == 2 && !streaming) streaming = true; else if (userPlay == 2 && streaming && status == 6) stopStream(); break
                case 2: if (userPlay == 2) streaming = false; break //;sleepTime = 0
            }
            console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)
        }

        onStatusChanged: {
            //if (status==3  || status == 4) sloading = true//;streaming = false // Audio is loading or buffering
            //if (status == 3 && userPlay == 2) //streaming = false
            if (status == 6) sloading = false //;streaming = true // Audio loaded and buffered
            //if ((status == 7) && state == 0 && userPlay == 2) stop();play() // indication end of media?!? Start playing again!
            //if (status == 7 && state == 0 && userPlay == 2 && position == 0) stop();play()
            //console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)
        }
    }
    initialPage: Component { CountryChooser { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}
