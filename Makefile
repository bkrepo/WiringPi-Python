all: bindings
	python setup.py build

bindings:
	swig2.0 -python wiringpi.i

clean:
	rm -rf build/
	rm -rf dist/

install:
	sudo python setup.py install
