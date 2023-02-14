function systemKey(key)
  hs.eventtap.event.newSystemKeyEvent(key, true):post()
  hs.eventtap.event.newSystemKeyEvent(key, false):post()
end
-- Toggle the play/pause state of the Music app
function toggleMusicPlayback()
    hs.osascript.applescript([[
        tell application "Music"
            if player state is playing then
                pause
            else
                play
            end if
        end tell
    ]])
end
-- Toggle the play/pause state of the movie in QuickTime Player
function toggleQuickTimePlayback()
    hs.osascript.applescript([[
        tell application "QuickTime Player"
            if playing of document 1 is true then
                pause document 1
            else
                play document 1
            end if
        end tell
    ]])
end

-- lock screen by starting screensaver
hs.hotkey.bind({'shift', 'cmd'}, 'l', function() hs.caffeinate.startScreensaver() end)

-- simulate media keys for external keyboard
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, 'Up', function() systemKey('SOUND_UP') end)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, 'Down', function() systemKey('SOUND_DOWN') end)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, '0', function() systemKey('MUTE') end)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, '`', toggleMusicPlayback)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, '\\', toggleQuickTimePlayback)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, 'Left', function() systemKey('PREVIOUS') end)
hs.hotkey.bind({'shift', 'cmd', 'ctrl'}, 'right', function() systemKey('NEXT') end)
