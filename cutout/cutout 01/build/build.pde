//*************************************************************//
//
//********************** Basic Settings ***********************//

int    sceneWidth   = 900;
int    sceneHeight  = 900;
color  bgColor    = #ECECEC;
String pathDATA = "../../../data/";

//********************** Pixel Management ***********************//

ImagePlacer ip;
ImageStrip is;
ImageGrid ig;

int mode = 0;

//********************** Basic Settings ***********************//

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){

	background(bgColor);

	ip = new ImagePlacer();
	ip.setPlace(10,10).setSize(width-20, height-20).setShowNames(true).setShowBorder(true);
	ip.loadImages("footage01");

	is = new ImageStrip();
	is.setCols(1).setPlace(10,10).setSize(width-20, height-20).setShowNames(true).setShowBorder(true);
	is.loadImages("footage01");

	ig = new ImageGrid();
	ig.setGrid(4, 4).setPlace(0,0).setSize(width, height).setShowNames(true).setShowBorder(true);
	ig.loadImages("footage01");

}

void draw(){
	background(bgColor);
	
	if(mode==0){
		// IMAGE PLACER
		ip.displayImageAt(0);
	}
	else if(mode==1){
		// IMAGE STRIP
		int numCols = (int)map(mouseX, 0, width, 1, is.imageCount+1);
		println(numCols);
		is.setCols(numCols).displayStrip(0,numCols-1);
	}
	else if(mode==2) {
		// IMAGE GRID
		int numCols = (int)map(mouseX, 0, width, 1, 10);
		int numRows = (int)map(mouseY, 0, height, 1, 10);
		ig.setGrid(numCols, numRows).displayGrid();
	}

}



void keyPressed(){
	if(key=='0'){
		mode = 0;
	}
	else if(key=='1'){
		mode = 1;
	}
	else if(key=='2'){
		mode = 2;
	}

}