import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: parentLayout
    objectName: "mainPage"
    allowedOrientations: Orientation.Portrait

    Rectangle {
        id: backgroundGradient
        width: parentLayout.width;
        height: parentLayout.height
        //rotation: 225
        gradient: Gradient {
            GradientStop {
                position: 0.0;
                color: "#000000"
            }
            GradientStop {
                position: 1.0;
                color: "#007AFE"
            }
        }
    }

    Button {
        id: resumeGameButton
        objectName: "resumeGameButton"
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: startGameButton.top
            bottomMargin: 100
        }
        border.color: "#FEE497"
        border.highlightColor: "#FEE497"
        color: "#FEE497"
        text: qsTr("#resumeGameText")
        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        id: startGameButton
        objectName: "startGameButton"
        width: resumeGameButton.width
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        border.color: palette.primaryColor
        border.highlightColor: palette.highlightColor
        text: qsTr("#startGameText")
        onClicked: pageStack.push(Qt.resolvedUrl("GamingPage.qml"))
    }

    Button {
        id: recordsButton
        objectName: "recordsButton"
        width: resumeGameButton.width
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: startGameButton.bottom
            topMargin: 100
        }
        border.color: palette.primaryColor
        border.highlightColor: palette.highlightColor
        text: qsTr("#recordsText")
        onClicked: pageStack.push(Qt.resolvedUrl("RecordsPage.qml"))
    }

    Label {
        id: creatorName
        objectName: "creatorName"
        anchors {
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
            margins: Theme.horizontalPageMargin
        }
        color: palette.highlightColor
        font.pixelSize: Theme.fontSizeSmall
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        text: qsTr("#creatorTitle")
    }
}
