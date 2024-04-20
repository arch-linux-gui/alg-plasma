import QtQuick
import QtQuick.Controls as QQC

import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.workspace.keyboardlayout

PlasmaComponents.ToolButton {

    property int fontSize: config.fontSize

    id: kbLayoutButton

    iconName: "input-keyboard"
    implicitWidth: minimumWidth
    text: layout.currentLayoutDisplayName
    font.pointSize: Math.max(fontSize,theme.defaultFont.pointSize)

    Accessible.name: i18ndc("plasma_lookandfeel_org.kde.lookandfeel", "Button to change keyboard layout", "Switch layout")

    visible: layout.layouts.length > 1

    onClicked: layout.nextLayout()

    KeyboardLayout {
          id: layout
              function nextLayout() {
              var layouts = layout.layouts;
              var index = (layouts.indexOf(layout.currentLayout)+1) % layouts.length;
              layout.currentLayout = layouts[index];
          }
    }
}