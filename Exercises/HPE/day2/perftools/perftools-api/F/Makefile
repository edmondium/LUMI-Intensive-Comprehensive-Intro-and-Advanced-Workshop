INCLUDES = -I. 

FC = ftn

FCFLAGS = -eF

FCLINKFLAGS = 

EXE=himeno.exe

OBJS    = himeno.o

all: $(EXE)

$(EXE): $(OBJS)
	$(FC) $(FCLINKFLAGS) $< -o $@

%.o: %.f
	$(FC) $(FCFLAGS) $(INCLUDES) -c $< -o $@	
	
himeno.o: param.h

clean:
	rm -rf $(EXE) $(OBJS) *.i

cleanall: clean
	rm -rf my_output* *.rpt myrep* *.out *.lst *+pat *+apa *.ap2 *.xf *_exp.*

