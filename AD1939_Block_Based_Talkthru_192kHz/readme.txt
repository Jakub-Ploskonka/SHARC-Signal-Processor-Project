 Analog Devices, Inc. CrossCore(R) Embedded Studio Application Example


Project Name: 	AD1939_Block_Based_Talkthru_192KHz

Description :	

				This project contains a talkthrough example using the onboard AD1939 to acquire
				and output an audio stream. The digital audio data is available for processing
				in the file SPORT1_isr.c. The block size is 256 samples per audio channel.
				
				The AD1939 can be set up for 192 Khz Sampling rate.  The ADC is connected 
				to SPORT 1A. DAC1 is connected to SPORT 0A, DAC2 to SPORT 0A, DAC3 to SPORT 0B,
				DAC4 to SPORT 0B.
				
				All channels of the codec are accessed in TDM mode. See initSRU.c for the 
				details of which DAI pins are used to access the codec. 
				
				NOTE: The AD1939 is operating in Dual-Line TDM mode where DAC1/2 are on DSDATA1
		      	and DAC3/4 are on DSDATA3 pins.

	
Processor: 		ADSP-21479

Tested with:

				ADSP-21479 EZ-BOARD 
		 		Analog Devices CrossCore Embedded Studio
		    	ADZS-HPUSB-ICE

Instructions:	Apply an input signal to J4/J5 bottom rows on the ADSP-21479 
              	EZ-KIT LITE, and attach an output device to the selected middle or 
              	top row channels on J4/J5. Input to ADC IN1 gives output on 
             	DAC OUT1 and DAC OUT2 and input to ADC IN2 gives output on DAC OUT3 and DAC 
              	OUT4.
              
Input/Output combinations:
              	J4 bottom row RCA connectors - ADC IN 1 Left/Right Channels
	          	- J4 middle row RCA connectors - DAC OUT 1 Left/Right Channel
                - J5 middle row RCA connectors - DAC OUT 2 Left/Right Channels
              
              	J5 bottom row RCA connectors - ADC IN 2 Left/Right Channels
                - J4 top row RCA connectors - DAC OUT 3 Left/Right Channels
                - J5 top row RCA connectors - DAC OUT 4 Left/Right Channels
                - Headphone jack (H)

This is the diagram for the Input/output combinations for the ADSP-21479 EZ-Board
                  
|  J8 |      J4       |     J5        |
---------------------------------------
|     | *O3l* | *O3r* | *O4l* | *O4r* |
|     | +O1l+ | +O1r+ | +O2l+ | +O2r+ |
| *H* | +I1l+ | +I1r+ | *I2l* | *I2r* |
---------------------------------------
                  
Switch settings for rev 0.2 EZ-Board:
SW1 		ON, ON, ON, ON, ON, ON, ON, ON
SW2 		ON, ON, ON, ON, OFF, OFF, ON, ON
SW3 		ALL ON
SW15-18 	ON, OFF, ON, OFF, ON, OFF
SW23 		ALL ON
SW24 		ALL OFF
SW25 		ALL OFF

NOTE:  			If the application is halted within the CCES, the executable should 
	       		be reloaded to the target to ensure proper operation.

Reference:		ADSP-214xx Hardware Reference Manual
				ADSP-21479 EZ-Kit lite Manual





