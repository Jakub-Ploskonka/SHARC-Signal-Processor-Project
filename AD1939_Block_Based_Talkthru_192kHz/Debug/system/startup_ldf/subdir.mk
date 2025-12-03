################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../system/startup_ldf/app_heaptab.c 

S_SRCS += \
../system/startup_ldf/app_IVT.s \
../system/startup_ldf/app_startup.s 

LDF_SRCS += \
../system/startup_ldf/app.ldf 

SRC_OBJS += \
./system/startup_ldf/app_IVT.doj \
./system/startup_ldf/app_heaptab.doj \
./system/startup_ldf/app_startup.doj 

C_DEPS += \
./system/startup_ldf/app_heaptab.d 

S_DEPS += \
./system/startup_ldf/app_IVT.d \
./system/startup_ldf/app_startup.d 


# Each subdirectory must supply rules for building sources it contributes
system/startup_ldf/app_IVT.doj: ../system/startup_ldf/app_IVT.s
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k.exe -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -si-revision 0.2 -g -D_DEBUG -DCORE0 -i"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -swc -gnu-style-dependencies -MM -Mo "system/startup_ldf/app_IVT.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

system/startup_ldf/app_heaptab.doj: ../system/startup_ldf/app_heaptab.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k.exe -c -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -D_DEBUG -DCORE0 -I"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "system/startup_ldf/app_heaptab.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

system/startup_ldf/app_startup.doj: ../system/startup_ldf/app_startup.s
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC Assembler'
	easm21k.exe -file-attr ProjectName="AD1939_Block_Based_Talkthru_192kHz" -proc ADSP-21479 -si-revision 0.2 -g -D_DEBUG -DCORE0 -i"D:\dydaktyka_zima_2025_2026\AoDSP2025\Plonka_Jagosz\AD1939_Block_Based_Talkthru_192kHz\system" -swc -gnu-style-dependencies -MM -Mo "system/startup_ldf/app_startup.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


