NAME	=	compil

ASM 	= 	nasm
ASMFLAGS =	-f elf64

CC	=	ld
CFLAGS	=	-fPIC  -shared
LDFLAGS =	-shared

SRC	= test.asm 		\

OBJS	=	$(SRC:.asm=.o)

all 	: 	$(NAME)

$(NAME) :	$(OBJS)
		$(CC) -o $(NAME) $(OBJS)
		rm -f *.o

%.o: %.asm
		$(ASM) $(ASMFLAGS) $< -o $@

clean :
		rm -f $(OBJS)
		rm -f *.o
		rm -f $(NAME)

fclean 	: 	clean
		rm -f $(NAME)

re 	: 	fclean all