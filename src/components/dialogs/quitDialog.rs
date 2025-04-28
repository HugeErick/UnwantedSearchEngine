use raylib::prelude::*;

use crate::windowHandler::WindowSettings;

#[derive(Clone, Copy, Debug)]
pub struct QuitDialog {
  pub isVisible: bool, // Whether the quit dialog is currently visible
}

impl QuitDialog {
  pub fn new() -> Self {
    QuitDialog { isVisible: false }
  }

  // Draw the quit dialog
  pub fn draw(&self, d: &mut RaylibDrawHandle, windowSettings: &WindowSettings) {
    if !self.isVisible {
      return; // Do nothing if the dialog is not visible
    }

    // Calculate dialog dimensions and position
    let dialogWidth = 400;
    let dialogHeight = 150;
    let dialogX = (windowSettings.width - dialogWidth) / 2;
    let dialogY = (windowSettings.height - dialogHeight) / 2;

    // Draw the dialog background
    let dialogColor = Color::new(50, 50, 50, 255); // Dark background
    d.draw_rectangle(dialogX, dialogY, dialogWidth, dialogHeight, dialogColor);

    // Draw the message
    let message = "Are you sure you want to quit?";
    let fontSize = 20;
    let textColor = Color::WHITE;
    let messageWidth = d.measure_text(message, fontSize);
    let messageX = dialogX + (dialogWidth - messageWidth) / 2;
    let messageY = dialogY + 30;
    d.draw_text(message, messageX, messageY, fontSize, textColor);

    // Draw "Yes" and "No" buttons
    let buttonWidth = 80;
    let buttonHeight = 40;
    let buttonSpacing = 20;

    let yesButtonX = dialogX + (dialogWidth - buttonWidth * 2 - buttonSpacing) / 2;
    let noButtonX = yesButtonX + buttonWidth + buttonSpacing;
    let buttonY = dialogY + dialogHeight - buttonHeight - 20;

    // Draw "Yes" button
    let yesButtonColor = Color::GRAY;
    d.draw_rectangle(yesButtonX, buttonY, buttonWidth, buttonHeight, yesButtonColor);
    let yesButtonText = "Yes";
    let yesTextWidth = d.measure_text(yesButtonText, fontSize);
    let yesTextX = yesButtonX + (buttonWidth - yesTextWidth) / 2;
    let yesTextY = buttonY + (buttonHeight - fontSize) / 2;
    d.draw_text(yesButtonText, yesTextX, yesTextY, fontSize, Color::WHITE);

    // Draw "No" button
    let noButtonColor = Color::GRAY;
    d.draw_rectangle(noButtonX, buttonY, buttonWidth, buttonHeight, noButtonColor);
    let noButtonText = "No";
    let noTextWidth = d.measure_text(noButtonText, fontSize);
    let noTextX = noButtonX + (buttonWidth - noTextWidth) / 2;
    let noTextY = buttonY + (buttonHeight - fontSize) / 2;
    d.draw_text(noButtonText, noTextX, noTextY, fontSize, Color::WHITE);
  }

  // Handle user input for the quit dialog
  pub fn handleInput(&mut self, rl: &RaylibHandle, windowSettings: &WindowSettings) {
    if !self.isVisible {
      return; // Do nothing if the dialog is not visible
    }

    let mouseX = rl.get_mouse_x();
    let mouseY = rl.get_mouse_y();

    // Calculate button positions
    let dialogWidth = 300;
    let dialogHeight = 150;
    let dialogX = (windowSettings.width - dialogWidth) / 2;
    let dialogY = (windowSettings.height - dialogHeight) / 2;

    let buttonWidth = 80;
    let buttonHeight = 40;
    let buttonSpacing = 20;

    let yesButtonX = dialogX + (dialogWidth - buttonWidth * 2 - buttonSpacing) / 2;
    let noButtonX = yesButtonX + buttonWidth + buttonSpacing;
    let buttonY = dialogY + dialogHeight - buttonHeight - 20;

    // Check if "Yes" button is clicked
    if rl.is_mouse_button_pressed(MouseButton::MOUSE_BUTTON_LEFT)
    && mouseX >= yesButtonX
    && mouseX <= yesButtonX + buttonWidth
    && mouseY >= buttonY
    && mouseY <= buttonY + buttonHeight
    {
      println!("Quitting the app...");
      unsafe {
        raylib::ffi::CloseWindow();
      }
    }

    // Check if "No" button is clicked
    if rl.is_mouse_button_pressed(MouseButton::MOUSE_BUTTON_LEFT)
    && mouseX >= noButtonX
    && mouseX <= noButtonX + buttonWidth
    && mouseY >= buttonY
    && mouseY <= buttonY + buttonHeight
    {
      println!("No quitting the app...");
      self.isVisible = false; // Hide the dialog
    }

    // Do not quit

  }
}
