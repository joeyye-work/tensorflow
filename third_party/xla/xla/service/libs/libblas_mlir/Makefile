# List of source files
SRCS := sgemm.cpp sgemv.cpp sbatch_matmul_3d.cpp sbatch_matmul_4d.cpp
KERNELS_DIR := kernels
KERNEL_SRCS := $(wildcard $(KERNELS_DIR)/*.s)

# Source directory
SRC_DIR := src

# Output directory
BUILD := build

# Compiler and flags
CC := gcc
CFLAGS := -S -I include -O3
ASFLAGS := -c -O3
LDFLAGS := -shared

# Full paths
SRC_PATHS := $(SRCS:%=$(SRC_DIR)/%)
ASM := $(SRCS:%.cpp=$(BUILD)/%.s)
OBJS := $(SRCS:%.cpp=$(BUILD)/%.o)
KERNEL_OBJS := $(KERNEL_SRCS:$(KERNELS_DIR)/%.s=$(BUILD)/%.o)

# All object files
ALL_OBJS := $(OBJS) $(KERNEL_OBJS)

# Default target
all: $(BUILD) $(ASM) $(ALL_OBJS) $(BUILD)/libblas_mlir.so

# Create build directory
$(BUILD):
	@mkdir -p $(BUILD)

# Compile each .cpp file to .s in build/
$(BUILD)/%.s: $(SRC_DIR)/%.cpp
	@$(CC) $(CFLAGS) $< -o $@

# Assemble .s to .o
$(BUILD)/%.o: $(BUILD)/%.s
	@$(CC) $(ASFLAGS) $< -o $@

# Assemble kernels .s to .o
$(BUILD)/%.o: $(KERNELS_DIR)/%.s | $(BUILD)
	@$(CC) $(ASFLAGS) $< -o $@

# Link .o files into lib.so
$(BUILD)/libblas_mlir.so: $(ALL_OBJS)
	@$(CC) $(LDFLAGS) -o $@ $^

# Clean target
clean:
	@rm -rf $(BUILD)