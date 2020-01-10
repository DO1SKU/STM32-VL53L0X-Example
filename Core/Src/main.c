/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "vl53l0x_api.h"

I2C_HandleTypeDef hi2c1;

UART_HandleTypeDef huart2;


/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

int LeakyFactorFix8 = (int)( 0.6 *256);

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

typedef enum {
	LONG_RANGE = 0,
	HIGH_SPEED = 1,
	HIGH_ACCURACY = 2,
} RangingConfig_e;

VL53L0X_RangingMeasurementData_t RangingMeasurementData;

VL53L0X_Dev_t VL53L0XDevs = { .Id=0, .DevLetter='i', .I2cHandle=&hi2c1, .I2cDevAddr=0x52 };

int InitSensors()
{
	int status;
	uint16_t Id = 1;
	VL53L0X_Dev_t *pDev;
	pDev = &VL53L0XDevs;
	pDev->I2cDevAddr = 0x52;
	pDev->Present = 0;
	HAL_Delay(2);

	printf("InitSensor...\n");

	if(status == VL53L0X_ERROR_NONE)
	{
		status = VL53L0X_WrByte(pDev, 0x88, 0x00);
	}
	status = VL53L0X_RdWord(pDev, VL53L0X_REG_IDENTIFICATION_MODEL_ID, &Id);
	if(status)
	{
		printf("Read id fail\n");
	}
	if (Id == 0xEEAA)
	{
		printf("Sensor found...\n");
	}

	status = VL53L0X_DataInit(pDev);
	if (status == 0)
	{
		pDev->Present = 1;
	}
	else
	{
		printf("VL53L0X_DataInit fail...\n");
	}


}

void SetupSingleShot (RangingConfig_e rangingConfig)
{
	int status;
	uint8_t VhvSettings;
	uint8_t PhaseCal;
	uint32_t refSpadCount;
	uint8_t isApertureSpads;
	FixPoint1616_t signalLimit = (FixPoint1616_t)(0.25*65536);
	FixPoint1616_t sigmaLimit = (FixPoint1616_t)(18*65536);
	uint32_t timingBudget = 33000;
	uint8_t preRangeVcselPeriod = 14;
	uint8_t finalRangeVcselPeriod = 10;

	if (VL53L0XDevs.Present)
	{
		status=VL53L0X_StaticInit(&VL53L0XDevs);
		if(status)
		{
			printf("VL53L0X_StaticInit failed...\n");
		}
		status = VL53L0X_PerformRefCalibration(&VL53L0XDevs, &VhvSettings, &PhaseCal);
		if(status)
		{
			printf("PerformCalib failed...\n");
		}
		status = VL53L0X_PerformRefSpadManagement(&VL53L0XDevs, &refSpadCount , &isApertureSpads);
		if (status)
		{
			printf("RefSpadManagement failes...\n");
		}
		status = VL53L0X_SetDeviceMode(&VL53L0XDevs, VL53L0X_DEVICEMODE_SINGLE_RANGING);
		if (status)
		{
			printf("SetDeviceMode failed...\n");
		}
		status = VL53L0X_SetLimitCheckEnable(&VL53L0XDevs, VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, 1);
		if (status)
		{
			printf("SetLimitCheckEnable failed 1...\n");
		}
		status = VL53L0X_SetLimitCheckEnable(&VL53L0XDevs, VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, 1);
		if (status)
		{
			printf("SetLimitCheckEnable failed 2...\n");
		}
        switch(rangingConfig) {
        case LONG_RANGE:
        	signalLimit = (FixPoint1616_t)(0.1*65536);
        	sigmaLimit = (FixPoint1616_t)(60*65536);
        	timingBudget = 33000;
        	preRangeVcselPeriod = 18;
        	finalRangeVcselPeriod = 14;
        	break;
        case HIGH_ACCURACY:
			signalLimit = (FixPoint1616_t)(0.25*65536);
			sigmaLimit = (FixPoint1616_t)(18*65536);
			timingBudget = 200000;
			preRangeVcselPeriod = 14;
			finalRangeVcselPeriod = 10;
			break;
        case HIGH_SPEED:
			signalLimit = (FixPoint1616_t)(0.25*65536);
			sigmaLimit = (FixPoint1616_t)(32*65536);
			timingBudget = 20000;
			preRangeVcselPeriod = 14;
			finalRangeVcselPeriod = 10;
			break;
        default:
        	printf("Not Supported");
        }

        status = VL53L0X_SetLimitCheckValue(&VL53L0XDevs,  VL53L0X_CHECKENABLE_SIGNAL_RATE_FINAL_RANGE, signalLimit);
		if( status ){
		   printf("VL53L0X_SetLimitCheckValue failed\n");
		}

		status = VL53L0X_SetLimitCheckValue(&VL53L0XDevs,  VL53L0X_CHECKENABLE_SIGMA_FINAL_RANGE, sigmaLimit);
		if( status ){
		   printf("VL53L0X_SetLimitCheckValue failed\n");
		}

        status = VL53L0X_SetMeasurementTimingBudgetMicroSeconds(&VL53L0XDevs,  timingBudget);
        if( status ){
           printf("VL53L0X_SetMeasurementTimingBudgetMicroSeconds failed\n");
        }

        status = VL53L0X_SetVcselPulsePeriod(&VL53L0XDevs,  VL53L0X_VCSEL_PERIOD_PRE_RANGE, preRangeVcselPeriod);
		if( status ){
		   printf("VL53L0X_SetVcselPulsePeriod failed\n");
		}

        status = VL53L0X_SetVcselPulsePeriod(&VL53L0XDevs,  VL53L0X_VCSEL_PERIOD_FINAL_RANGE, finalRangeVcselPeriod);
		if( status ){
		   printf("VL53L0X_SetVcselPulsePeriod failed\n");
		}

		status = VL53L0X_PerformRefCalibration(&VL53L0XDevs, &VhvSettings, &PhaseCal);
		if( status ){
		   printf("VL53L0X_PerformRefCalibration failed\n");
		}

        VL53L0XDevs.LeakyFirst=1;
	}
}

