import processing.video.*;

Capture cam;
PImage [] buffer;
int w=640, h=480;
int nFrames=120; //number of frames to save
int count=0;  // for saving the frames

void settings() {
  size(w, h);
}

void setup() {
  cam =new Capture(this, w, h);
  cam.start();
  buffer=new PImage[nFrames];
}

int displayCount=0;  //for displaying the recorded frames

void draw() {
  if (count>=nFrames) {
    image(buffer[displayCount], 0, 0);
    displayCount++;
    delay(30);  //delay the replay for 30 ms to slow it down a little
    
    //resetting the saved frames
    if (displayCount==count){
      count=0;
      displayCount=0;
    }
  } else {
    if (cam.available()) {
      cam.read();
      buffer[count]=cam.get();
      image(buffer[count], 0, 0);
      count++;
    }
  }
}