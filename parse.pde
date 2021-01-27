boolean parse(String [] args){
	/* true: if training an algorithm; we want to send information over via websockets
	false: if testing, we do not want to send information*/
	if (args == null){
		return false;
	}
	assert(args.length == 1);

	if ("train".contains(args[0])){
		return true;
	}
	else{
		return false;
	}
}
