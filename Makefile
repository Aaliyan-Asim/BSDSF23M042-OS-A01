.PHONY: install
install:
	# Create directories if they don't exist
	sudo mkdir -p /usr/local/bin
	sudo mkdir -p /usr/local/share/man/man3

	# Copy executable (use project bin directory)
	sudo cp $(BIN_DIR)/client_dynamic /usr/local/bin/client

	# Copy man page
	sudo cp man/man3/mycat.1 /usr/local/share/man/man3/
