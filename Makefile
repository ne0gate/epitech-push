##
## EPITECH PROJECT, 2022
## Makefile
## File description:
## Makefile that build the project
##

NAME	=		my_hunter

CPPFLAGS = -I include

CFLAGS	= 		-W -Wall -Wextra

SRC		=		./src/main.c					\
				./src/game/game_view.c			\
				./src/hunter.c					\

OBJ		=		$(SRC:.c=.o)

CSFML	=		-lcsfml-graphics -lcsfml-system -lcsfml-audio -lcsfml-window

$(NAME):	$(OBJ)
		gcc -o $(NAME) -I../include $(OBJ) $(CPPFLAGS)

all:	$(OBJ)
		gcc $(OBJ) -o $(NAME) -I../include $(CFLAGS) $(CSFML) $(CPPFLAGS)


apple:	$(OBJ)
		/usr/bin/arch -x86_64 gcc $(SRC) -o $(NAME) -I../include $(CFLAGS) $(CSFML) $(CPPFLAGS)

clean:
		rm -f $(OBJ)

fclean:	clean
		rm -f $(NAME)

debug:	CFLAGS+= -g
debug:	all

perf:	fclean
perf:	CFLAGS+= -pg
perf:	all

re:	fclean all
re_apple:	fclean apple

.PHONY:	all apple clean fclean debug perf re