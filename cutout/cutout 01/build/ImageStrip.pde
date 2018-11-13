
class ImageStrip extends ImagePlacer {

	int numCols;

	ImageStrip(){
		super();
	}

	ImageStrip setCols(int n){
		this.numCols = n;
		return this;
	}

	void displayStrip(){
		displayStrip(0, imageCount-1);
	}

	void displayStrip(int index1, int index2){
		float colWidth = w / (float)(index2 - index1 + 1);
		for(int index=index1, i=0; index<=index2; index++, i++){
			PVector p = new PVector(pos.x + i*colWidth, pos.y);
			displayImageAt(index, p, colWidth, h);
		}
	}

	void displayStrip(int index1, int index2, PVector orig, float w, float h){
		float colWidth = w / (float)(index2 - index1 + 1);
		for(int index=index1, i=0; index<=index2; index++, i++){
			PVector p = new PVector(orig.x + i*colWidth, orig.y);
			displayImageAt(index, p, colWidth, h);
		}
	}
}