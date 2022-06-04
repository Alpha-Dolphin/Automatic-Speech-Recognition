#Ben Elleman
#Lab 6 makefile
all:  tags headers 

headers: *.c tags
	headers.sh

tags: *.c
	ctags -R .

atest: atest.o analyze.s a_shim.o evaluate.o
	gcc -g -m64  -o $@ $^ 

lab6: lab6.o analyze.s search.s a_shim.o s_shim.o print.o evaluate.o
	gcc -g -m64  -o $@ $^ 

#change the lab number
lab6.zip:	makefile *.o *.c *.h *.s README_LAB6 
	zip $@ $^
	rm -rf install
	mkdir install
	unzip lab6.zip -d install

# this is our master compiler rule to generate .o files.
# It needs all 4 warnings

%.o:%.c *.h
	gcc -ansi -pedantic -Wimplicit-function-declaration -Wreturn-type -g -c $< -o $@


