NASM = nasm
FLAGS = -f elf64 

# noms des executables
COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

# nom des fichiers
COLLEEN_SRC = Colleen.s
GRACE_SRC = Grace.s
SULLY_SRC = Sully.s

OBJ_PATH = obj

# objets dans obj/
OBJ_COLLEEN := $(OBJ_PATH)/$(COLLEEN).o
OBJ_GRACE   := $(OBJ_PATH)/$(GRACE).o
OBJ_SULLY   := $(OBJ_PATH)/$(SULLY).o

NAME = $(COLLEEN) $(GRACE) $(SULLY)
OBJS = $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

.PHONY: all fclean clean re

all: $(NAME)

$(COLLEEN): $(OBJ_COLLEEN)
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -lc

$(GRACE): $(OBJ_GRACE)
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -lc

$(SULLY): $(OBJ_SULLY)
	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ $^ -lc

$(OBJ_PATH)/%.o: %.s
	mkdir -p $(OBJ_PATH)
	$(NASM) $(FLAGS) -o $@ $<

clean: 
	rm -fr $(OBJ_PATH)

fclean: clean
	rm -fr $(NAME)

re : fclean all



