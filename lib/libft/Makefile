CC = cc
CFLAGS = -Wall -Wextra -Werror
NAME = libft.a
HEADER = libft.h

SRC =	ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c ft_isspace.c	\
		ft_strlen.c ft_strnlen.c ft_strchr.c ft_strrchr.c ft_strnstr.c ft_strncmp.c ft_strlcpy.c ft_strlcat.c ft_strncpy.c \
		ft_bzero.c ft_memset.c ft_memcpy.c ft_memchr.c ft_memcmp.c ft_memmove.c	\
		ft_atoi.c ft_calloc.c ft_realloc.c ft_strdup.c ft_strndup.c	\
		ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_split_count.c ft_split_free.c \
		ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
		ft_strmapi.c ft_striteri.c ft_itoa.c \

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $(OBJ)
	@echo "Libft Done !"

%.o: %.c $(HEADER)
	$(CC) -c $(CFLAGS) $<

clean:
	rm -rf $(OBJ) $(BOBJ)

fclean: clean
	rm -rf $(NAME) $(BOBJ)

re: fclean all
