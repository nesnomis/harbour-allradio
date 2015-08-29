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
property string ctitle: ""
property string picon: "../harbour-allradio.png"
property string ficon: ""
property string cicon: ""
property string radioStation: ""
property string website: ""
property int sleepTime: 0
property int userPlay: 0 // 0 Stopped, 1 Paused, 2 Playing
property bool favorites: false
property bool showPlayer: true;
property string country
property string filter: ""
property string key: "title"
property bool sloading: false
property bool streaming: false

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
    userPlay=0;
    playMusic.stop();
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
        if (sleepTime == 1) { pauseStream();sleepTime = 0;} else sleepTime = (sleepTime = -1);
    }
    running: sleepTime > 0
}

Audio {
        id: playMusic
        source: mp3
        autoPlay: true

        onStopped:{
            console.log("Stopped")
        }

        onError: {
            switch (error) {
                //case 0: break
                case 1: sloading = false; streaming = false; userPlay = 0; mp3 = "";stop(); radioStation = errorString;break
                //case 2: break
                case 3: if (userPlay == 2 && errorString !== "File Not Found") {
                            sloading = false;
                            streaming = false;
                            play();
                        }
                        else if (userPlay == 2 && errorString == "Server does not support seeking.") {
                            pauseStream()
                            playStream();
                        } ; break
                //case 4: break
                //case 5: break
            default: {
                sloading = false; streaming = false; stop()
                radioStation = errorString
                } ; break

            }

            console.log("ERROR: "+error+" ("+errorString+")")
        }

        onPaused: {
            streaming = false
            console.log("--- PAUSED ---")
        }


        onPlaybackStateChanged: {
            switch (playbackState) {
                case 0: streaming = false; break
                case 1: if (userPlay == 2 && !streaming) streaming = true; else if (userPlay == 2 && streaming && status == 6) pauseStream(); break
                case 2: if (userPlay == 2) streaming = false; break //;sleepTime = 0
            }
            console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)
        }

        onStatusChanged: {
            if (status == 2 || status==3  || status == 4) sloading = true//;streaming = false
            //if (status == 3 && userPlay == 2) //streaming = false
            if (status == 6) sloading = false //;streaming = true
            //console.log(radioStation+":")
            //console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)
            //console.log("STATE: "+playbackState + " STATUS: "+status+" sloading = "+sloading+" Streaming = "+streaming)

        }

        }

initialPage: Component {CountryChooser {}}

cover: Component {CoverPage {}}
}
