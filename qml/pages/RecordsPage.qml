import QtQuick 2.0
import QtQuick.LocalStorage 2.0
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

    function getEmptyText() {
        if (listModel.count > 0) {
            return ""
        } else {
            return qsTr("#dontHaveRecordsText")
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
        text: getEmptyText()
        font.pixelSize: Theme.fontSizeMedium
        font.bold: true
        textFormat: Text.Center
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
    }

    function loadFromDatabase() {
        var db = LocalStorage.openDatabaseSync("Records", "1.0", "RecordsDB", 1000);

        db.transaction(
            function(tx) {
                tx.executeSql('CREATE TABLE IF NOT EXISTS Records(name TEXT, score INT, date TEXT)');

                var rs = tx.executeSql('SELECT * FROM Records');

                for(var i = 0; i < rs.rows.length; i++) {
                    var item = rs.rows.item(i)

                    listModel.append({
                        "name": item.name,
                        "score": item.score,
                        "date": item.date
                    })
                };
            }
        )
    }

    Component.onCompleted: loadFromDatabase()

    ListModel {
        id: listModel
    }

    SilicaListView {
        id: recordsList
        objectName: "recordsList"
        width: parentLayout.width
        height: parentLayout.height
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        model: listModel
        delegate: Item {
           width: recordsList.width
           height: Theme.itemSizeMedium
           Label {
               text: model.date
               color: "#FEE497"
           }
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
