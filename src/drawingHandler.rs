use raylib::prelude::*;
use raylib::prelude::Color;

use crate::windowHandler::{WindowSettings, Theme};
use crate::components::buttons::toggleButton;
use crate::components::searchbar;
use crate::components::dialogs::quitDialog;

pub fn drawContent(d: &mut RaylibDrawHandle, windowSettings: &WindowSettings, currTheme: &mut Theme, quitDialog: &quitDialog::QuitDialog) {

  let mouseX = d.get_mouse_x();
  let mouseY = d.get_mouse_y();
  let isHovered = toggleButton::isMouseOverButton(mouseX, mouseY, windowSettings.width);

  toggleButton::drawButton(d, windowSettings.width, isHovered);

  if isHovered && d.is_mouse_button_pressed(MouseButton::MOUSE_BUTTON_LEFT) {
    *currTheme = match currTheme {
      Theme::Light(_) => Theme::Dark(Color::new(25, 25, 25, 255)),
      Theme::Dark(_) => Theme::Light(Color::new(245, 245, 230, 255)),
    };
  }

  // Define the text to be displayed
  let text = "Unwanted Search Engine";
  let fontSize = 50;
  let textColor = Color::BLUEVIOLET;

  // Measure the width of the text
  let textWidth = d.measure_text(text, fontSize);

  // Calculate the horizontal center position
  let xPos = (windowSettings.width - textWidth) / 2;

  // Draw the text centered at the top
  for offset in [-1, 0, 1] {
    d.draw_text(text, xPos + offset, 14, fontSize, textColor);
    d.draw_text(text, xPos, 14 + offset, fontSize, textColor);
  }

  // Delegate search bar rendering to the searchbar module
  searchbar::drawSearchBar(d, windowSettings);

  // Draw the quit dialog if visible
  quitDialog.draw(d, windowSettings);
}
