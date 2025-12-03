/*********************************************************************************

 Copyright(c) 2012 Analog Devices, Inc. All Rights Reserved.

 This software is proprietary and confidential.  By using this software you agree
 to the terms of the associated Analog Devices License Agreement.

 *********************************************************************************/
/*
 * NAME:     blockProcess_audio.c (Block-based Talk-through)
 * PURPOSE:  Process incoming AD1939 ADC data and prepare outgoing blocks for DAC.
 * USAGE:    This file contains the subroutines that float and fix the serial data,
 *        	 and copy from the inputs to the outputs.
 */

#include "ADDS_21479_EzKit.h"

#define TAPS	48

float pm fcoeffs[TAPS]={0.000141646276786178, -0.00187140162770069, -0.00425057281214822, -0.00763445649593694, -0.0110296192501550, -0.0131050036314346, -0.0124732839688122, -0.00828793069527087, -0.000832001145524224, 0.00818769194192105, 0.0158694039035219, 0.0189298386992175, 0.0149271382791375, 0.00350275612554427, -0.0128590975237219, -0.0289614197242297, -0.0380533851319467, -0.0337908465253701, -0.0124268935356915, 0.0255003421731184, 0.0746470070783327, 0.125800363777157, 0.168125560140939, 0.192075757682352, 0.192075757682352, 0.168125560140939, 0.125800363777157, 0.0746470070783327, 0.0255003421731184, -0.0124268935356915, -0.0337908465253701, -0.0380533851319467, -0.0289614197242297, -0.0128590975237219, 0.00350275612554427, 0.0149271382791375, 0.0189298386992175, 0.0158694039035219, 0.00818769194192105, -0.000832001145524224, -0.00828793069527087, -0.0124732839688122, -0.0131050036314346, -0.0110296192501550, -0.00763445649593694, -0.00425057281214822, -0.00187140162770069, 0.000141646276786178};
float dm state[TAPS + 1]; //+2byczq

//extern int filterFIR(fract *state, fract *coeff, int sample);
extern float filterFIR(float *state, float *coeff, float sample);

/* Define a structure to represent buffers for all 12 floating-point
 * data channels of the AD1939 */
typedef struct{
	float Rx_L1[NUM_SAMPLES];
	float Rx_R1[NUM_SAMPLES];
	float Rx_L2[NUM_SAMPLES];
	float Rx_R2[NUM_SAMPLES];

	float Tx_L1[NUM_SAMPLES];
	float Tx_R1[NUM_SAMPLES];
	float Tx_L2[NUM_SAMPLES];
	float Tx_R2[NUM_SAMPLES];
	float Tx_L3[NUM_SAMPLES];
	float Tx_R3[NUM_SAMPLES];
	float Tx_L4[NUM_SAMPLES];
	float Tx_R4[NUM_SAMPLES];
	
} ad1939_float_data;

/* SPORT Ping/Pong Data buffers */
extern int RxBlock_A0[];
extern int RxBlock_A1[];

extern int TxBlock_A0[];
extern int TxBlock_A1[];

extern int TxBlock_B0[];
extern int TxBlock_B1[];


/* Pointer to the blocks */
int *rxA_block_pointer[2] = {RxBlock_A0, RxBlock_A1};
int *txA_block_pointer[2] = {TxBlock_A0, TxBlock_A1};
int *txB_block_pointer[2] = {TxBlock_B0, TxBlock_B1};


/*  Structures to hold floating point data for each AD1939 */
ad1939_float_data fBlockA;

static void process_audioBlocks(void);

/* Unoptimized function to convert the incoming fixed-point data to 32-bit
* floating-point format. This function assumes that the incoming fixed point
* data is in 1.31 format
*/
static void floatData(float *output, int *input, unsigned int instep, unsigned int length)
{
    int i;

    for(i = 0; i < length; i++)
    {
        output[i] = __builtin_conv_RtoF(input[instep*i]);
    }
}


/* Unoptimized function to convert the outgoing floating-point data
 * to 1.31 fixed-point format.*/
static void fixData(int *output, float *input, unsigned int outstep, unsigned int length)
{
    int i;

    for(i = 0; i < length; i++)
    {
        output[outstep*i] = __builtin_conv_FtoR(input[i]);
    }
}


