# ==========================
# Root Makefile
# ==========================

SUBDIRS = src

.PHONY: all clean run

all:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir; \
	done

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	@echo "🧹 Root clean complete."

run:
	./bin/client
