import QtQuick 2.0
import Sailfish.Silica 1.0

//import QtWebKit 3.0

Page {
    id: page
    property alias surl: webView.url

    allowedOrientations: Orientation.All



    SilicaWebView {
        id: webView

        anchors.fill: parent

        //interactive: false
        focus: true
        clip: false

        onLoadProgressChanged: console.log(" *** PROGRESS: "+loadProgress)


        //url: ""

        onUrlChanged: console.log("   ***   "+surl)


        experimental.userAgent: "Mozilla/5.0 (Maemo; Linux; U; Jolla; Sailfish; like Android) AppleWebKit/538.1 (KHTML, like Gecko) Version/5.1 Chrome/30.0.0.0 Mobile Safari/538.1 (compatible)"
        experimental.transparentBackground: false

        experimental.preferences.minimumFontSize: 12
        experimental.preferences.defaultFontSize: 16
        experimental.preferences.defaultFixedFontSize: 14

        experimental.customLayoutWidth: page.width / devicePixelRatio
        experimental.deviceWidth: page.width / devicePixelRatio
        experimental.overview: true
   //     settings.devicePixeRatio: 1.5



        // Helps rendering websites that are only optimized for desktop
        experimental.preferredMinimumContentsWidth: 980

        smooth: false
        maximumFlickVelocity: Theme.maximumFlickVelocity / 2

        width: {
            if (!page.orientationTransitionRunning) {
                if (page.orientation == Orientation.Portrait || page.orientation == Orientation.PortraitInverted)  {
                    page.width
                } else {
                    page.height
                }
            }
        }
        height: { //page.height - 20 // minimized toolbar size. We don't want to set the toolbar.height here otherwise it would make webview resizing which is painfully slow
            if (!page.orientationTransitionRunning) {
                if (page.orientation == Orientation.Portrait || page.orientation == Orientation.PortraitInverted)  {
                    page.height
                } else {
                    page.width
                }
            }
        }

        Component.onCompleted: {
            console.log ("Check now for experimental features only available in certain QtWebkit versions...")
            // Check for Features only supported in certain QtWebkit versions here and enable them if available
            if (typeof(experimental.preferences.javascriptCanOpenWindows) !== "undefined") {
                experimental.preferences.javascriptCanOpenWindows = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.javascriptCanOpenWindows \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.mediaSourceEnabled) !== "undefined") {
                experimental.preferences.mediaSourceEnabled  = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.mediaSourceEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.mediaPlaybackRequiresUserGestureEnabled) !== "undefined") {
                experimental.preferences.mediaPlaybackRequiresUserGestureEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.mediaPlaybackRequiresUserGestureEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.dnsPrefetchEnabled) !== "undefined") {
                experimental.preferences.dnsPrefetchEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.dnsPrefetchEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.autoLoadImages) !== "undefined") {
                experimental.preferences.autoLoadImages = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.autoLoadImages \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.offlineWebApplicationCacheEnabled) !== "undefined") {
                experimental.preferences.offlineWebApplicationCacheEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.offlineWebApplicationCacheEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.pluginsEnabled) !== "undefined") {
                experimental.preferences.pluginsEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.pluginsEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.notificationsEnabled) !== "undefined") {
                experimental.preferences.notificationsEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.notificationsEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.caretBrowsingEnabled) !== "undefined") {
                experimental.preferences.caretBrowsingEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.caretBrowsingEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.webAudioEnabled) !== "undefined") {
                experimental.preferences.webAudioEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.webAudioEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.xssAuditingEnabled) !== "undefined") {
                experimental.preferences.xssAuditingEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.xssAuditingEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.fullScreenEnabled) !== "undefined") {
                experimental.preferences.fullScreenEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.fullScreenEnabled \\o/ Enabling it.")
            }
            if (typeof(experimental.preferences.webGLEnabled) !== "undefined") {
                experimental.preferences.webGLEnabled = true
                console.log("Hurray you are using a QtWebkit version that supports experimental.preferences.webGLEnabled \\o/ Enabling it.")
            }




        }

        experimental.onMessageReceived: {
            console.log('***** onMessageReceived: ' + message.data );
        }
        property variant devicePixelRatio: {//1.5
            if (Screen.width <= 540) return 1.5;
            else if (Screen.width > 540 && Screen.width <= 768) return 2.0;
            else if (Screen.width > 768) return 3.0;
            console.log("**** SCREEN: "+Screen.width)
        }



    }



}
