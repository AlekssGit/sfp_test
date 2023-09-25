import QtQuick 2.15
// import QtQuick.Controls 2.15
import QtQuick.Controls.Fusion
import QtQuick.Dialogs

ApplicationWindow {
    visible: true
    width: 300
    height: 500
    // x: screen.desktopAvailableWidth/2 - 450
    // y: screen.desktopAvailableHeight/2 - 500
    title: "Test ethernet"
    // flags: Qt.FramelessWindowHint | Qt.Window

    property QtObject btn_click
    property QtObject btn_connect_dev
    property QtObject btn_read_ddr_status
    property QtObject btn_init_ddr
    property QtObject btn_start_send_def
    property QtObject btn_stop_send_def
    property QtObject btn_set_pack_to_ddr

    property QtObject packet_time
    property QtObject btn_update_timer
    property string text_timer_reg

    color: "transparent"

    Rectangle {
        objectName: 'main_rect_obj'
        anchors.fill: parent
        color: "gray"

        Rectangle {
            width: 50
            height: 50
            anchors {
                bottom: parent.bottom
                bottomMargin: 12
                right: parent.right
                rightMargin: 12   
            }            
            Button {
                id: okBtn
                text: "OK"
                width: parent.width
                height: parent.height

                onClicked: {
                    
                    btn_click.click()
                }
            }
        }

        Rectangle {
            id: connectRect
            width: 60
            height: 50
            anchors {
                top: parent.top
                topMargin: 12
                left: parent.left
                leftMargin: 12   
            }            
            Button {
                id: connectBtn
                text: "Connect to dev"
                width: parent.width
                height: parent.height
                contentItem: Text {
                    text: connectBtn.text
                    font: connectBtn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter                    
                    wrapMode: Text.WordWrap
                }
                onClicked: {
                    btn_connect_dev.click()
                }
            }
        }

        Rectangle {
            id: initDdrRect
            width: 60
            height: 50
            anchors {
                top: parent.top
                topMargin: 12
                left: connectRect.right
                leftMargin: 12  
            }            
            Button {
                id: initDdrBtn
                text: "init ddr"
                width: parent.width
                height: parent.height

                onClicked: {
                    btn_init_ddr.click()
                }
            }
        }

        Rectangle {
            width: 60
            height: 50
            anchors {
                top: parent.top
                topMargin: 12
                left: initDdrRect.right
                leftMargin: 12  
            }          
            Button {
                id: readDdrStBtn
                text: "read ddr status"
                width: parent.width
                height: parent.height
                contentItem: Text {
                    text: readDdrStBtn.text
                    font: readDdrStBtn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter                    
                    wrapMode: Text.WordWrap
                }
                onClicked: {
                    btn_read_ddr_status.click()
                }
            }
        }


        Rectangle {
            id: startSendDefRect
            width: 60
            height: 50
            anchors {
                top: connectRect.bottom
                topMargin: 12
                left: parent.left
                leftMargin: 12  
            }             
            Button {
                id: startSendDefPackBtn
                text: "start send def pack"
                width: parent.width
                height: parent.height
                contentItem: Text {
                    text: startSendDefPackBtn.text
                    font: startSendDefPackBtn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter                    
                    wrapMode: Text.WordWrap
                }
                onClicked: {
                    btn_start_send_def.click()
                }
            }
        }
        Rectangle {
            id: stopSendDefRect
            width: 60
            height: 50
            anchors {
                top: connectRect.bottom
                topMargin: 12
                left: startSendDefRect.right
                leftMargin: 12  
            }             
            Button {
                id: stopSendDefPackBtn
                text: "stop send def pack"
                width: parent.width
                height: parent.height
                contentItem: Text {
                    text: stopSendDefPackBtn.text
                    font: stopSendDefPackBtn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter                    
                    wrapMode: Text.WordWrap
                }
                onClicked: {
                    btn_stop_send_def.click()
                }
            }
        }

        Rectangle {
            id: setPackDdrRect
            width: 60
            height: 50
            anchors {
                top: connectRect.bottom
                topMargin: 12
                left: stopSendDefRect.right
                leftMargin: 12  
            }             
            Button {
                id: setPackToDdrBtn
                text: "set pack to ddr"
                width: parent.width
                height: parent.height
                contentItem: Text {
                    text: setPackToDdrBtn.text
                    font: setPackToDdrBtn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter                    
                    wrapMode: Text.WordWrap
                }
                onClicked: {
                    btn_set_pack_to_ddr.click()
                }
            }
        }

        Rectangle {
            id: timer2Rect
            width: 160
            height: 80
            anchors {
                top: startSendDefRect.bottom
                topMargin: 12
                left: parent.left
                leftMargin: 12  
            }             

            Label {
                id: textTimer
                anchors.top: parent.top
                anchors.topMargin: 0
                text: text_timer_reg
                font.pixelSize: 12
                color: "Black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                background: Rectangle {
                    width: timer2Rect.width - 40
                    height: timer2Rect.height/2
                    color: inputTimer.enabled ? "transparent" : "#353637"
                    border.color: inputTimer.enabled ? "black" : "transparent"
                }
            }

            TextField {
                id: inputTimer
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                font.pixelSize: 16
                color: "Black"
                horizontalAlignment: Text.AlignLeft

                placeholderText: qsTr("Enter timer ch2 val")
                
                background: Rectangle {
                    width: timer2Rect.width
                    height: timer2Rect.height/2
                    color: inputTimer.enabled ? "transparent" : "#353637"
                    border.color: inputTimer.enabled ? "black" : "transparent"
                }
                onAccepted: {
                    packet_time.value_changed(inputTimer.text)
                }
            }

            Rectangle {
                id: updateTimerRect
                width: 40
                height: 40
                anchors {
                    top: parent.top
                    topMargin: 0
                    right: parent.right
                    rightMargin: 0  
                }             
                Button {
                    id: updateTimerBtn
                    text: "update"
                    width: parent.width
                    height: parent.height
                    contentItem: Text {
                        text: updateTimerBtn.text
                        font: updateTimerBtn.font
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter                    
                        // wrapMode: Text.WordWrap
                    }
                    onClicked: {
                        btn_update_timer.click()
                    }
                }
            }

        }        
    }

    // Connections {
    //     target: btn_click
    // }

    Connections {
        target: packet_time

        function onUpdated(msg) {
            text_timer_reg = msg            
        }     
    }
}