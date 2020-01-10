################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/main.c \
../Core/Src/stm32l1xx_hal_msp.c \
../Core/Src/stm32l1xx_it.c \
../Core/Src/syscalls.c \
../Core/Src/sysmem.c \
../Core/Src/system_stm32l1xx.c \
../Core/Src/vl53l0x_platform.c 

OBJS += \
./Core/Src/main.o \
./Core/Src/stm32l1xx_hal_msp.o \
./Core/Src/stm32l1xx_it.o \
./Core/Src/syscalls.o \
./Core/Src/sysmem.o \
./Core/Src/system_stm32l1xx.o \
./Core/Src/vl53l0x_platform.o 

C_DEPS += \
./Core/Src/main.d \
./Core/Src/stm32l1xx_hal_msp.d \
./Core/Src/stm32l1xx_it.d \
./Core/Src/syscalls.d \
./Core/Src/sysmem.d \
./Core/Src/system_stm32l1xx.d \
./Core/Src/vl53l0x_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/main.o: ../Core/Src/main.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/main.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/stm32l1xx_hal_msp.o: ../Core/Src/stm32l1xx_hal_msp.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32l1xx_hal_msp.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/stm32l1xx_it.o: ../Core/Src/stm32l1xx_it.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/stm32l1xx_it.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/syscalls.o: ../Core/Src/syscalls.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/syscalls.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/sysmem.o: ../Core/Src/sysmem.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/sysmem.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/system_stm32l1xx.o: ../Core/Src/system_stm32l1xx.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/system_stm32l1xx.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Core/Src/vl53l0x_platform.o: ../Core/Src/vl53l0x_platform.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/Src/vl53l0x_platform.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

