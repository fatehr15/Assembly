CC = gcc
ASM = nasm
CFLAGS = -Wall -Wextra -Iinclude
ASMFLAGS = -f elf64
LDFLAGS = -lcriterion

SRC_DIR = src
BUILD_DIR = build
TESTS_DIR = tests

all: dirs $(BUILD_DIR)/asm_test

dirs:
    @mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/assembly_library.o: $(SRC_DIR)/assembly_library.asm
    $(ASM) $(ASMFLAGS) $< -o $@

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.c
    $(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/asm_test: $(BUILD_DIR)/main.o $(BUILD_DIR)/assembly_library.o
    $(CC) $^ -o $@

test: $(BUILD_DIR)/assembly_library.o
    $(CC) $(CFLAGS) $(TESTS_DIR)/unit_tests.c $< $(LDFLAGS) -o $(BUILD_DIR)/unit_tests
    $(BUILD_DIR)/unit_tests

clean:
    rm -rf $(BUILD_DIR)

.PHONY: all dirs test clean
