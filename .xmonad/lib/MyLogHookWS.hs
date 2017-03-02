module MyLogHookWS
( myLogHookWS
) where

import XMonad

-- hooks --
import XMonad.Hooks.DynamicLog
import qualified GHC.IO.Handle.Types as H

-- miscelllanous --
import System.IO

-- own module: configuration decomposition --
import MyColor

------------------------------------------------------------------------

-- Status Bars and Logging

wrapXBitmapWS bitmap = "^i(.xmonad/assets/layout/"++bitmap++")"

myLogHookWS ::  H.Handle -> X ()
myLogHookWS h = dynamicLogWithPP $ def
    {
        ppCurrent         = dzenColor (myColor "DarkGray") (myColor "Yellow")  
                          . wrap "[ " "]" . (icon_grid ++) . pad 
      , ppVisible         = dzenColor (myColor "Blue") (myColor "White") 
                          . pad
      , ppHidden          = dzenColor (myColor "White") (myColor "Green")  
                          . pad
      , ppHiddenNoWindows = dzenColor (myColor "White") (myColor "DarkGray") 
                          . pad
      , ppUrgent          = dzenColor (myColor "Red") (myColor "PureWhite") 
                          . pad
      , ppWsSep           = ""
      , ppSep             = "      "
      , ppOrder           = \(ws:l:t:_) -> [ws]
      , ppLayout          = dzenColor (myColor "Black") (myColor "White") 
      , ppTitle           = dzenColor (myColor "Black") (myColor "White")
      , ppOutput          = hPutStrLn h 
    }
    where 
        icon_grid = wrapXBitmapWS "grid.xbm"
          
          
          
