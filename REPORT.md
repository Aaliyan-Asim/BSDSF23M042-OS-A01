# Report Questions
## Feature 2
### Q1. Explain the linking rule in this part's Makefile:  
**Rule:**
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

**Answer:**  
- $(TARGET) → the final executable (e.g., bin/client).  
- $(OBJECTS) → object files generated from .c files.  
- $@ → target being built.  
- $^ → all prerequisites.  
This links object files directly into one binary. With libraries, we would instead link against precompiled archives (.a or .so).

---

### Q2. What is a git tag and why is it useful?  
A git tag marks a specific commit for reference, usually for releases.  
- Simple tag → lightweight pointer.  
- Annotated tag → includes metadata and a message.  
Tags are useful for versioning and identifying stable points.

---

### Q3. What is the purpose of creating a "Release" on GitHub?  
A GitHub Release packages a tagged commit into a user-friendly version.  
- Purpose: distribute stable versions.

## Feature 3: Static Library

### Q1: Differences between Makefile in Part 2 and Part 3
- In Part 2, the Makefile directly compiled all `.c` files into object files and linked them into `bin/client`.  
- In Part 3, a **static library (`lib/libmyutils.a`)** was created:  
  - Utility object files (`.o`) are archived into the library using `ar`.  
  - The main program (`client_static`) links against the static library instead of individual object files.  
  - New variables and rules (`LIB_NAME`, `LIB_DIR`, `AR`) were added to handle library creation.  

This structure is modular and scalable, making it easier to manage larger projects.

---

### Q2: Purpose of `ar` and `ranlib`
- `ar` → archives multiple `.o` files into a single static library (`.a`).  
- `ranlib` → generates an index for the library so the linker can quickly locate symbols.  

Modern systems often combine these steps (`ar rcs`), but using `ranlib` is standard practice to ensure the library is properly indexed.

---

### Q3: Symbols in `client_static` when using `nm`
- Running `nm bin/client_static` shows that functions like `mystrlen` **do not appear as separate external symbols**.  
- This demonstrates that static linking **embeds the function code directly** into the executable at link time.  
- The final binary is self-contained and does not require the library at runtime for these functions.
