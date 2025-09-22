# Root Makefile for OS Assignment
# Supports: multifile, static, dynamic builds + install + man pages

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -g
PICFLAGS = -fPIC

# Directories
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib
MAN_DIR = man/man3

# Targets
TARGET = $(BIN_DIR)/client
STATIC_TARGET = $(BIN_DIR)/client_static
DYNAMIC_TARGET = $(BIN_DIR)/client_dynamic
STATIC_LIB = $(LIB_DIR)/libmyutils.a
DYNAMIC_LIB = $(LIB_DIR)/libmyutils.so

# Source files
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRC_FILES))
LIB_OBJS = $(filter-out $(OBJ_DIR)/main.o, $(OBJ_FILES))  # utility functions only

# Default target
all: $(TARGET) $(STATIC_TARGET) $(DYNAMIC_TARGET)

# Create object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Build simple multifile executable
$(TARGET): $(OBJ_FILES)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# Build static library
$(STATIC_LIB): $(LIB_OBJS)
	@mkdir -p $(LIB_DIR)
	ar rcs $@ $^

# Build executable linked with static library
$(STATIC_TARGET): $(STATIC_LIB) $(OBJ_DIR)/main.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils

# Build dynamic library
$(DYNAMIC_LIB): $(LIB_OBJS)
	@mkdir -p $(LIB_DIR)
	$(CC) $(PICFLAGS) -shared -o $@ $^

# Build executable linked with dynamic library
$(DYNAMIC_TARGET): $(DYNAMIC_LIB) $(OBJ_DIR)/main.o
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJ_DIR)/main.o -L$(LIB_DIR) -lmyutils -Wl,-rpath=$(LIB_DIR)

# Install target
.PHONY: install
install:
	@echo "Installing executable and man pages..."
	sudo mkdir -p /usr/local/bin
	sudo mkdir -p /usr/local/share/man/man3
	sudo cp $(DYNAMIC_TARGET) /usr/local/bin/client
	sudo cp $(MAN_DIR)/*.1 /usr/local/share/man/man3/

# Clean build
.PHONY: clean
clean:
	rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/* $(LIB_DIR)/*

# End of Makefile

