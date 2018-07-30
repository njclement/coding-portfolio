CC = gcc
FC = gfortran
TARGET = render
OBJS = render.o bmp.o

$(TARGET) : $(OBJS)
		$(FC) -o $(TARGET) $(OBJS)

bmp.o: bmp.c
	$(CC) -c bmp.c

render.o: render.f95
	$(FC) -c render.f95

clean:
	rm -vf *.o drawing*


