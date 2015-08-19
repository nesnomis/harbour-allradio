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
property alias mp3: playMusic.source
property variant dbModel: favChannels
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
property string deBug: ""
property int sleepTime: 0
property int playerError: -1
property int playerState: -1
property int playerStatus: -1
property int userPlay: 0 // 0 Stopped, 1 Paused, 2 Playing

Debug {
    id: debugPage
}

function pauseStream() {userPlay = 1; playMusic.pause(); playMusic.playing = false;}
function playStream() {userPlay=2; playMusic.play(); playMusic.playing = true;playerError = 0/*;deBug = ""*/;}
function stopStream() {userPlay=0; playMusic.stop(); playMusic.playing = false; sleepTime = 0/*cicon="../harbour-allradio.png"*/;radioStation="AllRadio";}

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

ListModel{
    id: favChannels
}

//MinutesPicker{
//    id: minutesSlider
//}

Timer {
    id: sleepTimer
    interval: 60000
    repeat: false
    onTriggered: {(sleepTime == 1) ? stopStream() : sleepTime = (sleepTime - 1); console.log("sleepTimer running")}
    running: sleepTime > 0
}

Audio {
        id: playMusic
        source: mp3
        autoPlay: true
        property bool playing: false

        onStopped:{
            //debugPage.debug("Stopped: (ps:"+playerState+" sc:"+playerStatus+" er:"+playerError+(")") )
            console.log(mp3)
            if (playerState == 1 && userPlay != 0 && (playerStatus == 6 || playerStatus == 7)) playStream()
            if (userPlay == 2 && userPlay != 0 && (playerStatus == 4 || playerStatus == 6)) playStream()
        }

        onError: {
            //debugPage.debug("error:" + error + " (" + errorString + ")\n( --- ps:"+playerState+" sc:"+playerStatus+" er:"+playerError+")")
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
                case 0: /*debugPage.debug("sc: 0");*/ break
                case 1: /*debugPage.debug("sc: 1 (no stream?)");*/ playerStatus = 1; break
                case 2: /*debugPage.debug("sc: 2 (no stream?)");*/ playerStatus = 2; break
                case 3: /*debugPage.debug("sc: 3 (stopped)");*/ playerStatus = 3; break
                case 4: /*debugPage.debug("sc: 4 (Loading)");*/ playerStatus = 4; break
                case 5: /*debugPage.debug("sc: 5");*/ playerStatus = 5; break
                case 6: /*debugPage.debug("sc: 6 (Loaded)");*/ playerStatus = 6; ; break
                case 7: /*debugPage.debug("sc: 7");*/ playerStatus = 7; break
                case 8: /*debugPage.debug("sc: 8");*/ playerStatus = 8; break
                case 9: /*debugPage.debug("sc: 9");*/ playerStatus = 9; break
                case 10:/* debugPage.debug("sc: 10");*/ playerStatus = 10; break
            }
        }

        }

initialPage: CountryChooser {}

cover: CoverPage {}
}
