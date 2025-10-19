import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import Sailfish.Silica 1.0

Page {
    id: parentLayout
    objectName: "gamingPage"
    allowedOrientations: Orientation.Portrait

    Rectangle {
        id: backgroundGradient
        width: parentLayout.width
        height: parentLayout.height
        //rotation: 225
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "#000000"
            }
            GradientStop {
                position: 1.0
                color: "#007AFE"
            }
        }
    }

    Rectangle {
        id: gamingLayout
        width: (parentLayout.width * 1.0 / 15.0) * 10
        height: (parentLayout.width * 1.0 / 15.0) * 20
        anchors {
            left: parent.left
            right: previewLayout.left
            verticalCenter: parent.verticalCenter
        }
        border {
            color: "#FFFFFF"
            //highlightColor: "#FFFFFF"
        }
    }

    Label {
        id: levelTitle
        objectName: "levelTitle"
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: gamingLayout.top
        }
        color: "#C86464"
        text: "Level:"
        font.pixelSize: Theme.fontSizeMedium
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    Label {
        id: levelText
        objectName: "levelText"
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: levelTitle.bottom
        }
        color: "#C86464"
        text: "1"
        font {
            bold: true
            pixelSize: Theme.fontSizeMedium
        }
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    Label {
        id: scoreTitle
        objectName: "scoreTitle"
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: levelText.bottom
        }
        color: "#FEE497"
        text: "Score:"
        font.pixelSize: Theme.fontSizeMedium
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    Label {
        id: scoreText
        objectName: "scoreText"
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: scoreTitle.bottom
        }
        color: "#FEE497"
        text: "100"
        font {
            bold: true
            pixelSize: Theme.fontSizeMedium
        }
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    Rectangle {
        id: previewLayout
        width: (parentLayout.width * 1.0 / 15.0) * 4
        height: (parentLayout.width * 1.0 / 15.0) * 4
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: scoreText.bottom
        }
        border {
            color: "#FFFFFF"
            //highlightColor: "#FFFFFF"
        }
    }

    IconButton {
        id: pauseButton
        objectName: "pauseButton"
        anchors {
            left: gamingLayout.right
            right: parent.right
            top: previewLayout.bottom
            bottom: moveButton.top
        }
        icon {
            source: "image://theme/icon-m-pause"
            //source: "image://theme/icon-m-play"
            color: "#FEE497"
        }
        highlighted: true
        onClicked: {
            _actions.rotation()
        }
    }

    IconButton {
        id: moveButton
        objectName: "moveButton"
        anchors {
            left: gamingLayout.right
            right: parent.right
            bottom: rightButton.top
        }
        icon {
            source: "image://theme/icon-s-sync"
            color: "#C86464"
        }
        highlighted: true
        onClicked: {
            var db = LocalStorage.openDatabaseSync("Records", "1.0", "RecordsDB", 1000);
            db.transaction(
                function(tx) {
                    tx.executeSql('CREATE TABLE IF NOT EXISTS Records(name TEXT, score INT, date TEXT)');

                    var now = new Date()
                    var stringTime = now.toLocaleTimeString(Qt.locale(), "HH:mm:ss")

                    var stringDate = now.toLocaleDateString(Qt.locale(), "dd-MM-yyyy")

                    var dateTime = stringTime + " " + stringDate

                    console.log("log completed " + dateTime)

                    tx.executeSql('INSERT INTO Records (name, score, date) VALUES(?, ?, ?)', [ 'Живность', 1000, dateTime]);
                }
            )
        }
    }

    IconButton {
        id: rightButton
        objectName: "rightButton"
        anchors {
            right: previewLayout.right
            bottom: downButton.top
        }
        icon {
            source: "image://theme/icon-s-low-importance"
            rotation: 270
            color: "#FFFFFF"
        }
        highlighted: true
        onClicked: {
            _actions.rotation()
        }
    }

    IconButton {
        id: leftButton
        objectName: "leftButton"
        anchors {
            left: previewLayout.left
            right: rightButton.left
            bottom: downButton.top
        }
        icon {
            source: "image://theme/icon-s-low-importance"
            rotation: 90
            color: "#FFFFFF"
        }
        highlighted: true
        onClicked: {
            _actions.rotation()
        }
    }

    IconButton {
        id: downButton
        objectName: "downButton"
        anchors {
            left: gamingLayout.right
            right: parent.right
            bottom: gamingLayout.bottom
        }
        icon {
            source: "image://theme/icon-s-low-importance"
            color: "#FFFFFF"
        }
        highlighted: true
        onClicked: {
            _actions.rotation()
        }
    }

    Label {
        id: creatorName
        objectName: "creatorName"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            margins: Theme.horizontalPageMargin
        }
        color: "#000000"
        text: qsTr("#creatorTitle")
        font.pixelSize: Theme.fontSizeSmall
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }
}
