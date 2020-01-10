################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/VL53L0X/vl53l0x_api.c \
../Drivers/VL53L0X/vl53l0x_api_calibration.c \
../Drivers/VL53L0X/vl53l0x_api_core.c \
../Drivers/VL53L0X/vl53l0x_api_ranging.c \
../Drivers/VL53L0X/vl53l0x_api_strings.c \
../Drivers/VL53L0X/vl53l0x_platform_log.c 

OBJS += \
./Drivers/VL53L0X/vl53l0x_api.o \
./Drivers/VL53L0X/vl53l0x_api_calibration.o \
./Drivers/VL53L0X/vl53l0x_api_core.o \
./Drivers/VL53L0X/vl53l0x_api_ranging.o \
./Drivers/VL53L0X/vl53l0x_api_strings.o \
./Drivers/VL53L0X/vl53l0x_platform_log.o 

C_DEPS += \
./Drivers/VL53L0X/vl53l0x_api.d \
./Drivers/VL53L0X/vl53l0x_api_calibration.d \
./Drivers/VL53L0X/vl53l0x_api_core.d \
./Drivers/VL53L0X/vl53l0x_api_ranging.d \
./Drivers/VL53L0X/vl53l0x_api_strings.d \
./Drivers/VL53L0X/vl53l0x_platform_log.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/VL53L0X/vl53l0x_api.o: ../Drivers/VL53L0X/vl53l0x_api.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_api.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/VL53L0X/vl53l0x_api_calibration.o: ../Drivers/VL53L0X/vl53l0x_api_calibration.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_api_calibration.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/VL53L0X/vl53l0x_api_core.o: ../Drivers/VL53L0X/vl53l0x_api_core.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_api_core.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/VL53L0X/vl53l0x_api_ranging.o: ../Drivers/VL53L0X/vl53l0x_api_ranging.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_api_ranging.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/VL53L0X/vl53l0x_api_strings.o: ../Drivers/VL53L0X/vl53l0x_api_strings.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_api_strings.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"
Drivers/VL53L0X/vl53l0x_platform_log.o: ../Drivers/VL53L0X/vl53l0x_platform_log.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32L152xE -DDEBUG -c -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc -I../Core/Inc -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Include -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy -IC:/Users/Simon.Kupfer.ATS-INTRANET/STM32Cube/Repository/STM32Cube_FW_L1_V1.9.0/Drivers/CMSIS/Device/ST/STM32L1xx/Include -I"C:/Projekte/VL53L0XonSTM32_Test/Drivers/VL53L0X" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Inc" -I"C:/Projekte/VL53L0XonSTM32_Test/Core/Src" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Drivers/VL53L0X/vl53l0x_platform_log.d" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

