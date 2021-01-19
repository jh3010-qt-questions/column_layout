import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
  id: theWindow

  width: 640
  height: 480
  visible: true
  title: qsTr("Hello World")

  property alias itemACheck: itemACheck
  property alias itemBCheck: itemBCheck
  property alias itemCCheck: itemCCheck

  property alias itemCLabel: itemCLabel


  Column {
      id: itemList

      anchors.verticalCenter: parent.verticalCenter
      anchors.horizontalCenter: parent.horizontalCenter

      spacing: 8

      TextMetrics {
          id: metrics

          font: itemCLabel.font
          text: itemCLabel.text

          property real maxWidth: theWindow.width * .75

          Component.onCompleted:
          {

            var maxHeight = itemCCheck.height
            var maxWidth  = itemCLabel.width

            console.log( "TextMetrics: onCompleted - maxHeight: ", maxHeight );
            console.log( "TextMetrics: onCompleted - maxWidth:  ", maxWidth );
            console.log( "TextMetrics: onCompleted - pointSize: ", itemCLabel.font.pointSize );
            console.log( "TextMetrics: onCompleted - pointSize: ", itemCCheck.font.pointSize );
            console.log( "TextMetrics: onCompleted - width:     ", metrics.width );

            while( metrics.width > maxWidth || metrics.height > maxHeight )
            {
              itemCLabel.font.pointSize = itemCLabel.font.pointSize - 1

              console.log( "TextMetrics: onCompleted - pointSize: ", itemCLabel.font.pointSize );
            }

            console.log( "TextMetrics: onCompleted - width:     ", metrics.width );

            itemCLabel.width = metrics.width
          }
      }

      Component.onCompleted:
      {
        console.log( "Window onCompleted - ", metrics.height, " ", metrics.width );
      }

      Rectangle {
          id: itemA
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemACheck
              color: "#000000"
              text: "✔️"

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              font.pointSize: 100
              font.bold: true

              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemALabel

              height: parent.height
              width: 200

              text: qsTr("Short")
              font.pointSize: 24

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemACheck.top
              anchors.left: itemACheck.right
              anchors.leftMargin: 8
          }
      }

      Rectangle {
          id: itemB
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemBCheck
              color: "#000000"
              text: "✔️"

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              font.pointSize: 100
              font.bold: true

              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemBLabel

              height: parent.height

              text: qsTr("A longer")
              font.pointSize: 24

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemBCheck.top
              anchors.left: itemBCheck.right
              anchors.leftMargin: 8
          }
      }

      Rectangle {
          id: itemC
          color: "#33666666"
          height: 50
          width: theWindow.width * .75

          Label {
              id: itemCCheck
              color: "#000000"
              text: "✔️"

              width: parent.height
              height: parent.height

              horizontalAlignment: Text.AlignHCenter
              verticalAlignment: Text.AlignVCenter
              font.pointSize: 100
              font.bold: true

              fontSizeMode: Text.Fit
              minimumPointSize: 10
          }

          Label {
              id: itemCLabel

              height: parent.height
              width: parent.width - itemCCheck.width - 8

              text: qsTr("A Little Bit longer")
              font.pointSize: 24

              verticalAlignment: Text.AlignVCenter

              anchors.top: itemCCheck.top
              anchors.left: itemCCheck.right
              anchors.leftMargin: 8
          }
      }
  }

  Button {
    text: "push me"

    onClicked: {
      console.log( "clicked" );
      console.log( itemACheck.font.pointSize );
    }
  }

}
