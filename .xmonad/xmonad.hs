-- $ xmonad --recompile

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHook = composeAll [
  className =? "stalonetray" --> doIgnore
  ]

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
  -- dzproc <- spawnPipe "/usr/bin/dzen2"
  xmonad $ defaultConfig {
    manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
    layoutHook = avoidStruts  $  layoutHook defaultConfig,
    logHook    = dynamicLogWithPP $ xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle  = xmobarColor "green" "" . shorten 50
      },
    terminal           = "urxvt",
    focusFollowsMouse  = False,
    modMask            = mod4Mask,
    focusedBorderColor = "yellow",
    startupHook = setWMName "LG3D" -- Java hack
    } `additionalKeys`
    [ ((mod4Mask, xK_x), spawn "/usr/bin/python ~/usr/local/bin/toggle-touchpad.py"), -- M-x
      ((mod4Mask .|. shiftMask, xK_z), spawn "/usr/bin/xscreensaver-command -lock"), -- M-S-z
      ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"), -- C-PrtSc
      ((0, xK_Print), spawn "scrot")                          -- PrtSc
    ]
