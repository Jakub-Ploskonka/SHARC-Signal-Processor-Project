#ifndef FIR_STEREO_H
#define FIR_STEREO_H

#include <fract.h>

#define TAPS 48

/* Te tablice są zdefiniowane w blockProcess_audio.c */
extern fract32 stateL[TAPS + 1];
extern fract32 stateR[TAPS + 1];

#endif /* FIR_STEREO_H */
