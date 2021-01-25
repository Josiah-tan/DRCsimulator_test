class Track{
	PImage img;
	String img_file;

	// dimensions of screen viewable relative to the whole image
	int view_factor_x;
	int view_factor_y;

	int view_z; // distance the image is away from us
	float dist_z; // actual distance from normal setting (view_z = 0)
	float view_plane_x_angle;
	float bias;

	Track(String img_file, int view_factor_x, int view_factor_y,
				int view_z, float dist_z, float view_plane_x_angle){
		this.img_file = img_file;
		this.view_factor_x = view_factor_x;
		this.view_factor_y = view_factor_y;

		this.view_z = view_z;
		this.dist_z = dist_z;
		this.view_plane_x_angle = view_plane_x_angle; 

		bias = abs(view_z + dist_z) * sin(radians(view_plane_x_angle));
	}

	void setup(){
		img = loadImage(img_file);
	}

	void update(float x, float y, float angle){
		translate(0, 0, this.view_z); // move the image towards the page a little
		translate(width/2, height/2); 
		rotateX(radians(view_plane_x_angle)); // tilt the image like from | to /
		translate(0, bias); // changes the coordinate system so that rotation is from your POV

		rotateZ(radians(angle));
		image(img, -x , -y , width * view_factor_x, height * view_factor_y);
	}
};
