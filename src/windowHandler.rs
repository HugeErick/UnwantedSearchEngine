use raylib::prelude::RaylibDraw;
use raylib::prelude::Color;

use crate::components::dialogs::quitDialog;
use crate::drawingHandler;
use crate::updateHandler;

pub fn runMainWindow() {
  // Initialize window settings
  let mut windowSettings = WindowSettings {
    width: 900,
    height: 700,
    originalWidth: 900,
    originalHeight: 700,
    searchQuery: ['\0'; 64],
    searchCursor: 0,
  };

  // rl = raylib
  // Intialization
  let (mut rl, thread) = raylib::init()
    .size(windowSettings.width, windowSettings.height)
    .title("Unwanted Search Engine")
    .build();

  rl.set_exit_key(None);

  // Set our custom themes
  let _lightThemeColor = Color::new(245, 245, 230, 255);
  let darkThemeColor = Color::new(25, 25, 25, 255);
  let mut currTheme = Theme::Dark(darkThemeColor);

  let mut quitDialog = quitDialog::QuitDialog::new();
  

  // Main loop
  while !rl.window_should_close() {

    // Update module
    updateHandler::updateContent(&mut rl, &mut windowSettings, &mut quitDialog);
    
    let backgroundColor = currTheme.getBackgroundColor();
    // Delegate drawing to drawing module
    // d = drawing
    let mut d = rl.begin_drawing(&thread);
    d.clear_background(backgroundColor);
    drawingHandler::drawContent(&mut d, &windowSettings,&mut currTheme, &quitDialog);

    // Debugg
    // std::thread::sleep(std::time::Duration::from_millis(300));
  }
}

#[derive(Clone, Copy, Debug)]
pub struct WindowSettings {
  pub width: i32,
  pub height: i32,
  pub originalWidth: i32,
  pub originalHeight: i32,
  pub searchQuery: [char; 64],
  pub searchCursor: usize,
}

#[derive(Clone, Copy, Debug)]
pub enum Theme {
  Light(Color),
  Dark(Color),
}

impl Theme {
  fn getBackgroundColor(&self) -> Color {
    match self {
      Theme::Light(color) => *color,
      Theme::Dark(color) => *color,
    }
  }
}