void Sensor_SetNewRange(VL53L0X_Dev_t *pDev, VL53L0X_RangingMeasurementData_t *pRange)
{
	if( pRange->RangeStatus == 0)
	{
		if (pDev->LeakyFirst)
		{
			pDev->LeakyFirst = 0;
			pDev->LeakyRange = pRange->RangeMilliMeter;
		}
		else
		{
			pDev->LeakyRange = (pDev->LeakyRange*LeakyFactorFix8 + (256 - LeakyFactorFix8)*pRange->RangeMilliMeter)>>8;
		}

	}
	else
	{
		pDev->LeakyFirst =1;
	}
}

int RangeDemo(int UseSensorsMaask, RangingConfig_e rangingConfig)
{
	int status;
	SetupSingleShot(rangingConfig);

	while(1)
	{

		status = VL53L0X_PerformSingleRangingMeasurement(&VL53L0XDevs, &RangingMeasurementData);
		if (status)
		{
			printf("Could not Measure...\n");
		}
		printf("%d,%d \n",RangingMeasurementData.RangeStatus, RangingMeasurementData.RangeMilliMeter);
		Sensor_SetNewRange(&VL53L0XDevs, &RangingMeasurementData);
	}


}




/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/


/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_I2C1_Init(void);

/* USER CODE BEGIN PFP */

int _write(int file, char *ptr, int len) {
  /* Implement your write code here, this is used by puts and printf for example */
  for (int i = 0; i < len; i++)
    ITM_SendChar((*ptr++));
  return len;
}

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */
RangingConfig_e RangingConfig = LONG_RANGE;
int UseSensorMask = 1 << 1;

  /* USER CODE END 1 */
  

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */




  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_USART2_UART_Init();
  MX_I2C1_Init();
  printf("Welcome :)");
  InitSensors();
  HAL_Delay(500);
  printf("Succes");

  VL53L0X_trace_config(NULL, TRACE_MODULE_NONE, TRACE_LEVEL_NONE, TRACE_FUNCTION_NONE);
  /* USER CODE BEGIN 2 */

  RangeDemo(UseSensorMask, RangingConfig);
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */


    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage 
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL6;
  RCC_OscInitStruct.PLL.PLLDIV = RCC_PLL_DIV3;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB busses clocks 
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief I2C1 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C1_Init(void)
{

  /* USER CODE BEGIN I2C1_Init 0 */

  /* USER CODE END I2C1_Init 0 */

  /* USER CODE BEGIN I2C1_Init 1 */

  /* USER CODE END I2C1_Init 1 */
  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c1) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C1_Init 2 */

  /* USER CODE END I2C1_Init 2 */

}

/**
  * @brief USART2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_USART2_UART_Init(void)
{

  /* USER CODE BEGIN USART2_Init 0 */

  /* USER CODE END USART2_Init 0 */

  /* USER CODE BEGIN USART2_Init 1 */

  /* USER CODE END USART2_Init 1 */
  huart2.Instance = USART2;
  huart2.Init.BaudRate = 115200;
  huart2.Init.WordLength = UART_WORDLENGTH_8B;
  huart2.Init.StopBits = UART_STOPBITS_1;
  huart2.Init.Parity = UART_PARITY_NONE;
  huart2.Init.Mode = UART_MODE_TX_RX;
  huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  huart2.Init.OverSampling = UART_OVERSAMPLING_16;
  if (HAL_UART_Init(&huart2) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN USART2_Init 2 */

  /* USER CODE END USART2_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LD2_GPIO_Port, LD2_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin : B1_Pin */
  GPIO_InitStruct.Pin = B1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(B1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : LD2_Pin */
  GPIO_InitStruct.Pin = LD2_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LD2_GPIO_Port, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

void ITM_SendString(char *ptr)
{
	while (*ptr)
	{
		ITM_SendChar(*ptr);
		ptr++;
	}
}

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */

  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{ 
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     tex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
