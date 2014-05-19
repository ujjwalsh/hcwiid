module Main where

import Prelude
import Control.Monad
import System.CWiid
import System.Posix.Unistd

main :: IO ()
main = do
  putStrLn "Put Wiimote in discoverable mode now (press 1+2)..."
  (Just wm) <- cwiidOpen
  putStrLn "found!"
  _ <- cwiidSetLed wm (combineCwiidLedFlag [cwiidLed1, cwiidLed3])
  _ <- cwiidSetRptMode wm 7
  _ <- forever $ do _ <- usleep 300000
                    cwiidGetBtnState wm >>= print
                    cwiidGetAcc wm >>= print
  return () -- not reach
