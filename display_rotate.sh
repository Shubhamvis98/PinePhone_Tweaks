#!/bin/sh

if [ "$1" == 'p' ]
then
	#portrait
	xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
elif [ "$1" == 'pi' ]
	#inv_portrait
	xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' -1 0 1 0 -1 1 0 0 1
elif [ "$1" == 'l' ]
	#landscape
	xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' 0 1 0 -1 0 1 0 0 1
elif [ "$1" == 'li' ]
	#inv_landscape
	xinput set-prop 'ADS7846 Touchscreen' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
fi