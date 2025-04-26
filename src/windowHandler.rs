use raylib::prelude::RaylibDraw;
use raylib::prelude::Color;
use crate::utils::keybindings;

use crate::drawingHandler;

pub fn runMainWindow() {
  //rl = raylib
  // intialization
  let (mut rl, thread) = raylib::init()
    .size(800, 600)
    .title("Unwanted Search Engine")
    .build();

  // set our custom themes
  let lightThemeColor = Color::new(245, 245, 230, 255);
  let darkThemeColor = Color::new(25, 25, 25, 255);
  let mut currTheme = Theme::Dark(darkThemeColor);

  // initialize window settings
  let mut windowSettings = WindowSettings {
    width: 800,
    height: 600,
  };

  // main loop
  while !rl.window_should_close() {

    // handle keybindings
    keybindings::handleKeybindings(&mut rl, &mut windowSettings);

    let backgroundColor = currTheme.getBackgroundColor();
    // delegate drawing to drawing module
    // d = drawing
    let mut d = rl.begin_drawing(&thread);
    d.clear_background(backgroundColor);
    drawingHandler::drawContent(&mut d, &windowSettings,&mut currTheme);

    // Debugg
    // std::thread::sleep(std::time::Duration::from_millis(300));
  }
}

#[derive(Clone, Copy, Debug)]
pub struct WindowSettings {
  pub width: i32,
  pub height: i32,
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
