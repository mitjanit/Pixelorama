
class ImageStrip {
	
	PImage[] images;
	String[] imageNames;
	int imageCount;

	ImageStrip(){
	}


	void loadImages(String folderName){

		File dir = new File(sketchPath(""),pathDATA+folderName);

		if (dir.isDirectory()) {
			String[] contents = dir.list();
		    this.images = new PImage[contents.length]; 
		    this.imageNames = new String[contents.length]; 
		    for (int i = 0 ; i < contents.length; i++) {
		      if (contents[i].charAt(0) == '.') continue;
		      else if (contents[i].toLowerCase().endsWith(".jpg")) {
		        File childFile = new File(dir, contents[i]);        
		        this.images[imageCount] = loadImage(childFile.getPath());
		        this.imageNames[imageCount] = childFile.getName();
		        this.imageCount++; 
		        println("Loaded image "+childFile.getName());          
		    }
		  }
		}
	}

	void displayImageAt(int n, PVector pos, float w, float h, boolean showName){
		image(images[n],pos.x,pos.y, w, h);
		if(showName){
			text(imageNames[n], pos.x + 10, pos.y + 10);
		}
	}


	void displayRow(int index1, int index2, PVector orig, float w, float h){
		float colWidth = w / (float)(index2 - index1 + 1);
		for(int index=index1, i=0; index<=index2; index++, i++){
			PVector p = new PVector(orig.x + i*colWidth, orig.y);
			displayImageAt(index, p, colWidth, h, false);
		}
	}

	void displayGrid(int index1, int index2, int nCols, int nRows, PVector orig, float w, float h){
		float colWidth = w / (float) nCols;
		float rowHeight = h / (float) nRows;
		for(int r=0; r<nRows; r++){
			for(int c=0; c<nCols; c++){
				int index = index1 + r*nCols;
				println(index);
				//if(index>index2) break;
				float x = orig.x + colWidth*nCols;
				float y = orig.y + rowHeight*nRows;
				displayImageAt(index, new PVector(x, y), colWidth, rowHeight, false);
			}
		}
	}
}