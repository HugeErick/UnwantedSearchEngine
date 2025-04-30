use raylib::prelude::*;
use url::Url;

use super::searchbar::SearchResult;

#[derive(Debug)]
pub enum OutputItem {
  SearchResult(SearchResult),
  Message(String),
}

#[derive(Debug)]
pub struct OutputArea {
  pub x: i32,
  pub y: i32,
  pub width: i32,
  pub height: i32,
  pub results: Vec<OutputItem>,
  pub scrollOffset: i32, // Tracks the current scroll position
}

impl OutputArea {
  // Constructor
  pub fn new(x: i32, y: i32, width: i32, height: i32) -> Self {
    OutputArea {
      x,
      y,
      width,
      height,
      results: Vec::new(),
      scrollOffset: 0,
    }
  }

  // Add a result to the output area
  pub fn addResult(&mut self, item: OutputItem) {
    self.results.push(item);
  }

  // Clear all results from the output area
  pub fn clearResults(&mut self) {
    self.results.clear();
    self.scrollOffset = 0;
  }

  // Handle scrolling input
  pub fn handleScroll(&mut self, rl: &RaylibHandle) {
    let fontSize = 20; // Font size for rendering text
    let maxVisibleLines = self.height / fontSize;

    if rl.is_key_down(raylib::consts::KeyboardKey::KEY_DOWN) {
      self.scrollOffset += 1;
    } else if rl.is_key_down(raylib::consts::KeyboardKey::KEY_UP) {
      self.scrollOffset -= 1;
    }

    // Ensure scrollOffset stays within valid bounds
    let maxScrollOffset = self.results.len().saturating_sub(maxVisibleLines as usize) as i32;
    self.scrollOffset = self.scrollOffset.clamp(0, maxScrollOffset);
  }

  // Draw the output area
  pub fn draw(&self, d: &mut RaylibDrawHandle) {
    let backgroundColor = Color::new(60, 60, 60, 255); // Dark gray background
    let text_color = Color::WHITE;
    let fontSize = 20;

    // Draw the background rectangle
    d.draw_rectangle(self.x, self.y, self.width, self.height, backgroundColor);

    // Calculate the number of visible lines
    let maxVisibleLines = self.height / fontSize;

    // Render the visible results
    let mut lineOffset = 0;
    for (_, item) in self.results
      .iter()
      .skip(self.scrollOffset as usize)
      .take(maxVisibleLines as usize)
      .enumerate()
    {
      match item {
        OutputItem::SearchResult(result) => {
          let formattedUrl = match Url::parse(&result.url) {
            Ok(url) => url.host_str().unwrap_or(&result.url).to_string(),
            Err(_) => result.url.clone(),
          };

          let formattedResult = format!(
            "{} - {} ({})",
            formattedUrl, result.title, result.author
          );

          // Split the result into lines that fit within the width
          let mut lines = Vec::new();
          let mut currentLine = String::new();
          let mut words = formattedResult.split_whitespace();

          while let Some(word) = words.next() {
            let testLine = format!("{} {}", currentLine, word).trim().to_string();
            let testWidth = d.measure_text(&testLine, fontSize);

            if testWidth <= self.width - 20 {
              currentLine = testLine;
            } else {
              lines.push(currentLine);
              currentLine = word.to_string();
            }
          }

          if !currentLine.is_empty() {
            lines.push(currentLine);
          }

          // Render each line of the result
          for line in lines {
            let text_y = self.y + lineOffset * fontSize;
            d.draw_text(&line, self.x + 10, text_y, fontSize, text_color);
            lineOffset += 1;

            if lineOffset >= maxVisibleLines {
              return;
            }
          }

          // Add extra vertical margin between results
          lineOffset += 1;
        }
        OutputItem::Message(message) => {
          // Wrap message text similar to search results
          let mut lines = Vec::new();
          let mut currentLine = String::new();
          let mut words = message.split_whitespace();

          while let Some(word) = words.next() {
            let testLine = format!("{} {}", currentLine, word).trim().to_string();
            let testWidth = d.measure_text(&testLine, fontSize);

            if testWidth <= self.width - 20 {
              currentLine = testLine;
            } else {
              lines.push(currentLine);
              currentLine = word.to_string();
            }
          }

          if !currentLine.is_empty() {
            lines.push(currentLine);
          }

          for line in lines {
            if lineOffset >= maxVisibleLines {
              return;
            }
            let text_y = self.y + lineOffset * fontSize;
            d.draw_text(&line, self.x + 10, text_y, fontSize, text_color);
            lineOffset += 1;
          }
        }
      }
      // Add extra vertical margin between results
      lineOffset += 1;
    }
  }
} 
