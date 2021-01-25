class Car{
	//float x;
	//float y;
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
		//x = init_x;
		//y = init_y;
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
		this.handleKeys(keys);
		vel.add(acc);
		this.handleFriction();
		vel.limit(10);
		pos.add(vel);
	}

	void handleFriction(){
		PVector f_acc = vel.normalize(null).mult(-f_acc_magnitude);
		if (f_acc.mag() >= vel.mag()){
			vel.y = 0;
			vel.x = 0;
		}
		else{
			vel.add(f_acc);
		}
	}

	void handleKeys(boolean [] keys){
		boolean ran = false;
		if (keys[0]){
			//angle = angle - angle_increment;
			acc.y =  - acc_magnitude * sin(radians(angle));
			acc.x =  + acc_magnitude * cos(radians(angle));
			ran = true;
		}
		if (keys[1]){
			//angle = angle + angle_increment;
			acc.y =  + acc_magnitude * sin(radians(angle));
			acc.x =  - acc_magnitude * cos(radians(angle));
			ran = true;
		}
		if (keys[3]){    
			acc.y =  + acc_magnitude * cos(radians(angle));
			acc.x =  + acc_magnitude * sin(radians(angle));
			ran = true;
		}
		
		if (keys[2]){
			acc.y =  - acc_magnitude * cos(radians(angle));
			acc.x =  - acc_magnitude * sin(radians(angle));
			ran = true;
		}
		if (!ran){
			acc.y = 0;
			acc.x = 0;
		}
	}
};
