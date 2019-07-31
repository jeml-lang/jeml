BUILDFILES  = ${wildcard *.java}   \
							${wildcard *.tokens} \
							${wildcard *.interp}

ANTLR = java org.antlr.v4.Tool
GRUN =  java org.antlr.v4.gui.TestRig

jemlmake:
	make clean
	${ANTLR} jeml.g4
	make build

build:
	javac jeml*.java

run:
	${GRUN} jeml document -gui examples/v100.jeml

.PHONY: clean

clean:
	rm -rf ${BUILDFILES} *.class
