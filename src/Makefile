# ==========================
# Sub-Makefile (src/)
# ==========================
CC = gcc
CFLAGS = -Wall -I../include
OBJ_DIR = ../obj
BIN_DIR = ../bin
TARGET = $(BIN_DIR)/client

SRC = main.c mystrfunctions.c myfilefunctions.c
OBJ = $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRC))

.PHONY: all clean

all: $(TARGET)

$(TARGET): $(OBJ)
	@echo "🔗 Linking object files into $@..."
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: %.c
	@echo "⚙️  Compiling $<..."
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "🧹 Cleaning objects in src/..."
	rm -f $(OBJ_DIR)/*.o $(TARGET)
