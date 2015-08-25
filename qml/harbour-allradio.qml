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
property string musicSource: ""
property string website: ""
property string ms: ""
property string country
property int sleepTime: 0
property int playerError: -1
property int playerState: -1
property int playerStatus: -1
property int userPlay: 0 // 0 Stopped, 1 Paused, 2 Playing
property bool favorites: false
property bool showPlayer: true;
property bool showSearch: false;
property string filter: ""
property string key: "title"

function pauseStream() {userPlay = 1; playMusic.pause(); playMusic.playing = false;}
function playStream() {userPlay=2; playMusic.play(); playMusic.playing = true;playerError = 0;if (!showPlayer) showPlayer = true}
function stopStream() {userPlay=0; playMusic.stop(); playMusic.playing = false; sleepTime = 0;}

function ps(source) {
    mp3 = ""
    Stream.func(source);
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
    onTriggered: {(sleepTime == 1) ? stopStream() : sleepTime = (sleepTime - 1);}
    running: sleepTime > 0
}

Audio {
        id: playMusic
        source: mp3
        autoPlay: true
        property bool playing: false

        onStopped:{
            if (playerState == 1 && userPlay != 0 && (playerStatus == 6 || playerStatus == 7)) playStream()
            if (userPlay == 2 && userPlay != 0 && (playerStatus == 4 || playerStatus == 6)) playStream()
        }

        onError: {
            switch (error) {
                case 0: playerError = 0;break
                case 1: playerError = 1;if (playerState == 0 && playerStatus == 2) stopStream();break //unable to stream
                case 2: playerError = 2;break
                case 3: playerError = 3;if (userPlay == 2 && (playerStatus !==4 || playerStatus !==6)) stopStream(); break  //different errors... not shure if ok to stop allways
                case 4: playerError = 4;break
                case 5: playerError = 5;break //no avilable service
            }

        }

        onPlaybackStateChanged: {
            switch (playbackState) {
                case 0: playerState = 0;  break
                case 1: playerState = 1; break
                case 2: playerState = 2; if (userPlay == 2) playStream() ;break
                case 3: playerState = 3; if (userPlay == 2) playStream(); break
                case 4: playerState = 4; break
                case 5: playerState = 5; break
            }
        }

        onStatusChanged: {
            switch (status) {
                case 0: break
                case 1: playerStatus = 1; break
                case 2: playerStatus = 2; break
                case 3: playerStatus = 3; break
                case 4: playerStatus = 4; break
                case 5: playerStatus = 5; break
                case 6: playerStatus = 6; break
                case 7: playerStatus = 7; break
                case 8: playerStatus = 8; break
                case 9: playerStatus = 9; break
                case 10:playerStatus = 10; break
            }
        }

        }

initialPage: Component {CountryChooser {}}

cover: Component {CoverPage {}}
}
