/* handles all keyboard input events */

void keyPressed(){
  if (key=='d')
    keys[0] = true;
  if (key=='a')
    keys[1] = true;
  if (key=='w')
    keys[2] = true;
  if (key=='s')
    keys[3] = true;
}

void keyReleased(){
  if (key=='d')
    keys[0] = false;
  if (key=='a')
    keys[1] = false;
  if (key=='w')
    keys[2] = false;
  if (key=='s')
    keys[3] = false;
}
