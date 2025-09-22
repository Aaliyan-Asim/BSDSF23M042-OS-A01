# Report Questions

```markdown
## Q1. Explain the linking rule in this part's Makefile:  
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

## Q2. What is a git tag and why is it useful?  
A git tag marks a specific commit for reference, usually for releases.  
- Simple tag → lightweight pointer.  
- Annotated tag → includes metadata and a message.  
Tags are useful for versioning and identifying stable points.

---

## Q3. What is the purpose of creating a "Release" on GitHub?  
A GitHub Release packages a tagged commit into a user-friendly version.  
- Purpose: distribute stable versions.  
- Attaching binaries: lets users run the program without compiling.  
This makes it easier for end-users to use the software and track project history.
