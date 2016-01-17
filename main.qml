import QtQuick 2.5
import Bfh 1.0

Item {
    id: app
    signal quit;

    Component.onCompleted: {
        console.log("Hello App");
    }

    Timer {
        property int newInterval:100

        id:timer
        interval: 100
        repeat: false
        running: true
        onTriggered: {
            interval = newInterval;
            start();
            ioc.setState(IoController.Led4,! ioc.isLedActive(IoController.Led4));
        }
    }

    IoController {
       id: ioc
       Component.onCompleted: {
           setState(IoController.Led1, true);
       }
       onButtonPressed: {
           if(button === IoController.Button1) {
               console.log("Bye app");
               quit();
           }
       }
       onPotiValueChanged: {
         console.log("poti value",newValue);
         timer.newInterval = newValue*1000 + 100;
       }
    }

}
