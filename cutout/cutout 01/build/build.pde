//*************************************************************//
// Paleta de colors basada en una imatge gradient.
// Els colors es trien aleatòriament al llarg de la coordenada X de la imatge.
// Els colors flueixen en moure's la seva coordenada X sobre la imatge.
//
//********************** Basic Settings ***********************//

int    sceneWidth   = 800;
int    sceneHeight  = 600;
color  bgColor    = #ECECEC;
String pathDATA = "../../../data/";

//********************** Pixel Management ***********************//

ImageStrip is;

//********************** Basic Settings ***********************//

void settings() {
	size(sceneWidth,sceneHeight,P3D);
}

void setup(){

	background(bgColor);
	is = new ImageStrip();
	is.loadImages("footage01");

}

void draw(){
	//is.displayRow(0, 2, new PVector(0,0), width, height/2);
	is.displayGrid(0, 3, 2,2, new PVector(0,0), width, height);
}



void keyPressed(){
	if(key=='0'){
	}
}