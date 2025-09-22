# Compiler and Flags
CC = gcc
CFLAGS = -Wall -Iinclude

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
LIBDIR = lib

# Targets
TARGET = $(BINDIR)/client_static
LIBNAME = libmyutils.a
LIB = $(LIBDIR)/$(LIBNAME)

# Object files
OBJECTS = $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
MAINOBJ = $(OBJDIR)/main.o

# Default build
all: $(LIB) $(TARGET)

# Build static library from object files
$(LIB): $(OBJECTS)
	ar rcs $@ $^

# Build the final program and link with static library
$(TARGET): $(MAINOBJ) $(LIB)
	$(CC) $(CFLAGS) -o $@ $(MAINOBJ) -L$(LIBDIR) -lmyutils

# Compile all .c files into .o files
$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Run the program
run: $(TARGET)
	./$(TARGET)

# Clean up
clean:
	rm -f $(OBJDIR)/*.o $(TARGET) $(LIB)

