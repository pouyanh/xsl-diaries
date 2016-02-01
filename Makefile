CC = gcc
LD = gcc
RM = rm
MKDIR = mkdir
CFLAGS =
LDFLAGS =

DIR_SUFF = DIR--

SRC_DIR = src
BUILD_DIR = build
OBJ_DIR = $(BUILD_DIR)/obj
BIN_DIR = $(BUILD_DIR)

all: .pre-build $(BIN_DIR)/xsl-diaries

.pre-build: $(BUILD_DIR)$(DIR_SUFF) $(OBJ_DIR)$(DIR_SUFF) $(BIN_DIR)$(DIR_SUFF)

%$(DIR_SUFF):
	$(eval DIR_NAME = $(subst $(DIR_SUFF),,$@))
	if [ ! -d $(DIR_NAME) ]; then $(MKDIR) -p $(DIR_NAME); fi

$(BIN_DIR)/xsl-diaries: $(OBJ_DIR)/main.o
	$(LD) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	$(RM) -rf $(BUILD_DIR)

