///@func blink([offTime], [onTime], [phaseShift, [clock])
///@param {Real} offTime The time that the blink spends in its OFF state (default: 500)
///@param {Real} onTime The time that the blink spends in its ON state (default: same as offTime)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Bool}
///@desc Return a simple blinking value alternating between 0 and 1.
function blink(offTime=500, onTime=offTime, phaseShift=0, clock=current_time) {
	return (clock+phaseShift) mod (offTime+onTime) >= offTime;
}

///@func blink_2way(riseTime, fallTime, phaseShift, clock)
///@param {Real} riseTime The time that the blink spends rising to 1 (default: 500)
///@param {Real} fallTime The time that the blink spends falling back to 0 (default: same as riseTime)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Real}
///@desc Return a bidirectional blinking value going back and forth between 0 and 1.
function blink_2way(riseTime=500, fallTime=riseTime, phaseShift=0, clock=current_time) {
	var _progress_ = (clock+phaseShift) mod (riseTime+fallTime);
	return (_progress_ < riseTime) ? _progress_/riseTime : (1-(_progress_-riseTime)/fallTime);
}

///@func blink_1way(period, phaseShift, clock)
///@param {Real} period The blinking period (default: 1000)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Real}
///@desc Return a blinking value that climbs from 0 to 1, then falls back to 0 and starts over.
function blink_1way(period=1000, phaseShift=0, clock=current_time) {
	return ((clock+phaseShift) mod period)/period;
}

///@func blink_soft(offTime, transTime, onTime, phaseShift, clock)
///@param {Real} offTime The time that the blink spends in its OFF state (default: 250)
///@param {Real} transTime The time that the blink transitions between states (default: 250)
///@param {Real} onTime The time that the blink spends in its ON state (default: same as offTime)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Real}
///@desc Return a blinking value that alternates smoothly between 0 and 1.
function blink_soft(offTime=250, transTime=250, onTime=offTime, phaseShift=0, clock=current_time) {
	var _progress_ = (clock+phaseShift) mod (offTime+onTime+2*transTime);
	// OFF
	if (_progress_ < offTime) {
		return 0;
	}
	// OFF => ON
	_progress_ -= offTime;
	if (_progress_ < transTime) {
		return 1-(cos(pi*_progress_/transTime)+1)/2;
	}
	// ON
	_progress_ -= transTime;
	if (_progress_ < onTime) {
		return 1;
	}
	// ON => OFF
	_progress_ -= onTime;
	return (cos(pi*_progress_/transTime)+1)/2;
}


///@func blink_cos(period, phaseShift, clock)
///@param {Real} period The blinking period (default: 1000)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Real}
///@desc Return a sinusoidal blinking value going back and forth between 0 and 1.
function blink_cos(period=1000, phaseShift=0, clock=current_time) {
	return -(cos(2*pi*((clock+phaseShift) mod period)/period)-1)/2;
}

///@func blink_camel(period, phaseShift, clock)
///@param {Real} period The blinking period (default: 1000)
///@param {Real} phaseShift The shift applied to the time before calculating the blink (default: 0)
///@param {Real} clock The incrementing time variable to use (default: current_time)
///@return {Real}
///@desc Return a positive-only sinusoidal blinking value bouncing from 0 to 1.
function blink_camel(period=1000, phaseShift=0, clock=current_time) {
	return sin(pi*((clock+phaseShift) mod period)/period);
}
