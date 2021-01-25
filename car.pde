class Car{
	float x;
	float y;
	float angle;
	float radius;
	float angle_increment = 0.5; // degrees

	Car(float init_x, float init_y, float init_angle, float init_radius){
		x = init_x;
		y = init_y;
		angle = init_angle;
		radius = init_radius;
	}

	void update(boolean [] keys){
		if (keys[0]){
			angle = angle - angle_increment;
		}
		if (keys[1]){
			angle = angle + angle_increment;
		}
		if (keys[3]){    
			y = y + disp_increment * cos(radians(angle));
			x = x + disp_increment * sin(radians(angle));
		}
		
		if (keys[2]){
			y = y - disp_increment * cos(radians(angle));
			x = x - disp_increment * sin(radians(angle));
		}
	}
};
