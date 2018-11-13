
class ImagePlacer {

	PImage[] images;
	String[] imageNames;
	int imageCount;

	boolean showNames;
	boolean showBorder;
	PVector pos;
	float w, h;

	ImagePlacer(){
		showNames = false;
		this.pos = new PVector(0,0);
		this.w = width;
		this.h = height;
	}

	ImagePlacer setShowNames(boolean b){
		this.showNames = b;
		return this;
	}

	ImagePlacer setShowBorder(boolean b){
		this.showBorder = b;
		return this;
	}

	ImagePlacer setPlace(float x, float y){
		this.pos = new PVector(x, y);
		return this;
	}

	ImagePlacer setSize(float w, float h){
		this.w = w;
		this.h = h;
		return this;
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
		        //println("Loaded image "+childFile.getName());          
		    }
		  }
		}
	}

	void displayImageAt(int n, PVector pos, float w, float h){
		if(n<images.length){
			PImage img = images[n];
			String name = imageNames[n];
			image(img, pos.x, pos.y, w, h);
			if(showNames){
				textAlign(CENTER); fill(0);
				text(name, pos.x + w/2, pos.y + h/2);
			}
			if(showBorder){
				noFill(); stroke(0); strokeWeight(2);
				rect(pos.x, pos.y, w, h);
			}
		}
	}

	void displayImageAt(int n){
		if(n<images.length){
			PImage img = images[n];
			String name = imageNames[n];
			image(img, pos.x, pos.y, w, h);
			if(showNames){
				textAlign(CENTER); fill(0);
				text(name, pos.x + w/2, pos.y + h/2);
			}
			if(showBorder){
				noFill(); stroke(0); strokeWeight(2);
				rect(pos.x, pos.y, w, h);
			}
		}
	}
}