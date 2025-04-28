use raylib::prelude::*;

use crate::utils::keybindings;
use crate::components::searchbar;
use crate::components::dialogs::quitDialog::QuitDialog;
use crate::windowHandler::WindowSettings;

pub fn updateContent(rl: &mut RaylibHandle, windowSettings: &mut WindowSettings, quitDialog: &mut QuitDialog) {
  // Handle keybindings
  keybindings::handleKeybindings(rl, windowSettings, quitDialog);

  // Handle quit dialog buttons
  quitDialog.handleInput(rl, windowSettings);

  // Handle search bar input
  searchbar::handleSearchInput(rl, windowSettings);
}
