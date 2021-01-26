class Car{

	// some variable declaration here
	PVector pos;
	PVector vel;
	PVector acc;
	float angle;
	float radius;
	float angle_increment; // degrees
	float acc_magnitude;
	float f_acc_magnitude;

	Car(float init_x, float init_y, float init_angle, float init_radius,
			float angle_increment, float acc_magnitude, float f_acc_magnitude){

		pos = new PVector(init_x, init_y);
		vel = new PVector(0, 0);
		acc = new PVector(0, 0);

		angle = init_angle;
		radius = init_radius;

		this.angle_increment = angle_increment;
		this.acc_magnitude = acc_magnitude;
		this.f_acc_magnitude = f_acc_magnitude;
	}

	void update(boolean [] keys){

		// this move the car left, up down and right 
		//this.handleUpDownLeftRight(keys); 

		// this moves the car according to radius of curvature and tangential acceleration - let me know if there are any mistakes in the math please
		this.handleSteeringThrust(keys);

		vel.add(acc);
		this.handleFriction();
		vel.limit(10); // limit the velocity so that it doesn't get too big here
		pos.add(vel);
	}

	void handleFriction(){
		// acceleration due to friction is directly opposite of the impending motion of the car
		PVector f_acc = vel.normalize(null).mult(-f_acc_magnitude);

		// handle case where acceleration due to friction is greater than the velocity
		if (f_acc.mag() >= vel.mag()){
			vel.y = 0;
			vel.x = 0;
		}
		else{
			vel.add(f_acc);
		}
	}

	void handleSteeringThrust(boolean [] keys){
		boolean ran = false;
		float x = 0;
		float y = 0;

		if (keys[0]){ // right

			float vel_mag = vel.mag();

			// dtheta = |ds| / R - change in theta = change in arclength / Radius
			angle -= (180 / PI) * vel_mag / radius; 

			// acceleration = |v|^2 / R in the normal direction
			y -= vel_mag * vel_mag / radius * sin(radians(angle));
			x += vel_mag * vel_mag / radius * cos(radians(angle));
			ran = true;
		}
		if (keys[1]){ // left
			// similiar but equations opposite in direction written here
			float vel_mag = vel.mag();
			angle += (180 / PI) * vel_mag / radius;
			y += vel_mag * vel_mag / radius * sin(radians(angle));
			x -= vel_mag * vel_mag / radius * cos(radians(angle));
			ran = true;
		}
		if (keys[3]){ // down   
			// acceleration in tangential direction
			y += acc_magnitude * cos(radians(angle));
			x += acc_magnitude * sin(radians(angle));
			ran = true;
		}
		
		if (keys[2]){ // up
			// acceleration in tangential direction (but in the opposite direction)
			y -= acc_magnitude * cos(radians(angle));
			x -= acc_magnitude * sin(radians(angle));
			ran = true;
		}

		if (!ran){ // if none of the keys were pressed set acceleration to 0
			acc.y = 0;
			acc.x = 0;
		}else{ // otherwise set acceleration to the combined result of all equations
			acc.x = x;
			acc.y = y;
		}

	}
	void handleUpDownLeftRight(boolean [] keys){
		boolean ran = false;
		float x = 0;
		float y = 0;

		if (keys[0]){ // right
			// acceleration in the normal direction
			y -= acc_magnitude * sin(radians(angle));
			x += acc_magnitude * cos(radians(angle));
			ran = true;
		}
		if (keys[1]){ // left
			y += acc_magnitude * sin(radians(angle));
			x -= acc_magnitude * cos(radians(angle));
			ran = true;
		}
		if (keys[3]){ // down
			// accleration in the tangential direction
			y += acc_magnitude * cos(radians(angle));
			x += acc_magnitude * sin(radians(angle));
			ran = true;
		}
		
		if (keys[2]){ // up
			y -= acc_magnitude * cos(radians(angle));
			x -= acc_magnitude * sin(radians(angle));
			ran = true;
		}
		if (!ran){
			acc.y = 0;
			acc.x = 0;
		}else{
			acc.x = x;
			acc.y = y;
		}

	}
};
