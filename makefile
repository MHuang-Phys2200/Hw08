GRAPH = gnuplot

CC = clang
CFLAGS = -Wall -O0 -g 
LFLAGS = -O0 -g
LIBS = -lgsl -lm
	
glider-1: glider-1.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)
	
glider-2: glider-2.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)
	
glider-3: glider-3.o glider-ode.o
	${CC} $(LFLAGS) -o $@ $^ $(LIBS)

res1: glider-1
	./glider-1 > res1

res2: glider-2
	./glider-2 > res2
	
res3: glider-3
	./glider-3 > res3

glider1.png: glider1.gpl res1
	$(GRAPH) glider1.gpl

glider2.png: glider2.gpl res2
	$(GRAPH) glider2.gpl

glider3.png: glider3.gpl res3
	$(GRAPH) glider3.gpl

clean : 
	rm -f *~
	rm -f *.o
	rm -f glider-1 glider-2 glider-3

veryclean : clean
	rm -f res1 res2 res3 res4 glider1.png glider2.png glider3.png
