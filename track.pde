class Track{
	PImage img;

	// dimensions of screen viewable relative to the whole image
	int view_factor_x = 10;
	int view_factor_y = 10;

	int view_z = 0; // distance the image is away from us
	float dist_z = -(360/2.0) / tan(PI*30.0 / 180.0); // actual distance from normal setting (view_z = 0)
	float view_plane_x_angle = 50; // angle of the cartesian plane rotated about x for viewing
	float bias;

	Track(){

		bias = abs(view_z + dist_z) * sin(radians(view_plane_x_angle));
	}

	void update(float x, float y, float angle){
		translate(0, 0, view_z); // move the image towards the page a little
		translate(width/2, height/2); 
		rotateX(radians(view_plane_x_angle)); // tilt the image like from | to /
		translate(0, bias); // changes the coordinate system so that rotation is from your POV

		rotateZ(radians(angle));
		image(img, -x , -y , width * view_factor_x, height * view_factor_y);
	}
};
