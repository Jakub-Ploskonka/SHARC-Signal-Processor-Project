################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Main.c \
../src/SPORT1_isr.c \
../src/blockProcess_audio.c \
../src/init1939viaSPI.c \
../src/initSPORT01_TDM_mode.c \
../src/initSRU.c \
../src/init_PLL_SDRAM.c 

ASM_SRCS += \
../src/SPORT1_ISR_process_samples_.asm 

SRC_OBJS += \
./src/Main.doj \
./src/SPORT1_ISR_process_samples_.doj \
./src/SPORT1_isr.doj \
./src/blockProcess_audio.doj \
./src/init1939viaSPI.doj \
./src/initSPORT01_TDM_mode.doj \
./src/initSRU.doj \
./src/init_PLL_SDRAM.doj 

C_DEPS += \
./src/Main.d \
./src/SPORT1_isr.d \
./src/blockProcess_audio.d \
./src/init1939viaSPI.d \
./src/initSPORT01_TDM_mode.d \
./src/initSRU.d \
./src/init_PLL_SDRAM.d 

ASM_DEPS += \
./src/SPORT1_ISR_process_samples_.d 


# Each subdirectory must supply rules for building sources it contributes
src/Main.doj: ../src/Main.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/Main.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/SPORT1_ISR_process_samples_.doj: ../src/SPORT1_ISR_process_samples_.asm
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k.exe -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -si-revision 0.2 -g -D_DEBUG -DCORE0 -i"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -swc -gnu-style-dependencies -MM -Mo "src/SPORT1_ISR_process_samples_.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/SPORT1_isr.doj: ../src/SPORT1_isr.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/SPORT1_isr.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/blockProcess_audio.doj: ../src/blockProcess_audio.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/blockProcess_audio.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/init1939viaSPI.doj: ../src/init1939viaSPI.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/init1939viaSPI.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initSPORT01_TDM_mode.doj: ../src/initSPORT01_TDM_mode.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/initSPORT01_TDM_mode.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/initSRU.doj: ../src/initSRU.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/initSRU.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/init_PLL_SDRAM.doj: ../src/init_PLL_SDRAM.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/init_PLL_SDRAM.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


