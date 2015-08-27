import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "pages"
import "cover"
import "js/favorites.js" as Db
import "js/stream.js" as Stream

ApplicationWindow {
id: window
property variant dbModel: favChannels
property alias mp3: playMusic.source
property string csite: ""
property string csource: ""
property string csection: ""
property string ctitle: "AllRadio"
property string picon: "../harbour-allradio.png"
property string ficon: ""
property string cicon: ""
property string radioStation: "AllRadio"
property string website: ""
property string ms: ""
property int sleepTime: 0
property int userPlay: 0 // 0 Stopped, 1 Paused, 2 Playing
property bool favorites: false
property bool showPlayer: true;
property string country
property string filter: ""
property string key: "title"
property bool sloading: false
property bool streaming: false
property string current: ""

function pauseStream() {
    userPlay = 1;
    playMusic.pause();
    streaming = false
    sloading = false
}

function playStream() {
    userPlay=2;
    playMusic.play();
    streaming = true
    if (!showPlayer)
        showPlayer = true
}

function stopStream() {
    picon = "../harbour-allradio.png"
    radioStation = "AllRadio"
    mp3 = "";
    userPlay=0;
    playMusic.stop();
    sleepTime = 0;
    streaming = false
    sloading = false
}

function ps(source) {
    if (current !== source) {
        current = source
        sloading = true;
        Stream.func(source);
        playStream()
    }
}

function unknownError() {
    radioStation = "Uknown Error"
    mp3 = "";
    userPlay=0;
    sleepTime = 0;
    streaming = false
    sloading = false
}

function dropDb() {
    Db.drop()
    Db.initialize()
    Db.load(favChannels)
}

function addDb(source,title,site,section,icon) {
    Db.add(source,title,site,section,icon)
    Db.load(favChannels)
}

function delDb(source) {
    Db.del(source)
    Db.load(favChannels)
}

Component.onCompleted: {
    Db.initialize()
    Db.load(favChannels)
}

CountryModel {
    id: countryModel
}

ListModel{
    id: favChannels
}

Timer {
    id: sleepTimer
    interval: 60000
    repeat: false
    onTriggered: {
        (sleepTime == 1) ? stopStream() : sleepTime = (sleepTime - 1);
    }
    running: sleepTime > 0
}

Audio {
        id: playMusic
        source: mp3
        autoPlay: true

        onStopped:{
            //if (playerState == 1 && userPlay != 0 && (playerStatus == 6 || playerStatus == 7)) playStream()
            //if (userPlay == 2 && userPlay != 0 && (playerStatus == 4 || playerStatus == 6)) playStream()
        }

        onError: {
            if (error == 1) sloading = false; streaming = false; userPlay = 0; mp3 = "";stop(); radioStation = errorString
            if (error == 3 && userPlay == 2) sloading = false; streaming = false; play()
            console.log("ERROR: "+error+" ("+errorString+")")
        }

//        onPlaybackStateChanged: {
//        }

        onStatusChanged: {
            if (status == 2 || status==3  || status == 4) sloading = true;streaming = false
            if (status == 3 && userPlay == 2) streaming = false
            if (status == 6) sloading = false;streaming = true
            console.log(radioStation+":")
            console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)
        }

        }

initialPage: Component {CountryChooser {}}

cover: Component {CoverPage {}}
}
