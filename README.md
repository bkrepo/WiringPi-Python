**WiringPi for Python**

WiringPi: An implementation of most of the Arduino Wiring functions for the Raspberry Pi

WiringPi implements new functions for managing IO expanders.

**Testing:**
Build with gcc version 4.9.3 (Ubuntu/Linaro 4.9.3-8ubuntu2~14.04)
Built against Python 2.7.6, Python 3.2.3

**Prerequisites:**
To rebuild the bindings you must first have python-dev, python-setuptools and swig installed.

You **must** have python-dev and python-setuptools installed
If you manually rebuild the bindings with swig -python wiringpi.i

**Get/setup repo:**
```bash
git clone https://github.com/hardkernel/WiringPi-Python.git
cd WiringPi-Python
git submodule init
git submodule update
```

**Build & install with:**
`sudo python setup.py install`

Or Python 3:
`sudo python3 setup.py install`

**Class-based Usage:**
Description incoming!

**Usage:**

	import wiringpi
	
	wiringpi.wiringPiSetup() # For sequential pin numbering, one of these MUST be called before using IO functions
	# OR
	wiringpi.wiringPiSetupSys() # For /sys/class/gpio with GPIO pin numbering
	# OR
	wiringpi.wiringPiSetupGpio() # For GPIO pin numbering

**General IO:**

	wiringpi.pinMode(6,1) # Set pin 6 to 1 ( OUTPUT )
	wiringpi.digitalWrite(6,1) # Write 1 ( HIGH ) to pin 6
	wiringpi.digitalRead(6) # Read pin 6

**Setting up a peripheral:**
WiringPi supports expanding your range of available "pins" by setting up a port expander. The implementation details of
your port expander will be handled transparently, and you can write to the additional pins ( starting from PIN_OFFSET >= 64 )
as if they were normal pins on the Pi.

	wiringpi.mcp23017Setup(PIN_OFFSET,I2C_ADDR)

**Soft Tone**

Hook a speaker up to your Pi and generate music with softTone. Also useful for generating frequencies for other uses such as modulating A/C.

	wiringpi.softToneCreate(PIN)
	wiringpi.softToneWrite(PIN,FREQUENCY)

**Bit shifting:**

	wiringpi.shiftOut(1,2,0,123) # Shift out 123 (b1110110, byte 0-255) to data pin 1, clock pin 2

**Serial:**

	serial = wiringpi.serialOpen('/dev/ttySAC2', 115200) # Requires device/baud and returns an ID
	wiringpi.serialPuts(serial,"Hello ODROID\r\n")
	wiringpi.serialClose(serial) # Pass in ID

**Full details at:**
http://www.wiringpi.com
