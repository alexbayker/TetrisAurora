import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: parentLayout
    objectName: "recordsPage"
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

    Label {
        id: dontHaveRecordsText
        objectName: "dontHaveRecordsText"
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }
        color: "#FEE497"
        text: qsTr("#dontHaveRecordsText")
        font.pixelSize: Theme.fontSizeMedium
        lineCount: 1
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    SilicaListView {
        id: recordsList
        objectName: "recordsList"
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
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
