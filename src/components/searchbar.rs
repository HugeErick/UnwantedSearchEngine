use raylib::prelude::*;

use crate::windowHandler::WindowSettings;

// Constants for the search bar dimensions
const SEARCH_BAR_WIDTH: i32 = 500;
const SEARCH_BAR_HEIGHT: i32 = 50;

pub fn drawSearchBar(d: &mut RaylibDrawHandle, windowSettings: &WindowSettings) {
  // Calculate search bar position (centered horizontally, below the title)
  let searchBarX = (windowSettings.width - SEARCH_BAR_WIDTH) / 2;

  let searchBarY = 110;

  // Draw the search bar background
  let searchBarColor = Color::new(50, 50, 50, 255); // Dark background
  d.draw_rectangle(searchBarX, searchBarY, SEARCH_BAR_WIDTH, SEARCH_BAR_HEIGHT, searchBarColor);

  // Render the search query or placeholder text
  let searchFontSize = 20;
  let searchColor = Color::WHITE;
  let searchPlaceholder = "Search...";
  let searchText = if windowSettings.searchCursor == 0 {
    searchPlaceholder
  } else {
    &windowSettings.searchQuery[0..windowSettings.searchCursor]
      .iter()
      .collect::<String>()
  };

  let _searchTextWidth = d.measure_text(&searchText, searchFontSize);
  let searchTextX = searchBarX + 10; // 10px padding from the left edge
  let searchTextY = searchBarY + (SEARCH_BAR_HEIGHT - searchFontSize) / 2;

  d.draw_text(&searchText, searchTextX, searchTextY, searchFontSize, searchColor);
}

pub fn handleSearchInput(rl:&mut RaylibHandle, windowSettings: &mut WindowSettings) {

  // Timer for continous backspace
  static mut BACKSPACE_TIMER: f32 = 0.0;
  const BACKSPACE_DELAY: f32 = 0.06; // Delay before continuous backspace starts
  // Handle backspace
  if rl.is_key_down(raylib::consts::KeyboardKey::KEY_BACKSPACE) && windowSettings.searchCursor > 0 {
    unsafe {
      BACKSPACE_TIMER += rl.get_frame_time();
      if BACKSPACE_TIMER >= BACKSPACE_DELAY {
        BACKSPACE_TIMER = 0.0;
        windowSettings.searchCursor -= 1;
        windowSettings.searchQuery[windowSettings.searchCursor] = '\0';
      }
    }
  } else {
    // Reset the backspace timer when the key is released
    unsafe {
      BACKSPACE_TIMER = 0.0;
    }
  }
  // Handle Enter (clear the search bar)
  if rl.is_key_pressed(raylib::consts::KeyboardKey::KEY_ENTER) {
    windowSettings.searchQuery = ['\0'; 64];
    windowSettings.searchCursor = 0;
  }
  // Append typed characters
  else {
    let key = rl.get_key_pressed();
    if let Some(key_code) = key {
      // Convert the key code to a char
      if let Some(ch) = keyToChar(key_code) {
        if ch.is_alphanumeric() || ch.is_whitespace() {
          if windowSettings.searchCursor < 64 {
            // Append the character to the search query
            windowSettings.searchQuery[windowSettings.searchCursor] = ch;
            windowSettings.searchCursor += 1;
          }
        }
      }
    } 

  }
}

fn keyToChar(key: raylib::consts::KeyboardKey) -> Option<char> {
  match key {
    // Alphabetic keys
    raylib::consts::KeyboardKey::KEY_A => Some('a'),
    raylib::consts::KeyboardKey::KEY_B => Some('b'),
    raylib::consts::KeyboardKey::KEY_C => Some('c'),
    raylib::consts::KeyboardKey::KEY_D => Some('d'),
    raylib::consts::KeyboardKey::KEY_E => Some('e'),
    raylib::consts::KeyboardKey::KEY_F => Some('f'),
    raylib::consts::KeyboardKey::KEY_G => Some('g'),
    raylib::consts::KeyboardKey::KEY_H => Some('h'),
    raylib::consts::KeyboardKey::KEY_I => Some('i'),
    raylib::consts::KeyboardKey::KEY_J => Some('j'),
    raylib::consts::KeyboardKey::KEY_K => Some('k'),
    raylib::consts::KeyboardKey::KEY_L => Some('l'),
    raylib::consts::KeyboardKey::KEY_M => Some('m'),
    raylib::consts::KeyboardKey::KEY_N => Some('n'),
    raylib::consts::KeyboardKey::KEY_O => Some('o'),
    raylib::consts::KeyboardKey::KEY_P => Some('p'),
    raylib::consts::KeyboardKey::KEY_Q => Some('q'),
    raylib::consts::KeyboardKey::KEY_R => Some('r'),
    raylib::consts::KeyboardKey::KEY_S => Some('s'),
    raylib::consts::KeyboardKey::KEY_T => Some('t'),
    raylib::consts::KeyboardKey::KEY_U => Some('u'),
    raylib::consts::KeyboardKey::KEY_V => Some('v'),
    raylib::consts::KeyboardKey::KEY_W => Some('w'),
    raylib::consts::KeyboardKey::KEY_X => Some('x'),
    raylib::consts::KeyboardKey::KEY_Y => Some('y'),
    raylib::consts::KeyboardKey::KEY_Z => Some('z'),

    // Numeric keys
    raylib::consts::KeyboardKey::KEY_ZERO => Some('0'),
    raylib::consts::KeyboardKey::KEY_ONE => Some('1'),
    raylib::consts::KeyboardKey::KEY_TWO => Some('2'),
    raylib::consts::KeyboardKey::KEY_THREE => Some('3'),
    raylib::consts::KeyboardKey::KEY_FOUR => Some('4'),
    raylib::consts::KeyboardKey::KEY_FIVE => Some('5'),
    raylib::consts::KeyboardKey::KEY_SIX => Some('6'),
    raylib::consts::KeyboardKey::KEY_SEVEN => Some('7'),
    raylib::consts::KeyboardKey::KEY_EIGHT => Some('8'),
    raylib::consts::KeyboardKey::KEY_NINE => Some('9'),

    // Special characters
    raylib::consts::KeyboardKey::KEY_SPACE => Some(' '),
    raylib::consts::KeyboardKey::KEY_COMMA => Some(','),
    raylib::consts::KeyboardKey::KEY_PERIOD => Some('.'),
    raylib::consts::KeyboardKey::KEY_SLASH => Some('/'),
    raylib::consts::KeyboardKey::KEY_BACKSLASH => Some('\\'),
    raylib::consts::KeyboardKey::KEY_MINUS => Some('-'),
    raylib::consts::KeyboardKey::KEY_EQUAL => Some('='),
    raylib::consts::KeyboardKey::KEY_APOSTROPHE => Some('\''),
    raylib::consts::KeyboardKey::KEY_SEMICOLON => Some(';'),

    // Default case (unsupported keys)
    _ => None,
  }
}
