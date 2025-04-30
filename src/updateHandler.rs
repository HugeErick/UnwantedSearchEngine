use raylib::prelude::*;

use crate::utils::keybindings;
use crate::components::searchbar::{self, SEARCH_BAR_WIDTH, SEARCH_BAR_HEIGHT};
use crate::components::outputArea::OutputArea;
use crate::components::dialogs::quitDialog::QuitDialog;
use crate::windowHandler::WindowSettings;

pub fn updateContent(rl: &mut RaylibHandle, windowSettings: &mut WindowSettings, quitDialog: &mut QuitDialog, outputArea: &mut OutputArea ) {
  // Handle keybindings
  keybindings::handleKeybindings(rl, windowSettings, quitDialog);

  // Handle quit dialog buttons
  quitDialog.handleInput(rl, windowSettings);

  // Check if the search bar is clicked
  let mouseX = rl.get_mouse_x();
  let mouseY = rl.get_mouse_y();
  let searchBarX = (windowSettings.width - SEARCH_BAR_WIDTH) / 2;
  let searchBarY = 110;

  if rl.is_mouse_button_pressed(MouseButton::MOUSE_BUTTON_LEFT) {
    if mouseX >= searchBarX
    && mouseX <= searchBarX + SEARCH_BAR_WIDTH
    && mouseY >= searchBarY
    && mouseY <= searchBarY + SEARCH_BAR_HEIGHT
    {
      // Clicked inside the search bar
      windowSettings.searchBarFocused = true;
    } else {
      // Clicked outside the search bar
      windowSettings.searchBarFocused = false;
    }
  }


  // Handle search bar input
  if let Some(query) = searchbar::handleSearchInput(rl, windowSettings, outputArea) {
    println!("Search Query: {}", query);
  }

  // Handle output area
  outputArea.handleScroll(rl);
}

