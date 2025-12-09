NAME = Colleen

NASM = nasm

FLAGS = -f elf64 
SRC = colleen.s

OBJ_PATH = obj/

OBJ_SRC = $(SRC:.s=.o)
OBJ_BONUS = $(SRC_BONUS:.s=.o)

OBJS_SRC = $(addprefix $(OBJ_PATH), $(OBJ_SRC))
OBJS_BONUS = $(addprefix $(OBJ_PATH), $(OBJ_BONUS))

all: $(NAME)

$(NAME): $(OBJS_SRC)
	gcc $(OBJS_SRC) -static -o $(NAME)

$(OBJ_PATH)%.o:%.s
	mkdir -p $(OBJ_PATH)
	$(NASM) $(FLAGS) $< -o $@

clean: 
	rm -fr $(OBJ_PATH)

fclean: clean
	rm -fr $(NAME)

bonus: $(OBJS_SRC) $(OBJS_BONUS)
	ar -rcs $(NAME) $(OBJS_SRC) $(OBJS_BONUS)
	
re : fclean all

.PHONY: all fclean clean re


