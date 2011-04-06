-- $ xmonad --recompile
-- M-q

import XMonad
-- import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

-- main = xmonad $ gnomeConfig
-- main = xmonad =<< xmobar myConfig
-- myConfig = defaultConfig { terminal = "urxvt", modMask = mod4Mask }

myManageHook = composeAll
  [ className =? "Gimp" --> doFloat ]

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
  xmonad $ defaultConfig {
    manageHook = manageDocks <+> myManageHook <+> manageHook defaultConfig,
    layoutHook = avoidStruts  $  layoutHook defaultConfig,
    logHook    = dynamicLogWithPP $ xmobarPP {
      ppOutput = hPutStrLn xmproc,
      ppTitle  = xmobarColor "green" "" . shorten 50
      },
    terminal   = "urxvt",
    modMask    = mod4Mask
    -- , workspaces    = ["1","2","3","4","5","6","7","8","9"]
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l") -- M-S-z
    , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s") -- C-PrtSc
    , ((0, xK_Print), spawn "scrot")                         -- PrtSc
    -- , ("M-<Left>", prevWS)
    -- , ("M-<Right>", nextWS)
    -- , ("M-S-<Left>", shiftToPrev)
    -- , ("M-S-<Right>", shiftToNext)
    ]
