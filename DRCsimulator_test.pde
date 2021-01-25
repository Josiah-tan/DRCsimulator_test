// for keyboard control
boolean keys[] = new boolean[4];

// Communication with Python
boolean record = true; //if true, turn on websockets
ClientWebSocket client = new ClientWebSocket(record);

// Track initialisation
Track track = new Track("drc_track.png");

// create an image object
PImage img;

// screen dimensions


// dimensions of screen viewable relative to the whole image
int view_factor_x = 10;
int view_factor_y = 10;

// view settings
int view_z = 0; // distance the image is away from us
float dist_z = -(360/2.0) / tan(PI*30.0 / 180.0); // actual distance from normal setting (view_z = 0)
float view_plane_x_angle = 50; // angle of the cartesian plane rotated about x for viewing

float initial_x = 1680;
float initial_y = 1238;

// initial rotation settings
float initial_angle = -82;
int radius = 300; // radius of curvature
float angle_increment = 0.5; // degrees

// displacement increments
int disp_increment = 5;

// bias correction from tilt
float bias = abs(view_z + dist_z) * sin(radians(view_plane_x_angle));

/*variables used for backend calculations */
// calculating coordinates of vehicle on a circumference when turning relative to the left corner of the actual image
float x = initial_x;
float y = initial_y;

// angle relative to the vertical axis
float angle = initial_angle;



void setup() {
  // Images must be in the "data" directory to load correctly
  //img = loadImage("drc_track.png");

	track.setup();
  size(640, 360, P3D); // if you change any of this, remember to change stuff below

	client.connect(this, "127.0.0.1", 5000);
}

void draw() {

  background(255);

	/*
  translate(0, 0, view_z); // move the image towards the page a little
  
  //translate(640/2 - bias * sin(radians(angle)), 360/2 + bias * cos(radians(angle))); 
  translate(width/2, height/2); 
  rotateX(radians(view_plane_x_angle)); // tilt the image like from | to /
  translate(0, bias); // changes the coordinate system so that rotation is from your POV
  rotateZ(radians(angle));
  //rect(-x, -y, bias * 2, bias * 2);
  image(img, -x , -y , width * view_factor_x, height * view_factor_y);
	//up_down_left_right(keys);
	*/
	track.update(x, y, angle);

  rotating_z(keys);

	client.write(keys);
}
