import processing.sound.*;
import java.util.*;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

Tile grid[][];
Tile genesisBlock;
GraphHelper gh;
BarHelper bh;
Bar bar;
Bar bars[];
DFS d;
BFS b;
SinOsc sin;
OperatingSystemMXBean osBean;

boolean start = false;
float squareSize;
int algo = 1;
float cols, rows;

void setup() {
  size(1000, 1000);
  background(100);
  randomSeed(second());
  frameRate(60);


  // For operating system management
  osBean = ManagementFactory.getPlatformMXBean(OperatingSystemMXBean.class);

  //load the json file here
  JSONObject json = loadJSONObject("config.json");
  squareSize = json.getInt("barsSize");
  algo = json.getInt("algorithm");

  println(squareSize);
  cols = width/squareSize;
  rows = height/squareSize;

  sin = new SinOsc(this);
  bars = new Bar[(int)cols];

  for (int i =0; i<(int)cols; i++) {
    // xPos, yPos, width, height, value
    bars[i] = (new Bar(i * squareSize, i * squareSize, squareSize, height, (int)(cols - i) - 1));
  }

  bh = new BarHelper(bars, sin, algo);

  sin.amp(0.01);
  bh.shuffleBars();
  sin.play();
}


public void redoDrawBars() {
  for (int i = 0; i<bars.length; i++) {
    bars[i].drawBar();
  }
}

void getOSStats() {
  Object value;
  int yCoor = 57;
  for (Method method : osBean.getClass().getDeclaredMethods()) {
    method.setAccessible(true);
    if (method.getName().startsWith("get")
      && Modifier.isPublic(method.getModifiers())) {
      try {
        value = method.invoke(osBean);
      } 
      catch (Exception e) {
        value = e;
      } // try
      textSize(12);
      fill(0);
      text(method.getName() + " = " + value, 46, yCoor, 550, 4000);
      yCoor += 25;
    } // if
  } // for
}

void resetButton() {
  fill(155);
  rect(50, 275, 200, 50);
  fill(255);
  textSize(30);
  text("Reset",115, 280, 200, 50);
  println("Reset");

  redraw();
  if (mousePressed && mouseX >= 50 && mouseX <= 250 && mouseY <= 325 && mouseY >= 275) {
    bh.sin.stop();
    bh.interrupt();
    bh = null;

    //There is a lot of really bad code here...but it works
    // I will fix this later :0
    JSONObject json = loadJSONObject("config.json");
    this.squareSize = json.getInt("barsSize");
    this.algo = json.getInt("algorithm");
    this.rows = height/squareSize;
    this.cols = width/squareSize;
    bars = new Bar[(int)cols];
    for (int i =0; i<(int)cols; i++) {
      // xPos, yPos, width, height, value
      bars[i] = (new Bar(i * squareSize, i * squareSize, squareSize, height, (int)(cols - i) - 1));
    }
    this.sin.play();
    bh = new BarHelper(bars, sin, algo);
    bh.shuffleBars();
    bh.changeAlgorithm(this.algo); 
    this.start = false;
  }
}


void draw() {
  background(100);

  // This should be made into a new file called start menu.. I probably won't do this tbh...
  if (!bh.isAlive() && start == false) {
    bh.start();
    start = true;
  }
  redoDrawBars();
  getOSStats();
  resetButton();
}
