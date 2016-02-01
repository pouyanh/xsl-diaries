CC = gcc
LD = gcc
RM = rm
MKDIR = mkdir
LN = ln

CFLAGS =
LDFLAGS =

DIR_SUFF = DIR--

SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
XSL_DIR = $(BUILD_DIR)/xsl
BIN_DIR = $(BUILD_DIR)

DIRS = $(sort $(BUILD_DIR) $(OBJ_DIR) $(BIN_DIR))

all: .pre-build $(BIN_DIR)/xsl-diaries

.pre-build: $(DIRS) $(XSL_DIR)

$(DIRS):
	$(MKDIR) -p $@

$(XSL_DIR):
	$(LN) -s $(abspath $(BUILD_DIR)/../stylesheets) $@

$(BIN_DIR)/xsl-diaries: $(OBJ_DIR)/main.o
	$(LD) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	$(RM) -rf $(BUILD_DIR)

