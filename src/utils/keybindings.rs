use raylib::prelude::*;

use crate::{components::dialogs::quitDialog::QuitDialog, windowHandler::WindowSettings};

pub fn handleKeybindings (rl: &mut RaylibHandle, windowSettings: &mut WindowSettings, quitDialog: &mut QuitDialog) {

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

  // we do fullscreen if F is pressed
  if rl.is_key_pressed(raylib::consts::KeyboardKey::KEY_F) {

    rl.toggle_fullscreen();

    // std::thread::sleep(std::time::Duration::from_millis(100));

    let monitorIndex = unsafe { raylib::ffi::GetCurrentMonitor() };
    if rl.is_window_fullscreen() {
      windowSettings.width = unsafe { raylib::ffi::GetMonitorWidth(monitorIndex)};
      windowSettings.height = unsafe { raylib::ffi::GetMonitorHeight(monitorIndex)};
    } else {
      windowSettings.width = windowSettings.originalWidth;
      windowSettings.height = windowSettings.originalHeight;
    }
  }

}
