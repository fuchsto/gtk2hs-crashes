
module Main where

import Data.IORef

import qualified Graphics.UI.Gtk as Gtk
import qualified Graphics.UI.Gtk.Builder as GtkBuilder

main :: IO()
main = do
  _ <- Gtk.initGUI
  mainWindow <- Gtk.windowNew
  -- Print something every second: 
  timeoutHandle <- Gtk.timeoutAddFull (do 
      putStrLn $ "Timeout callback fired"	
      return True
    ) Gtk.priorityDefaultIdle 1000
  -- Remove timer for redrawing canvas when closing window:
  _ <- Gtk.onDestroy mainWindow (Gtk.timeoutRemove timeoutHandle)
  -- Display window:
  _ <- Gtk.widgetShowAll mainWindow
  -- Enter GUI main loop:
  Gtk.mainGUI
