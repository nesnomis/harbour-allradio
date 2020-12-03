import QtQuick 2.0
import QtMultimedia 5.6
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0
import "pages"
import "js/favorites.js" as Db
import "js/stream.js" as Stream
import "../qml/JSONListModel"
import org.nemomobile.mpris 1.0 //MPRIS



ApplicationWindow {
    id: window
    property bool internal: false
    property variant dbModel: favChannels
    property alias mp3: playMusic.source
    property string ctitle: ""
    property string picon: "../allradio-data/images/allradio.png"
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
    //property int currentid
    property string currentid
    property string currentStation: ""
    property bool allready: ready1 && ready2 ? true : false
    property bool ready1: false
    property bool ready2: false
    property string useragent: "AllRadio/"+Qt.application.version+" (SailfishOS; Linux) nesnomis@gmail.com"
    property MprisPlayer mpris: mprisPlayer // MPRIS

    GetStationUrl {
        id: getStationUrl
        get: true

        onReadyChanged: {
            if (ready) {

                simple.stationuuid ? cpsplay(simple.url_resolved) : simple.url_resolved ? cpsplay(simple.url_resolved) : console.log("ERROR!!!")

                currentid = simple.stationuuid
                console.log(simple.url)
                ready1 = true
            }
        }
    }

    GetStationUrl {
        id: seearchStation
        get: false

        onReadyChanged: {
            if (ready) {
                simple.stationuuid ? cpsplay(simple.url_resolved) : simple.url_resolved ? cpsplay(simple.url_resolved) : console.log("ERROR!!!")
                currentid = simple.stationuuid
                ready2 = true
                //console.log(simple.url)
            }
        }
    }

    function getAll(hls,codec) {
        var h =false
        var retVal = ""
        if (codec === "UNKNOWN") codec=""
        if (hls === "1") h = true
        if (h) retVal = "[HLS] "
        if (codec && codec !== "UNKNOWN") retVal = retVal + "[" + codec+"] "
        //if (bitrate && bitrate > 0) retVal = retVal + "[" + bitrate + "]"

        return retVal
    }

    function playStream() {
        //playMusic.stop()
        if (currentStation !== "") {radioStation = currentStation; currentStation = ""}
        sloading = true
        userPlay=2;
        mp3 = currentUrl
        if (!showPlayer)
            showPlayer = true
    }

    function stopStream() {
        playMusic.stop()
        currentUrl = mp3
        userPlay=0;
        mp3 = ""
        sloading = false
    }

    function cps(uuid,url_resolved) {
        //getStationUrl.source = "http://all.api.radio-browser.info/v2/json/url/"+id


        getStationUrl.source = "http://all.api.radio-browser.info/json/stations/byuuid/"+uuid
      //  cpsplay(url_resolved)
      //  currentid = uuid


        //http://all.api.radio-browser.info/{format}/stations/byuuid/{searchterm}
        //ps(source)
        //http://all.api.radio-browser.info/json/stations  all station
    }

    function cpsplay(source) {
        playMusic.stop()
        mp3 = ""
        userPlay = 0
        sloading = true
        mp3 = source
        userPlay = 2
        currentUrl = mp3
        //playStream()
    }

    function ps(source) {
        playMusic.stop()
        mp3 = ""
        userPlay = 0
        sloading = true;
        Stream.func(source)
        userPlay = 2
        currentUrl = mp3
        //playStream()
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

    function updateDb(oldsource,id,lastchangetime,source,title,site,tags,icon,codec,bitrate) {
        Db.del(oldsource)
        Db.add(id,lastchangetime,source,title,site,tags,icon,codec,bitrate)
        Db.load(favChannels)
    }

    function addDb(id,lastchangetime,source,title,site,tags,icon,codec,bitrate) {
        Db.add(id,lastchangetime,source,title,site,tags,icon,codec,bitrate)
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
    CountryModelCommunity {id: countryModelCommunity}

    function findCountry(land) {  // Get translated countryname
        for(var i = 0; i < countryModelCommunity.count; i++) {
            var current = countryModelCommunity.get(i);
            if(land === current.coid) {
                return countryModelCommunity.countryname(i)
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
        autoLoad: false

        onError: {
            console.log("ERROR: " + error + " STRING: " + errorString)
            switch (error) {
            case 0: break;
            case 1: stopStream();mp3 = ""; radioStation = error + " " + errorString;break
            case 4: stopStream();mp3 = ""; radioStation = error + " " + errorString;break
            case 5: stopStream();mp3 = ""; radioStation = error + " " + errorString;break
                //case 3: if (userPlay == 2 && errorString !== "File Not Found") {mp3 = "";stopStream(); radioStation = errorString;userPlay = 0};break
            case 3: currentStation = radioStation; stopStream(); radioStation = errorString;break
            default: mp3 = "";stopStream(); radioStation = error + " " + errorString;break
            }
        }

        onPaused: stopStream()

        onStopped: {if (userPlay == 2) playStream();streaming = false}

        onPlaying: {sloading = false;streaming = true}

        onPlaybackStateChanged: {
            updatePlaybackStatus(); //MPRIS
            updateMprisMetadata(); //MPRIS

            switch (playbackState) {
            case 0: streaming = false; break
            case 1: if (userPlay == 2 && !streaming) streaming = true; else if (userPlay == 2 && streaming && status == 6) stopStream(); break
            case 2: if (userPlay == 2) streaming = false; break //;sleepTime = 0
            }
        }

        //   onBufferProgressChanged: if (bufferProgress == 1) sloading = false //{play();sloading = false} //console.log(bufferProgress.toString())

        onStatusChanged: {
            console.log("STATUS" + status)
            if (status == 4) sloading = false
            //if (status == Audio.buffered) console.log("AUDIO BUFFERED")     //;streaming = true // Audio loaded and buffered
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

    /* PRELOAD TAGS AND COUNTRIES */
    JSONListModel {
        id: getTags
        source: "http://all.api.radio-browser.info/json/tags"
        query: "$[?(@.stationcount>6)]"
    }

    JSONListModel {
        id: getCountries
        source: internal ? "" : "http://all.api.radio-browser.info/json/countries"  //?hidebroken=true&order=stationcount"
        query: internal ? "$[*]" : "$[?(@.stationcount>0)]"
        get: false
    }
    /* -------------------------- */

    initialPage: Component { Favorites { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: Orientation.Portrait | Orientation.Landscape
    _defaultPageOrientations: Orientation.Portrait | Orientation.Landscape
}
