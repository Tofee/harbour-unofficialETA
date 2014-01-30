/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

import "../js/timerLogic.js" as TimerLogic

Page {
    id: page

    property variant currentETA: TimerLogic.refreshETA();
    property real workProgress: 0;

    Timer {
        id: _ETARefresh

        interval: 3000
        running: Qt.application.active
        repeat: true
        onTriggered: {
            page.currentETA = TimerLogic.refreshETA();

            workProgress = workProgress + 0.05*Math.random();
            if( workProgress>1.2 )
                workProgress = 0.72;
        }
    }

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column

            width: page.width
            spacing: Theme.paddingLarge
            PageHeader {
                title: "Unofficial ETA"
            }
            Label {
                x: Theme.paddingLarge
                text: "Next Jolla Update in :"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: Math.floor(currentETA.getTime() / (1000 * 3600 * 24)) + "Days"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: page.currentETA.getHours() + "Hours"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: page.currentETA.getMinutes() + "Minutes"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: page.currentETA.getSeconds() + "Seconds"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                x: Theme.paddingLarge
                text: "Work Progress :"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            Label {
                id: progressLabel

                x: Theme.paddingLarge
                text: page.workProgress*100 + " %"
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
            GlassItem {
                id: progressbg
                x: Math.round(Screen.width/8)
                width: page.width-2*x
                height: 27
                falloffRadius: Math.exp(0.13)
                radius: 1.0
                dimmed: true
                ratio: 0.0
                cache: false
                GlassItem {
                    id: progressItem
                    width: page.workProgress*progressbg.width;
                    height: 27
                    falloffRadius: Math.exp(0.13)
                    radius: 1.0
                    ratio: 0.0
                    cache: false

                    NumberAnimation on width { duration: 1000 }
                }
            }
        }
    }
}


