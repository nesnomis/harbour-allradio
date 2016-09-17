import QtQuick 2.0
import QtMultimedia 5.0
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "pages"
import "js/favorites.js" as Db
import "js/stream.js" as Stream
import org.nemomobile.mpris 1.0 //MPRIS

ApplicationWindow {
id: window
property variant dbModel: favChannels
property alias mp3: playMusic.source
//property string mp3: ""
property string ctitle: ""
property string picon: "../harbour-allradio.png"
property string ficon: ""
property string cicon: ""
property string radioStation: "AllRadio"
property string metaInfo: playMusic.metaData.title ? playMusic.metaData.title : ""
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
property MprisPlayer mpris: mprisPlayer // MPRIS

function playStream() {
    userPlay=2;
    mp3 = currentUrl
    if (!showPlayer)
        showPlayer = true
}

function stopStream() {
    currentUrl = mp3
    userPlay=0;
    mp3 = ""
    sloading = false
}

function ps(source) {
        playMusic.stop()
        mp3 = ""
        userPlay = 0
        sloading = true;
        Stream.func(source);
        userPlay = 2
        currentUrl = mp3
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

function findCountry(land) {  // Get translated countryname
    for(var i = 0; i < countryModel.count; i++) {
      var current = countryModel.get(i);
      if(land === current.coid) {
          return countryModel.countryname(i)
      }
    }
}

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
        autoPlay: true

        onError: {
            console.log("ERROR: " + errorString)
            switch (error) {
                case 0: break;
                case 3: if (userPlay == 2 && errorString !== "File Not Found") {mp3 = "";stopStream(); radioStation = errorString;userPlay = 0};break
                default: mp3 = "";stopStream(); radioStation = errorString;break
            }
        }

        onPaused: stopStream()

        onStopped: {if (userPlay == 2) playStream();streaming = false}

        onPlaying: {sloading = false;streaming = true}

        //onMetaDataChanged: console.log("metadatachanged")
        //onStatusChanged:

        onPlaybackStateChanged: {
            updatePlaybackStatus(); //MPRIS
            updateMprisMetadata(); //MPRIS

            switch (playbackState) {
                case 0: streaming = false; break
                case 1: if (userPlay == 2 && !streaming) streaming = true; else if (userPlay == 2 && streaming && status == 6) stopStream(); break
                case 2: if (userPlay == 2) streaming = false; break //;sleepTime = 0
            }
        }

        onStatusChanged: {
            if (status == 6) sloading = false //;streaming = true // Audio loaded and buffered
            updateMprisMetadata(); //MPRIS
        }

    }

//MPRIS

function updateMprisMetadata(){
        mprisPlayer.song = metaInfo ? metaInfo : ""
        mprisPlayer.artist = radioStation === "" ? "AllRadio" : radioStation
        updatePlaybackStatus()
}

function updatePlaybackStatus (){
    switch (playMusic.playbackState) {
        case Audio.PlayingState:
            mprisPlayer.playbackStatus = Mpris.Playing
            break;

        case Audio.PausedState:
            mprisPlayer.setCanPause(false)
            mprisPlayer.playbackStatus = Mpris.Paused
            break;
        case Audio.StoppedState:
            mprisPlayer.playbackStatus = Mpris.Paused
            break;
        default:
            mprisPlayer.playbackStatus = Mpris.Paused
    }
}

onRadioStationChanged: mprisPlayer.artist = radioStation
onMetaInfoChanged: mprisPlayer.song = metaInfo

 MprisPlayer {
    id: mprisPlayer
    property string song: ""
    property string artist: "AllRadio"

    serviceName: "harbour-allradio"

    identity: "AllRadio"
    supportedUriSchemes: ["file"]
    supportedMimeTypes: ["audio/x-wav", "audio/x-vorbis+ogg", "audio/mpeg", "audio/mp4a-latm", "audio/x-aiff"]

    canControl: true

    canGoNext: false //appstate.playlistIndex < appstate.playlist.count
    canGoPrevious: false // appstate.playlistIndex > 0
    canPause: true
    canPlay: true

    canSeek: false// playback.seekable
    hasTrackList: false
    playbackStatus: Mpris.Stopped
    loopStatus: Mpris.None
    shuffle: false
    volume: 1
    //song: metaInfo
    //artist: radioStation
    onPauseRequested:{
        stopStream();
    }

    onPlayRequested: {
        playStream();
    }
    onPlayPauseRequested: {
        stopStream();
    }
    onStopRequested: {
        stopStream();
    }
    onNextRequested: {
        if(appstate.playlistIndex < appstate.playlist.count){
            playIndex(appstate.playlistIndex+1, {isplaying: !!playback.isPlaying});
        }
    }
    onPreviousRequested: {
        if(appstate.playlistIndex > 0){
            playIndex(appstate.playlistIndex-1, {isplaying: !!playback.isPlaying});
        }
        else {
            playIndex(0, {isplaying: !!playback.isPlaying});
        }
    }
    onSeekRequested: {
        playback.position = playback.position + offset
        message.lastMessage = "Seeked requested with offset - " + offset + " microseconds"
                    emitSeeked()
    }
    onSetPositionRequested: {
        playback.position = position
        message.lastMessage = "Position requested to - " + position + " microseconds"
    }
    onOpenUriRequested: message.lastMessage = "Requested to open uri \"" + url + "\""

    onLoopStatusRequested: {
    }

    onShuffleRequested: {
    }

    onArtistChanged: {
        var metadata = mprisPlayer.metadata

        metadata[Mpris.metadataToString(Mpris.Artist)] = artist // List of strings
        metadata[Mpris.metadataToString(Mpris.Title)] = song // List of strings
        mprisPlayer.metadata = metadata
    }

    onSongChanged: {
        var metadata = mprisPlayer.metadata

        metadata[Mpris.metadataToString(Mpris.Artist)] = artist // List of strings
        metadata[Mpris.metadataToString(Mpris.Title)] = song // List of strings
        mprisPlayer.metadata = metadata
    }
}

// MPRIS END

    initialPage: Component { Favorites { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.All
    _defaultPageOrientations: Orientation.All
}
