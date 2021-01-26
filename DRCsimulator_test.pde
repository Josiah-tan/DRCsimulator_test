// for keyboard control
boolean keys[] = new boolean[4]; // elements in the array correspond to d, a, w, s respectively

// Communication with Python
boolean enable_web_socket = false; //if true, turn on websockets to send keyboard presses over to python
ClientWebSocket client = new ClientWebSocket(enable_web_socket);


/* track settings */
String img_file = "drc_track.png"; // image file for the track

// increases the image size
int view_factor_x = 10;
int view_factor_y = 10;

int view_z = 0; // distance the image is away from us
float dist_z = -(360/2.0) / tan(PI*30.0 / 180.0); // actual distance from normal setting (view_z = 0) - Don't change this
float view_plane_x_angle = 50; // angle of the cartesian plane rotated about x for viewing

Track track = new Track(img_file, view_factor_x, view_factor_y, view_z, dist_z, view_plane_x_angle);


/* car settings */
// initial position settings
float init_x = 1680;
float init_y = 1238;

// initial rotation settings
float init_angle = -82; // rotation about the z axis
int radius = 500; // radius of curvature

// constant increments
float angle_increment = 0.5; // degrees
float acc_magnitude = 0.1; // magnitude of acceleration
float f_acc_magnitude = 0.02; // magnitude of acceleration due to friction

Car car = new Car(init_x, init_y, init_angle, radius, angle_increment, acc_magnitude, f_acc_magnitude);


void setup() {
	track.setup(); // initialise the track

  size(640, 360, P3D); // initialising the canvas

	client.connect(this, "127.0.0.1", 5000); //initialising the websocket connection
}

void draw() {
  background(255); // set the background to white
	/*
	fill(100);
	textSize(20);
	text("jtan7828", 0, 180);
	*/

	// update the x, y and angle to the z-axis of the car due to keyboard presses
	car.update(keys); 

	// update the position of the track relative to the car (note that the track moves rather than the car itself)
	track.update(car.pos.x, car.pos.y, car.angle); 

	// write the keys over to Python
	client.write(keys);
}
