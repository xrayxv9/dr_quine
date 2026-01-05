CC = gcc
CFLAGS = -Wall -Werror -Wextra -g

# noms des exécutables
COLLEEN = Colleen
GRACE   = Grace
SULLY   = Sully

# sources
SRC_COLLEEN = Colleen.c
SRC_GRACE   = Grace.c
SRC_SULLY   = Sully.c

OBJ_PATH = obj

# objets (dans obj/)
OBJ_COLLEEN := $(OBJ_PATH)/$(COLLEEN).o
OBJ_GRACE   := $(OBJ_PATH)/$(GRACE).o
OBJ_SULLY   := $(OBJ_PATH)/$(SULLY).o

NAME = $(COLLEEN) $(GRACE) $(SULLY)
OBJS = $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

.PHONY: all clean fclean re

all: $(NAME)

# règles pour produire chaque exécutable
$(COLLEEN): $(OBJ_COLLEEN)
	$(CC) $(CFLAGS) -o $@ $^

$(GRACE): $(OBJ_GRACE)
	$(CC) $(CFLAGS) -o $@ $^

$(SULLY): $(OBJ_SULLY)
	$(CC) $(CFLAGS) -o $@ $^

# règle générique .c -> obj/%.o
$(OBJ_PATH)/%.o: %.c
	mkdir -p $(OBJ_PATH)
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -fr $(OBJ_PATH)

fclean: clean
	rm -fr $(NAME)
	rm -fr Sully_*.c
	rm -fr Grace_kid.c

re: fclean all
