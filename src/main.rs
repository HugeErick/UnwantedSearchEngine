use raylib::prelude::*;

fn main() {
  //rl = raylib
  let (mut rl, thread) = raylib::init()
    .size(800, 600)
    .title("yo")
    .build();

  while !rl.window_should_close() {
    // d = drawing
    let mut d = rl.begin_drawing(&thread);

    d.clear_background(Color::WHITE);
    d.draw_text("yo", 12, 12, 30, Color::BLACK);
  }
}
