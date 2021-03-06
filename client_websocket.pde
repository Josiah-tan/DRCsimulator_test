import processing.net.*; 

class ClientWebSocket{
	// some declaration of variables here
	String str;
	Client myClient;

	boolean enable;
	ClientWebSocket(boolean enable){
		this.enable = enable;
	}

	void connect(DRCsimulator_test other, String host, int port){
		// connect to Python here via websockets
		if (enable){
			myClient = new Client(other, host, port); 
		}
	}

	void write(boolean [] keys){
		if (this.enable){
			str = this.cvtArray2Str(keys); // convert keys to a string [0,1,0,1] => 0101
			myClient.write(str); // write the string to my python script
		}
	}

	String cvtArray2Str( boolean [] keys){
		String build_str = "";
		for (boolean i : keys){
			build_str +=  i ? '1' : '0';
		}
		build_str = build_str + '\n';

		return build_str;
	}
};
