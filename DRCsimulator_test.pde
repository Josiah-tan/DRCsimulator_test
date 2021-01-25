// for keyboard control
boolean keys[] = new boolean[4];

// Communication with Python
boolean enable_web_socket = true; //if true, turn on websockets
ClientWebSocket client = new ClientWebSocket(enable_web_socket);


/* track settings */
String img_file = "drc_track.png";

int view_factor_x = 10; // increases the image size
int view_factor_y = 10;

int view_z = 0; // distance the image is away from us
float dist_z = -(360/2.0) / tan(PI*30.0 / 180.0); // actual distance from normal setting (view_z = 0)
float view_plane_x_angle = 50; // angle of the cartesian plane rotated about x for viewing

Track track = new Track(img_file, view_factor_x, view_factor_y, view_z, dist_z, view_plane_x_angle);


/* car settings */
// initial position settings
float init_x = 1680;
float init_y = 1238;

// initial rotation settings
float init_angle = -82;
int radius = 300; // radius of curvature

// constant increments
float angle_increment = 0.5; // degrees
float acc_magnitude = 0.1; // magnitude of acceleration
float f_acc_magnitude = 0.02;

Car car = new Car(init_x, init_y, init_angle, radius, angle_increment, acc_magnitude, f_acc_magnitude);


void setup() {
	track.setup();

  size(640, 360, P3D); // initialising the canvas

	client.connect(this, "127.0.0.1", 5000); //initialising the websocket connection
}

void draw() {
  background(255);

	car.update(keys);
	track.update(car.pos.x, car.pos.y, car.angle);

	client.write(keys);
}
