BUILDFILES  = ${wildcard *.java}   \
							${wildcard *.tokens} \
							${wildcard *.interp}

BUILDDIR = ./build
LIBDIR = ./lib

ANTLR = java org.antlr.v4.Tool
GRUN =  java org.antlr.v4.gui.TestRig

GRAMMARFILE = jeml.g4

jemlmake:
	make clean
	${ANTLR} -o ${BUILDDIR}/java ${GRAMMARFILE}
	javac ${BUILDDIR}/java/jeml*.java

go:
	${ANTLR} -o ${BUILDDIR}/go -Dlanguage=Go ${GRAMMARFILE}

python:
	${ANTLR} -o ${BUILDDIR}/python -Dlanguage=Python3 ${GRAMMARFILE}

run:
	cd build/java && ${GRUN} jeml document -gui ../../examples/v100.jeml

.PHONY: clean

clean:
	rm -rf ${BUILDDIR} ${LIBDIR}
