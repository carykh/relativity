import com.hamoid.*;
String VIDEO_FILENAME = "cary_video_test.mp4";
boolean SAVE_VIDEO = true;
VideoExport videoExport;
String IMAGE_FOLDER = "BlockyImages";

int LEN = 301;
int PEOPLE_COUNT = 5;
float PER_SQUARE = 10;
float[][] paths = new float[PEOPLE_COUNT][LEN];
float[][] ages = new float[PEOPLE_COUNT][LEN];
float[] prevProgress = new float[PEOPLE_COUNT];
float[] progress = new float[PEOPLE_COUNT];
float[] visualY = new float[PEOPLE_COUNT];
color[] colors = {color(255,153,0),color(200,100,0),color(255,255,0),color(255,255,0),color(220,170,0)};

//{color(230,22,22),color(220,130,160),color(0,100,255),color(245,230,0),color(245,230,0)};
color gridColor = color(200,230,200);
float prog = 0;
float speed = 0.02;
float dotX = 0;
float dotY = 0;
float dotS = 0;
int pov = 1;
float RULES = 1;
float horizontalSquish = 1;
float dotAge = 0;
PFont font;
PImage[] imgs = new PImage[PEOPLE_COUNT];
int frames = 0;
float GBSectionOn = -1;
Point GBPoint;
Point prevGBPoint;
float[] GBPath = {
6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.4999294, 6.497414, 6.4919295, 6.4827824, 6.469296, 6.4529805, 6.4321885, 6.4080534, 6.3806677, 6.349016, 6.3146534, 6.2761064, 6.234747, 6.1897826, 6.141657, 6.0905657, 6.0362124, 5.9791136, 5.919098, 5.8562264, 5.7913923, 5.7231174, 5.653462, 5.5811067, 5.5071335, 5.432312, 5.3573127, 5.282312, 5.2073126, 5.132312, 5.0573125, 4.982312, 4.907312, 4.8323116, 4.7573123, 4.6823134, 4.6073136, 4.532313, 4.4573126, 4.382313, 4.3073125, 4.232313, 4.1573124, 4.082313, 4.0073104, 3.9323118, 3.8573124, 3.7823133, 3.7073112, 3.6323123, 3.5573115, 3.4823124, 3.4073114, 3.332313, 3.257312, 3.182312, 3.1073134, 3.0323122, 2.957312, 2.8823125, 2.807313, 2.7323112, 2.657312, 2.5823088, 2.570793, 2.5627673, 2.5708048, 2.5944972, 2.657311, 2.732312, 2.8073118, 2.882311, 2.9573138, 3.032311, 3.1073105, 3.1823115, 3.2573123, 3.3323119, 3.4073117, 3.4823132, 3.5573134, 3.6323133, 3.707311, 3.7823129, 3.8573134, 3.9323134, 4.007312, 4.0823126, 4.157312, 4.232313, 4.3073115, 4.382313, 4.4573116, 4.5323114, 4.607313, 4.682312, 4.757312, 4.8323126, 4.907311, 4.9823136, 5.0573115, 5.1323123, 5.2073107, 5.2823114, 5.3573136, 5.4323153, 5.5071325, 5.58111, 5.6535745, 5.72311, 5.791403, 5.856224, 5.9190993, 5.9791155, 6.0362024, 6.090576, 6.141665, 6.18978, 6.2347474, 6.276105, 6.314728, 6.349004, 6.3806753, 6.408052, 6.4321914, 6.4529214, 6.4692955, 6.482789, 6.4919257, 6.497405, 6.499929, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5, 6.5,6.5};
boolean SHOULD_PRINT_GB_PATH = false;

