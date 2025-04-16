use raylib::prelude::*;

pub fn drawContent(d: &mut RaylibDrawHandle, screenWidth: i32) {
    // Clear the background
    d.clear_background(Color::WHITE);

    // Define the text to be displayed
    let text = "Unwanted Search Engine";
    let fontSize = 30;
    let textColor = Color::BLACK;

    // Measure the width of the text
    let textWidth = d.measure_text(text, fontSize);

    // Calculate the horizontal center position
    let xPos = (screenWidth - textWidth) / 2;

    // Draw the text centered at the top
    d.draw_text(text, xPos, 12, fontSize, textColor);
}
