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
import QtQuick.Layouts 1.3
import org.kde.plasma.plasmoid 2.0
import QtQml 2.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtGraphicalEffects 1.0

Item {
    id: root
    
    property bool enableTimeDisplay: plasmoid.configuration.enableTimeDisplay
    property bool enableTimeShadow: plasmoid.configuration.enableTimeShadow
    property string timeFormat: plasmoid.configuration.timeFormat
    property int timeFontSize: plasmoid.configuration.timeFontSize
    property bool useSystemFontForTime: plasmoid.configuration.useSystemFontForTime
    property font textTimeFont: plasmoid.configuration.textTimeFont
    property bool useSystemColorForTime: plasmoid.configuration.useSystemColorForTime
    property string textTimeColor: plasmoid.configuration.textTimeColor
    property double timeLetterSpacing: plasmoid.configuration.timeLetterSpacing
    property double timeOpacity: plasmoid.configuration.timeOpacity / 100.0
    
    
    property bool enableDateDisplay: plasmoid.configuration.enableDateDisplay
    property bool enableDateShadow: plasmoid.configuration.enableDateShadow
    property string dateFormat: plasmoid.configuration.dateFormat
    property int dateFontSize: plasmoid.configuration.dateFontSize
    property bool useSystemFontForDate: plasmoid.configuration.useSystemFontForDate
    property font textDateFont: plasmoid.configuration.textDateFont
    property bool useSystemColorForDate: plasmoid.configuration.useSystemColorForDate
    property string textDateColor: plasmoid.configuration.textDateColor
    property string dateLetterSpacing: plasmoid.configuration.dateLetterSpacing
    property double dateOpacity: plasmoid.configuration.dateOpacity / 100.0
    
    property int widgetWidth: width
    
    Plasmoid.backgroundHints: "NoBackground";
    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 500
    }
    
    ColumnLayout {
        id: columns
        spacing: 10;
        width: root.width;
        
        PlasmaComponents.Label {
            id: timeLabel
            
            visible: enableTimeDisplay;
            text: Qt.formatTime(dataSource.data.Local.DateTime, timeFormat);
            
            font.pixelSize: widgetWidth / timeFontSize;
            font.family: useSystemFontForTime ? theme.defaultFont.family : textTimeFont.family;
            font.italic: useSystemFontForTime ? theme.defaultFont.italic : textTimeFont.italic;
            font.weight: useSystemFontForTime ? theme.defaultFont.weight : textTimeFont.weight;
            font.letterSpacing: timeLetterSpacing;
            opacity: timeOpacity;
            
            color: useSystemColorForTime ? PlasmaCore.ColorScope.textColor : textTimeColor;
            
            Layout.alignment: columns.horizontalCenter;
        }
         
        PlasmaComponents.Label {
            id: dateLabel
            
            visible: enableDateDisplay;
            text: Qt.formatDate(dataSource.data.Local.DateTime, dateFormat);
            renderType: Text.QtRendering
            font.pixelSize: widgetWidth / dateFontSize;
            font.family: useSystemFontForDate ? theme.defaultFont.family : textDateFont.family;
            font.italic: useSystemFontForDate ? theme.defaultFont.italic : textDateFont.italic;
            font.weight: useSystemFontForDate ? theme.defaultFont.weight : textDateFont.weight;
            font.letterSpacing: dateLetterSpacing;
            opacity: dateOpacity
            
            color: useSystemColorForDate ? PlasmaCore.ColorScope.textColor : textDateColor;
            
            Layout.alignment: columns.horizontalCenter;
            
        }
        
        DropShadow {
            anchors.fill: timeLabel
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: timeLabel
            visible: enableTimeDisplay && enableTimeShadow
            opacity: timeOpacity;
        }
    
        DropShadow {
            anchors.fill: dateLabel
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: dateLabel
            visible: enableDateDisplay && enableDateShadow
            opacity: dateOpacity
        }
        
    }
     
}
