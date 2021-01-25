// for keyboard control
boolean keys[] = new boolean[4];

// Communication with Python
boolean record = true; //if true, turn on websockets
ClientWebSocket client = new ClientWebSocket(record);

// Track initialisation
Track track = new Track("drc_track.png");

float initial_x = 1680;
float initial_y = 1238;

// initial rotation settings
float initial_angle = -82;
int radius = 300; // radius of curvature
float angle_increment = 0.5; // degrees

// displacement increments
int disp_increment = 5;


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


	track.update(x, y, angle);

  rotating_z(keys);

	client.write(keys);
}