/* Unoptimized function to copy from one floating-point buffer to another */
static void memcopy(float *input, float *output, unsigned int number)
{
    int i;
    
    for(i = 0; i < number; i++)
    {
        output[i] = input[i];
    }
}



/*
 * Audio Block Processing Algorithm for 192 kHz 4 IN x 4 OUT Audio System
 * The inputs and outputs are held in a structure for the AD1939
 * fBlockA holds stereo input (AIN) channels 0-3 and stereo output (AOUT) channels 0-7
 *
 * This function copies the data without any processing as follows
 * AOUT1L <- AIN1L
 * AOUT1R <- AIN1R
 * AOUT2L <- AIN1L
 * AOUT2R <- AIN1R
 *
 * AOUT3L <- AIN2L
 * AOUT3R <- AIN2R
 * AOUT4L <- AIN2L
 * AOUT4R <- AIN2R
 */

static void process_audioBlocks(void)
{

	for(int i = 0; i < NUM_SAMPLES; i++) {
		fBlockA.Tx_L1[i] = filterFIR(state, fcoeffs, fBlockA.Rx_L2[i]);
	}

	//memcopy(fBlockA.Rx_L2, fBlockA.Tx_L1, NUM_SAMPLES);
	memcopy(fBlockA.Rx_R2, fBlockA.Tx_R1, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_R1, fBlockA.Tx_R1, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_L1, fBlockA.Tx_L2, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_R1, fBlockA.Tx_R2, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_L2, fBlockA.Tx_L3, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_R2, fBlockA.Tx_R3, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_L2, fBlockA.Tx_L4, NUM_SAMPLES);
	//memcopy(fBlockA.Rx_R2, fBlockA.Tx_R4, NUM_SAMPLES);
}




/*
 * This function handles the Codec data in the following 3 steps...
 *    1. Converts all ADC data to 32-bit floating-point, and copies this
 *       from the current RX DMA buffer into fBlockA & fBlockB
 *    2. Calls the audio processing function (processBlocks)
 *    3. Converts all DAC to 1.31 fixed point, and copies this from
 *       fBlockA & fBlockB into the current TX DMA buffer
 */

void handleCodecData(unsigned int blockIndex)
{
/* Clear the Block Ready Semaphore */
    inputReady = 0;

/* Set the Processing Active Semaphore before starting processing */
    isProcessing = 1;

/* Float ADC data from AD1939 */
	floatData(fBlockA.Rx_L1, rxA_block_pointer[blockIndex]+0, NUM_RX_SLOTS, NUM_SAMPLES);
	floatData(fBlockA.Rx_R1, rxA_block_pointer[blockIndex]+1, NUM_RX_SLOTS, NUM_SAMPLES);
	floatData(fBlockA.Rx_L2, rxA_block_pointer[blockIndex]+2, NUM_RX_SLOTS, NUM_SAMPLES);
	floatData(fBlockA.Rx_R2, rxA_block_pointer[blockIndex]+3, NUM_RX_SLOTS, NUM_SAMPLES);
/* Place the audio processing algorithm here. */
	process_audioBlocks();

/* Fix DAC data for AD1939 */
	fixData(txA_block_pointer[blockIndex]+0, fBlockA.Tx_L1, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txA_block_pointer[blockIndex]+1, fBlockA.Tx_R1, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txA_block_pointer[blockIndex]+2, fBlockA.Tx_L2, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txA_block_pointer[blockIndex]+3, fBlockA.Tx_R2, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txB_block_pointer[blockIndex]+0, fBlockA.Tx_L3, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txB_block_pointer[blockIndex]+1, fBlockA.Tx_R3, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txB_block_pointer[blockIndex]+2, fBlockA.Tx_L4, NUM_TX_SLOTS, NUM_SAMPLES);
	fixData(txB_block_pointer[blockIndex]+3, fBlockA.Tx_R4, NUM_TX_SLOTS, NUM_SAMPLES);
	   
/* Clear the Processing Active Semaphore after processing is complete*/
    isProcessing = 0;
}
