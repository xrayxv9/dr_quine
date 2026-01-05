NASM = nasm
FLAGS = -f elf64 

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g

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
	$(CC) $(CFLAGS) -o $@ $^

$(GRACE): $(OBJ_GRACE)
	$(CC) $(CFLAGS) -o $@ $^

$(SULLY): $(OBJ_SULLY)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_PATH)/%.o: %.s
	mkdir -p $(OBJ_PATH)
	$(NASM) $(FLAGS) -o $@ $<

clean: 
	rm -fr $(OBJ_PATH)

fclean: clean
	rm -fr $(NAME)
	rm -fr Sully_*.s
	rm -fr Grace_kid.s

re : fclean all



