use crate::drawingHandler;

pub fn runMainWindow() {
  //rl = raylib
  let (mut rl, thread) = raylib::init()
    .size(800, 600)
    .title("Unwanted Search Engine")
    .build();

  while !rl.window_should_close() {

    let screenWidth = rl.get_screen_width();
    // delegate drawing to drawing module
    // d = drawing
    let mut d = rl.begin_drawing(&thread);
    drawingHandler::drawContent(&mut d, screenWidth);
  }
}
