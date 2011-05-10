-- $ xmonad --recompile

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
  -- dzproc <- spawnPipe "/usr/bin/dzen2"
  xmonad $ defaultConfig {
    manageHook = manageDocks <+> manageHook defaultConfig,
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
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "/usr/bin/gnome-screensaver-command -l"), -- M-S-z
      ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s"), -- C-PrtSc
      ((0, xK_Print), spawn "scrot")                          -- PrtSc
    ]
