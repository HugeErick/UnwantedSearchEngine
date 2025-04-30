use raylib::prelude::*;
use std::fmt;
use serde::Deserialize;
use tokio::runtime::Runtime;

use crate::components::outputArea::{OutputArea, OutputItem};
use crate::windowHandler::WindowSettings;

#[derive(Debug)]
pub enum FetchError {
  Reqwest(reqwest::Error),
  SerdeJson(serde_json::Error),
}

impl fmt::Display for FetchError {
  fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
    match self {
      FetchError::Reqwest(err) => write!(f, "Reqwest error: {}", err),
      FetchError::SerdeJson(err) => write!(f, "Serde JSON error: {}", err),
    }
  }
}

impl From<reqwest::Error> for FetchError {
  fn from(err: reqwest::Error) -> Self {
    FetchError::Reqwest(err)
  }
}

impl From<serde_json::Error> for FetchError {
  fn from(err: serde_json::Error) -> Self {
    FetchError::SerdeJson(err)
  }
}

#[derive(Debug, Deserialize)]
pub struct SearchResult {
  pub url: String,
  pub title: String,
  pub author: String,
  pub date: String,
  #[serde(rename = "relevance_score")]
  pub relevance_score: u32,
  #[serde(rename = "matched_terms")]
  pub matched_terms: Vec<String>,
  #[serde(rename = "matched_count")]
  pub matched_count: String,
}

#[derive(Debug, Deserialize)]
pub struct ApiResponse {
  pub query: String,
  #[serde(rename = "processed_terms")]
  pub processed_terms: Vec<String>,
  pub results: Vec<SearchResult>,
}

// Constants for the search bar dimensions
pub const SEARCH_BAR_WIDTH: i32 = 500;
pub const SEARCH_BAR_HEIGHT: i32 = 50;


pub async fn fetchSearchResults(query: &str) -> Result<ApiResponse, FetchError> {
  let url = format!("https://serverdo.fly.dev/api/search?q={}", query);

  // Send GET request and parse JSON response
  let response = reqwest::get(&url).await?;
  let body = response.text().await?;

  println!("Response: {}", body);
  let apiResponse: ApiResponse = serde_json::from_str(&body)?;

  Ok(apiResponse)
}

pub fn drawSearchBar(d: &mut RaylibDrawHandle, windowSettings: &WindowSettings) {
  // Calculate search bar position (centered horizontally, below the title)
  let searchBarX = (windowSettings.width - SEARCH_BAR_WIDTH) / 2;
  let searchBarY = 110;

  // Draw the search bar background
  let searchBarColor = if windowSettings.searchBarFocused {
    Color::new(70, 70, 70, 255) // Slightly lighter color when focused
  } else {
    Color::new(50, 50, 50, 255) // Darker color when not focused
  };
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

pub fn handleSearchInput(rl:&mut RaylibHandle, windowSettings: &mut WindowSettings, outputArea: &mut OutputArea,) -> Option<String> {
  if !windowSettings.searchBarFocused {
    return None;
  }

  // Timer for continous backspace
  static mut BACKSPACE_TIMER: f32 = 0.0;
  const BACKSPACE_DELAY: f32 = 0.05; // Delay before continuous backspace starts
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
    let query: String = windowSettings.searchQuery[0..windowSettings.searchCursor]
      .iter()
      .collect();
    windowSettings.searchQuery = ['\0'; 64];
    windowSettings.searchCursor = 0;

    outputArea.clearResults();
    outputArea.addResult(OutputItem::Message("Searching...".to_string()));

    let rt = Runtime::new().unwrap();
    let fetchedResults = rt.block_on(fetchSearchResults(&query));

    match fetchedResults {
      Ok(apiResponse) => {
        outputArea.clearResults();
        for result in apiResponse.results {
          outputArea.addResult(OutputItem::SearchResult(result));
        }
      }
      Err(FetchError::Reqwest(e)) => {
        eprintln!("Network error fetching search results: {}", e);
        outputArea.clearResults();
        outputArea.addResult(OutputItem::Message("Failed to fetch results".to_string()));
      }
      Err(FetchError::SerdeJson(e)) => {
        eprintln!("JSON decoding error: {}", e);
        outputArea.clearResults();
        outputArea.addResult(OutputItem::Message("Failed to decode results".to_string()));
      }
    }

    return Some(query);
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
  None 
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


