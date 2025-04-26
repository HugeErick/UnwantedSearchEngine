use raylib::prelude::*;

// Constants for button dimensions
const BUTTON_WIDTH: i32 = 100;
const BUTTON_HEIGHT: i32 = 40;

pub fn drawButton(d: &mut RaylibDrawHandle, window_width: i32, is_hovered: bool) {
    // Calculate button position (top-right corner)
    let buttonX = window_width - BUTTON_WIDTH - 20; // 20px margin from the right edge
    let buttonY = 20; // 20px margin from the top edge

    // Define button colors
    let button_color = if is_hovered {
        Color::new(100, 100, 255, 255) // Highlighted color when hovered
    } else {
        Color::new(50, 50, 150, 255) // Default button color
    };

    // Draw the button
    d.draw_rectangle(buttonX, buttonY, BUTTON_WIDTH, BUTTON_HEIGHT, button_color);

    // Draw button text
    let text = "Toggle";
    let fontSize = 20;
    let textWidth = d.measure_text(text, fontSize);
    let textX = buttonX + (BUTTON_WIDTH - textWidth) / 2; // Center text horizontally
    let textY = buttonY + (BUTTON_HEIGHT - fontSize) / 2; // Center text vertically
    d.draw_text(text, textX, textY, fontSize, Color::WHITE);
}

pub fn isMouseOverButton(mouseX: i32, mouseY: i32, window_width: i32) -> bool {
    // Calculate button position (top-right corner)
    let buttonX = window_width - BUTTON_WIDTH - 20;
    let buttonY = 20;

    // Check if the mouse is within the button's bounds
    mouseX >= buttonX
        && mouseX <= buttonX + BUTTON_WIDTH
        && mouseY >= buttonY
        && mouseY <= buttonY + BUTTON_HEIGHT
}
