CC = cc
SRCDIR = ./src
OBJDIR = ./build
LIBDIR_GNL = ./lib/get_next_line
LIBDIR_LIBFT = ./lib/libft
LIBDIR_MLX = ./lib/MLX42
HR = $(wildcard include/*.h)

SRCS = $(foreach dir, $(SRCDIR) $(SRCDIR)/* $(SRCDIR)/*/*, $(wildcard $(dir)/*.c)) \
       $(wildcard $(LIBDIR_GNL)/*.c)

OBJS = $(patsubst $(SRCDIR)/%, $(OBJDIR)/%, $(SRCS:.c=.o))
OBJS := $(patsubst $(LIBDIR_GNL)/%, $(OBJDIR)/get_next_line/%, $(OBJS))

CFLAGS = -Iinclude -I$(LIBDIR_GNL) -I$(LIBDIR_LIBFT) -I$(LIBDIR_MLX)/include/MLX42
LDFLAGS = -Llib -L$(LIBDIR_LIBFT) $(LIBDIR_MLX)/build/libmlx42.a
UNAME = $(shell uname)
NAME = cub3d

ifeq ($(UNAME), Linux)
	LDFLAGS += -lglfw -ldl -pthread -lm
endif
ifeq ($(UNAME), Darwin)
	LDFLAGS += -lglfw -L$(shell brew --prefix glfw)/lib -framework Cocoa -framework IOKit 
endif

all: libmlx $(NAME)

libmlx:
	cmake -B $(LIBDIR_MLX)/build $(LIBDIR_MLX) -DCMAKE_CXX_COMPILER="g++"
	cmake --build $(LIBDIR_MLX)/build

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS) $(LDFLAGS) -lft

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HR) | libft
	@mkdir -p $(dir $@)
	$(CC) -c $< -o $@ $(CFLAGS)

$(OBJDIR)/get_next_line/%.o: $(LIBDIR_GNL)/%.c $(HR) | libft
	@mkdir -p $(dir $@)
	$(CC) -c $< -o $@ $(CFLAGS)

libft:
	@make -C $(LIBDIR_LIBFT)

clean:
	rm -rf $(OBJDIR)
	@make -C $(LIBDIR_LIBFT) clean

fclean: clean
	@make -C $(LIBDIR_LIBFT) fclean
	rm -rf $(LIBDIR_MLX)/build
	rm -rf $(NAME)

re: fclean all

.PHONY: all libmlx libft clean fclean re

