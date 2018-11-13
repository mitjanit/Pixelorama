
class ImageGrid extends ImagePlacer {

	int numCols, numRows;

	ImageGrid(){
		super();
	}

	ImageGrid setGrid(int nc, int nr){
		this.numCols = nc;
		this.numRows = nr;
		return this;
	}

	void displayGrid(){
		displayGrid(0, imageCount-1);
	}

	void displayGrid(int index1, int index2){
		float colWidth = w / (float) numCols;
		float rowHeight = h / (float) numRows;
		for(int r=0; r<numRows; r++){
			for(int c=0; c<numCols; c++){
				int index = index1 + c + r*numCols;
				if(index>index2) break;
				float x = pos.x + colWidth*c;
				float y = pos.y + rowHeight*r;
				displayImageAt(index, new PVector(x, y), colWidth, rowHeight);
			}
		}
	}

	void displayGrid(int index1, int index2, int nCols, int nRows, PVector orig, float w, float h){
		float colWidth = w / (float) nCols;
		float rowHeight = h / (float) nRows;
		for(int r=0; r<nRows; r++){
			for(int c=0; c<nCols; c++){
				int index = index1 + c + r*nCols;
				if(index>index2) break;
				float x = orig.x + colWidth*c;
				float y = orig.y + rowHeight*r;
				displayImageAt(index, new PVector(x, y), colWidth, rowHeight);
			}
		}
	}
}