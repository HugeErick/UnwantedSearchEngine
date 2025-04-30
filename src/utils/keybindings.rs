use raylib::prelude::*;

use crate::{components::dialogs::quitDialog::QuitDialog, windowHandler::WindowSettings};

pub fn handleKeybindings(
  rl: &mut RaylibHandle,
  windowSettings: &mut WindowSettings,
  quitDialog: &mut QuitDialog,
) {
  // Handle Escape key logic
  if rl.is_key_pressed(raylib::consts::KeyboardKey::KEY_ESCAPE) {
    if quitDialog.isVisible {
      unsafe {
        raylib::ffi::CloseWindow();
      }
    } else {
      quitDialog.isVisible = true;
    }
  }

  // Check for Ctrl + F combination to toggle fullscreen
  if rl.is_key_down(raylib::consts::KeyboardKey::KEY_LEFT_CONTROL)
  || rl.is_key_down(raylib::consts::KeyboardKey::KEY_RIGHT_CONTROL)
  {
    if rl.is_key_pressed(raylib::consts::KeyboardKey::KEY_F) {
      rl.toggle_fullscreen();

      let monitorIndex = unsafe { raylib::ffi::GetCurrentMonitor() };
      if rl.is_window_fullscreen() {
        windowSettings.width = unsafe { raylib::ffi::GetMonitorWidth(monitorIndex) };
        windowSettings.height = unsafe { raylib::ffi::GetMonitorHeight(monitorIndex) };
      } else {
        windowSettings.width = windowSettings.originalWidth;
        windowSettings.height = windowSettings.originalHeight;
      }
    }
  }
}
