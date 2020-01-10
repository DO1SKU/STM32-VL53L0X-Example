################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/VL53L0X/subdir.mk
-include Drivers/STM32L1xx_HAL_Driver/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
VL53L0XonSTM32_Test.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
VL53L0XonSTM32_Test.list \


# All Target
all: VL53L0XonSTM32_Test.elf secondary-outputs

# Tool invocations
VL53L0XonSTM32_Test.elf: $(OBJS) $(USER_OBJS) C:\Projekte\VL53L0XonSTM32_Test\STM32L152RETX_FLASH.ld
	arm-none-eabi-gcc -o "VL53L0XonSTM32_Test.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m3 -T"C:\Projekte\VL53L0XonSTM32_Test\STM32L152RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="VL53L0XonSTM32_Test.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

VL53L0XonSTM32_Test.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "VL53L0XonSTM32_Test.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
