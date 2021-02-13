/*
 * Copyright 2017  Tjaart Blignaut <tjaartblig@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */
import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Item {
    
    property alias cfg_enableTimeDisplay: enableTimeDisplay.checked
    property alias cfg_enableTimeShadow: enableTimeShadow.checked
    property alias cfg_timeFormat: timeFormat.text
    property alias cfg_timeFontSize: timeFontSize.value
    property alias cfg_useSystemFontForTime: useSystemFontForTime.checked
    property alias cfg_textTimeFont: timeFontDialog.font
    property alias cfg_useSystemColorForTime: useSystemColorForTime.checked
    property alias cfg_textTimeColor: timeColorPicker.chosenColor
    property alias cfg_timeLetterSpacing: timeLetterSpacing.value
    property alias cfg_timeOpacity: timeOpacity.value
    
    property alias cfg_enableDateDisplay: enableDateDisplay.checked
    
    property alias cfg_enableDateShadow: enableDateShadow.checked
    property alias cfg_dateFormat: dateFormat.text
    property alias cfg_dateFontSize: dateFontSize.value
    property alias cfg_useSystemFontForDate: useSystemFontForDate.checked
    property alias cfg_textDateFont: dateFontDialog.font
    property alias cfg_useSystemColorForDate: useSystemColorForDate.checked
    property alias cfg_textDateColor: dateColorPicker.chosenColor
    
    property alias cfg_dateLetterSpacing: dateLetterSpacing.value
    property alias cfg_dateOpacity: dateOpacity.value

    
    GridLayout {
        columns: 2
        Layout.fillWidth: true;
        
        Label {
            text: i18n("Time Settings")
            font.pointSize: 16
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: enableTimeDisplay
            text: i18n('Enable time display')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: enableTimeShadow
            text: i18n('Enable time shadow')
            Layout.columnSpan: 2
        }
        
        Label {
            Layout.columnSpan: 2
            text: i18n("<a href=\"http://doc.qt.io/qt-5/qml-qtqml-qt.html#formatDateTime-method\">Time Format Documentation</a>")

            onLinkActivated: Qt.openUrlExternally(link)
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.NoButton 
                cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            }
        }
        
        Label {
            text: i18n('Time format:')
            
        }
            
        TextField {
            id: timeFormat
            width: 200
        }
        
        CheckBox {
            id: useSystemFontForTime
            text: i18n('Use system font')
            Layout.columnSpan: 2
        }
        
        RowLayout {
            enabled: !useSystemFontForTime.checked
            Layout.columnSpan: 2
            Label {
                text: i18n("Time font:")
            }
                
            RowLayout {
                
                Label {
                    text: timeFontDialog.font.family
                    Layout.fillWidth: true
                }
                Button {
                    text: i18n("Choose font")
                    onClicked: timeFontDialog.visible = true;
                    FontDialog {
                        id: timeFontDialog
                    }
                }
            }
        }
        
        Label {
            text: i18n('Letter Spacing:')
            
        }
        
        SpinBox {
            id: timeLetterSpacing
            minimumValue: 0
            maximumValue: 100
            decimals: 2
            stepSize: 0.1
        }
        
        Label {
            text: i18n('Opacity:')
        }
        
        SpinBox {
            id: timeOpacity
            minimumValue: 0
            maximumValue: 100
            decimals: 0
            stepSize: 1
        }
        
        CheckBox {
            id: useSystemColorForTime
            text: i18n('Use system color for time')
            Layout.columnSpan: 2
        }
        
        Label {
            text: i18n("Time Color:")
        }
    
        ColorPicker{
            id: timeColorPicker
            enabled: !useSystemColorForTime.checked
        }

        Label {
            text: i18n('Time font size ratio:')
        }

        SpinBox {
            id: timeFontSize
            minimumValue: 4
            maximumValue: 10
            decimals: 0
            stepSize: 1
        }
        
        // ---- Date things
        
        Label {
            text: i18n("Date Settings")
            font.pointSize: 16
        }
        
        CheckBox {
            id: enableDateDisplay
            text: i18n('Enable date display')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: enableDateShadow
            text: i18n('Enable date shadow')
            Layout.columnSpan: 2
        }
        
        CheckBox {
            id: useSystemFontForDate
            text: i18n('Use system font')
            Layout.columnSpan: 2
        }
        
        RowLayout {
            enabled: !useSystemFontForDate.checked
            Layout.columnSpan: 2
            Label {
                text: i18n("Date font:")
            }
                
            RowLayout {
                
                Label {
                    text: dateFontDialog.font.family
                    Layout.fillWidth: true
                }
                Button {
                    text: i18n("Choose font")
                    onClicked: dateFontDialog.visible = true;
                    FontDialog {
                        id: dateFontDialog
                    }
                }
            }
        }
        
        Label {
            text: i18n('Letter Spacing:')
        }
        
        SpinBox {
            id: dateLetterSpacing
            minimumValue: 0
            maximumValue: 100
            decimals: 2
            stepSize: 0.1
        }
        
        Label {
            text: i18n('Opacity:')
        }
        
        SpinBox {
            id: dateOpacity
            minimumValue: 0
            maximumValue: 100
            decimals: 0
            stepSize: 1
        }
        
        CheckBox {
            id: useSystemColorForDate
            text: i18n('Use system color for date')
            Layout.columnSpan: 2
        }
        
        Label {
            text: i18n("Date Color:")
        }
    
        ColorPicker{
            id: dateColorPicker
            enabled: !useSystemColorForDate.checked
        }
        
        Label {
            text: i18n('Date font size ratio:')
        }

        SpinBox {
            id: dateFontSize
            minimumValue: 4
            maximumValue: 10
            decimals: 0
            stepSize: 1
        }
        
        Label {
            text: i18n('Date format:')
        }
            
        TextField {
            id: dateFormat
            width: 200
        }
    }
}
