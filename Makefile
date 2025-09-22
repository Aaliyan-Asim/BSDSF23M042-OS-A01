# ===============================
# Makefile for Dynamic Library Build
# Feature 4 – Operating Systems Assignment
# ===============================

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Iinclude

# Directories
SRC_DIR = src
OBJ_DIR = obj
LIB_DIR = lib
BIN_DIR = bin

# Targets
TARGET_DYNAMIC = $(BIN_DIR)/client_dynamic
DYN_LIB = $(LIB_DIR)/libmyutils.so

# Object files
OBJS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o

# ===============================
# Default target: build dynamic executable
# ===============================
all: $(TARGET_DYNAMIC)

# Compile object files with position-independent code for dynamic library
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -fPIC -c $< -o $@

# Build the dynamic library (.so)
$(DYN_LIB): $(OBJS)
	$(CC) -shared -o $@ $^

# Build dynamic client executable
$(TARGET_DYNAMIC): $(SRC_DIR)/main.c $(DYN_LIB)
	$(CC) $(CFLAGS) -o $@ $< -L$(LIB_DIR) -lmyutils

# ===============================
# Clean build artifacts
# ===============================
.PHONY: clean
clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET_DYNAMIC) $(DYN_LIB)

# ===============================
# Optional: Rebuild everything
# ===============================
.PHONY: rebuild
rebuild: clean all
