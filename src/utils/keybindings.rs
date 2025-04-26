use raylib::prelude::*;

use crate::windowHandler::WindowSettings;

pub fn handleKeybindings (rl: &mut RaylibHandle, windowSettings: &mut WindowSettings) {

  // we do fullscreen if F is pressed
  if rl.is_key_pressed(raylib::consts::KeyboardKey::KEY_F) {

    rl.toggle_fullscreen();

    // std::thread::sleep(std::time::Duration::from_millis(100));

    let monitorIndex = unsafe { raylib::ffi::GetCurrentMonitor() };
    if rl.is_window_fullscreen() {
      windowSettings.width = unsafe { raylib::ffi::GetMonitorWidth(monitorIndex)};
      windowSettings.height = unsafe { raylib::ffi::GetMonitorHeight(monitorIndex)};
    } else {
      windowSettings.width = 800;
      windowSettings.height = 600;
    }
  }

}