void setup(){
  font = loadFont("CenturyGothic-Bold-48.vlw");
  for(int i = 0; i < PEOPLE_COUNT; i++){
    ages[i][0] = 0;
    prevProgress[i] = 0;
    imgs[i] = loadImage(IMAGE_FOLDER+"/person"+i+".png");
  }
  for(int i = 0; i < LEN; i++){
    
    // Firey + Coiny 0.8c slap
    /*paths[0][i] = 4.8;
    paths[1][i] = 5.2;
    paths[4][i] = 5;
    if(i > 100){
      paths[0][i] = 4.8-0.08*(i-100);
      paths[1][i] = 5.2+0.08*(i-100);
    }
    paths[2][i] = 5-0.1*(i-100);
    paths[3][i] = 5+0.1*(i-100);*/
    
    
    
    // Blocky + Eraser 1-light-year bar that shortens when it moves fast
    /*if(i < 50){
      paths[0][i] = 5;
    }else if(i < 62.5){
      paths[0][i] = 5-pow(i-50,2)*0.002;
    }else if(i < 102.5){
      paths[0][i] = 4.6875-(i-62.5)*0.05;
    }else if(i < 127.5){
      paths[0][i] = 2.375+pow(i-115,2)*0.002;
    }else if(i < 167.5){
      paths[0][i] = 2.6875+(i-127.5)*0.05;
    }else if(i < 180){
      paths[0][i] = 5-pow(i-180,2)*0.002;
    }else{
      paths[0][i] = 5;
    }
    paths[0][i] = paths[0][i]*1.5;
    paths[1][i] = GBPath[i];
    paths[2][i] = 8;
    paths[3][i] = 17-i*0.1;
    paths[4][i] = -2+i*0.1;*/
    
    // i don't remember what this one was for.
    /*paths[5][i] = 12-i*0.1;
    if(i < 30){
      paths[0][i] = 5.6;
    }else{
      paths[0][i] = paths[5][i]-3.4*pow(0.971,i-30);
    }*/
    /*paths[1][i] = 13-paths[1][i]*1.4;
    paths[0][i] = paths[1][i]-1;
    paths[2][i] = 7.5;
    paths[3][i] = 7;
    paths[4][i] = 5+i*0.1;*/
    
  }
  for(int i = 0; i < LEN; i++){
    if(i >= 1){
      for(int j = 0; j < PEOPLE_COUNT; j++){
        ages[j][i] = ages[j][i-1]+1.0/PER_SQUARE/getHorizontalSquish(j,i);
      }
    }
  }
  size(1920,1080);
  strokeWeight(4);
  ellipseMode(RADIUS);
  textFont(font,24);
  textAlign(CENTER);
  GBPoint = new Point(0,0);
  prevGBPoint = new Point(GBPoint.x,GBPoint.y);
  frameRate(200);
  
  if(SAVE_VIDEO){
    videoExport = new VideoExport(this, VIDEO_FILENAME);
    videoExport.setFrameRate(30);
    videoExport.startMovie();
  }
}
void draw(){
  background(255);
  dotY = getY(dotX, pov);
  dotS = getS(dotX, pov);
  stroke(gridColor);
  for(int x = 0; x <= 20; x++){
    Point ap1 = v(x,0);
    Point ap2 = v(x,10);
    line(ap1.x,ap1.y,ap2.x,ap2.y);
  }
  for(int y = 0; y <= 10; y++){
    Point ap1 = v(0,y);
    Point ap2 = v(20,y);
    line(ap1.x,ap1.y,ap2.x,ap2.y);
  }
  noStroke();
  fill(0,0,0,64);
  rect(0,height/2-3,width,6);
  rect(width/2-3,0,6,height);
  fill(0,0,0,128);
  textAlign(LEFT);
  text("Same place",5,height/2-20);
  text("Same time",width/2+15,25);
  textAlign(CENTER);
  
  Point dotApp = v(dotX,dotY);
  float desiredY = height/2-90;//30.1*cos((float)(frames)/20);
  prevGBPoint = new Point(GBPoint.x,GBPoint.y);
  GBPoint = getHorizontalLine(desiredY,0,10,-10,10);
  int newSection = (int)(GBPoint.x*10);
  if(SHOULD_PRINT_GB_PATH && newSection > GBSectionOn){
    GBSectionOn = newSection;
    
    
    float overShot = (GBPoint.x*10)%1.0;
    float prevUnderShot = 1.0-(prevGBPoint.x*10)%1.0;
    float prog = prevUnderShot/(prevUnderShot+overShot);
    float trueY = prevGBPoint.y+prog*(GBPoint.y-prevGBPoint.y);
    
    print(trueY+", ");
  }
  float y1 = 0;
  float y2 = 0;
  for(int k = PEOPLE_COUNT-1; k >= 0; k--){
    int j = k;
    stroke(colors[j]);
    fill(colors[j]);
    int start = 0;
    if(k == 2 || k == 3){
      start = 100;
    }
    for(int i = start; i < LEN-1; i++){
      Point apparent1 = v(i/PER_SQUARE,paths[j][i]);
      Point apparent2 = v((i+1)/PER_SQUARE,paths[j][i+1]);
      /*if(i >= 144 && (j == 2 || j == 3)){
        if(i == 144){
          line(apparent1.x-10,apparent1.y-10,apparent2.x+10,apparent2.y+10);
          line(apparent1.x-10,apparent1.y+10,apparent2.x+10,apparent2.y-10);
        }
        stroke(0);
      }*/
      /*if(j == 1 && i == 150){
        println((apparent2.y-apparent1.y)/(apparent2.x-apparent1.x));
      }*/
      if(!(j == 2 || j == 3) && i < LEN-1 && floor(ages[j][i+1]+0.0001) > floor(ages[j][i]+0.0001)){
        float interp = (floor(ages[j][i+1]+0.0001)-ages[j][i])/(ages[j][i+1]-ages[j][i]);
        ellipse(inter(apparent1.x,apparent2.x,interp),inter(apparent1.y,apparent2.y,interp),4,4);
      }
      line(apparent1.x,apparent1.y,apparent2.x,apparent2.y);
      if(apparent1.x <= dotApp.x && apparent2.x > dotApp.x){
        prevProgress[j] = progress[j];
        progress[j] = i+(dotApp.x-apparent1.x)/(apparent2.x-apparent1.x);
        visualY[j] = inter(apparent1.y,apparent2.y,progress[j]%1.0);
      }
    }
  }
  
  noStroke();
  
  for(int k = PEOPLE_COUNT-1; k >= 0; k--){
    int i = k;
    if(i <= 2) i = 2-i;
    fill(colors[i]);
    /*if(progress[i] >= 144 && (i == 2 || i == 3)){
      fill(0);
    }*/
    Point doti = new Point(dotApp.x,visualY[i]);
    if(!(i == 2 || i == 3) || abs(doti.y) > 0.0001){
    if(progress[i] >= 144 && (i == 2 || i == 3)){
      //tint(0,0,0);
    }else{
      tint(255,255,255);
    }
    PImage img = imgs[i];
    float ex = 40;
    if(i >= 3){
      ex = 30;
    }
    image(img,doti.x-30,doti.y-ex,60,60);
    if(i == 0){
      y2 = doti.y;
    }else if(i == 1){
      y1 = doti.y;
    }
    if(true){
      translate(0,60);
    }
    rect(doti.x-50,doti.y-45,100,30);
    if(i == 2 || i == 3){
      fill(0);
      text("0.00 yrs",doti.x,doti.y-22);
    }else{
      fill(255);
      if(i == 1){
        fill(0);
      }
      text(nf(getAge(i),0,2)+" yrs",doti.x,doti.y-22);
    }
    if(true){
      translate(0,-60);
    }
    }
  }
  //drawBar(y1,y2);
  textAlign(CENTER);
  stroke(0,0,0,128);
  noFill();
  rect(width-110,height-110,90,90);
  fill(0,0,0,128);
  text("One Year",width-65,height-122);
  textAlign(RIGHT); 
  text("One Light-Year",width-120,height-65);
  textAlign(CENTER);
  
  frames++;
  dotX += speed*getHorizontalSquish(pov,progress[pov]);
  
  if(SAVE_VIDEO){
    videoExport.saveFrame();
  }
  if(dotX*PER_SQUARE >= paths[0].length-2){
    videoExport.endMovie();
    exit();
  }
}
void drawBar(float y1, float y2){
  translate(4,0);
  fill(40);
  rect(width/2-9,y1-2,18,y2-y1+4);
  fill(128);
  rect(width/2-7,y1,14,y2-y1);
  fill(220);
  float wo = (y2-y1)*0.2;
  rect(width/2-7,y1+wo,14,wo);
  rect(width/2-7,y1+wo*3,14,wo);
  fill(0,0,0,80);
  rect(width/2+3,y1,4,y2-y1);
  translate(-4,0);
}
Point getHorizontalLine(float y, float minX, float maxX, float minY, float maxY){
  Point upLeft = v(0,minY);
  Point upRight = v(10,minY);
  float slope = (upLeft.y-upRight.y)/(upLeft.x-upRight.x);
  float intercept = upRight.y-(upRight.x-width/2)*slope;
  
  Point downLeft = v(0,maxY);
  Point downRight = v(10,maxY);
  slope = (downLeft.y-downRight.y)/(downLeft.x-downRight.x);
  float intercept2 = downRight.y-(downRight.x-width/2)*slope;
  
  float prog = (y-intercept)/(intercept2-intercept);
  float spaceValue = minY+prog*(maxY-minY);
  
  Point constLineLeft = v(minX,spaceValue);
  Point constLineRight = v(maxX,spaceValue);
  
  prog = (width/2-constLineLeft.x)/(constLineRight.x-constLineLeft.x);
  
  float timeValue = minX+prog*(maxX-minX);
  
  return new Point(timeValue,spaceValue);
}
String zeros(int n, int zeros){
  String s = n+"";
  for(int i = s.length(); i < zeros; i++){
    s = "0"+s;
  }
  return s;
}
float getAge(int i){
  int p = (int)(progress[i]);
  return inter(ages[i][p],ages[i][p+1],progress[i]%1.0);
}
float getY(float x, int p){
  int d1 = (int)(x*PER_SQUARE);
  int d2 = d1+1;
  return inter(paths[p][d1],paths[p][d2],(x*PER_SQUARE)%1.0);
}
float getS(float x, int p){
  int d1 = (int)(x*PER_SQUARE);
  int d0 = max(0, d1-1);
  int d2 = min(d1+1,LEN-1);
  int d3 = min(d1+2,LEN-1);
  
  float mod = (x*PER_SQUARE)%1.0;
  if(mod < 0.5){
    return inter(paths[p][d1]-paths[p][d0],paths[p][d2]-paths[p][d1],mod+0.5)*PER_SQUARE;
  }else{
    return inter(paths[p][d2]-paths[p][d1],paths[p][d3]-paths[p][d2],mod-0.5)*PER_SQUARE;
  }
}
float inter(float a, float b, float x){
  return a+(b-a)*x;
}
Point v(float x, float y){
  float ax = x;
  float ay = y;
  if(RULES == 0){
    ax = x-dotX;
    ay = y-dotY-(x-dotX)*dotS;
  }else if(RULES == 1){
    float horizontalShift = 0.5*(1/(1+dotS)-1/(1-dotS));
    float horizontalSquish = (1-horizontalShift*(1+dotS))/(1+dotS);
    ay = ((y-dotY)-(x-dotX)*dotS);
    ax = (x+(ay-dotY)*horizontalShift)-(dotX-dotY*horizontalShift);
    ay *= sqrt(horizontalSquish);
    ax /= sqrt(horizontalSquish);
  }
  return new Point(ax*90+width/2,ay*90+height/2);
}
float getHorizontalSquish(int p, float prog){
  if(RULES != 1){
    return 1;
  }else{
    float x = prog/PER_SQUARE;
    float verticalShift = getS(x,p);
    float horizontalShift = 0.5*(1/(1+verticalShift)-1/(1-verticalShift));
    return sqrt((1-horizontalShift*(1+verticalShift))/(1+verticalShift));
  }
}
public class Point {

    float x;
    float y;

    public Point(float x, float y) {
        this.x = x;
        this.y = y;
    }


    public float getX() {
        return x;
    }

    public float getY() {
        return y;
    }

    public String toString() {
        return ("(" + x + "," + y + ")"); 
    }
}
