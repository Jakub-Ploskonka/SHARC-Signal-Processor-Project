/*********************************************************************************

 Copyright(c) 2012 Analog Devices, Inc. All Rights Reserved.

 This software is proprietary and confidential.  By using this software you agree
 to the terms of the associated Analog Devices License Agreement.

 *********************************************************************************/
/*This project contains a talk-through example using the on-board AD1939 to acquire
 * and output an audio stream. The digital audio data is available for processing
 * in the file SPORT1_isr.c. The block size is 256 samples per audio channel.
 * The AD1939 can be set up for 192 KHz Sampling rate.
 */

#include "ADDS_21479_EzKit.h"

void	main()
{
	volatile int count=0;
	/* Initialize managed drivers and/or services at the start of main(). */
	adi_initComponents();

	initPLL();
	initExternalMemory();


	/* Initialize DAI because the SPORT and SPI signals need to be routed*/
    initDAI();

    /* This function will configure the AD1939 codec on the 21469 EZ-KIT*/
    init1939viaSPI();

    /* Turn on SPORT0 TX and SPORT1 RX for Multichannel Operation*/
    initSPORT();
	
    /* Install and enable a handler for the SPORT1 Receiver interrupt.*/
    adi_int_InstallHandler(ADI_CID_P3I,TalkThroughISR,0,true);//interrupt(SIG_SP1,TalkThroughISR);

    /* Be in infinite loop and do nothing until done.*/
    while(1)
    	{
    		if(count==10)
    		{
    			puts("Talkthrough is running successfully");
    		}
    		if(inputReady)
    		{
    			count++;
    			handleCodecData(buffer_cntr);
    		}
    	}
}

