#ifndef SIG_KEY_H
#define SIG_KEY_H

#include"public.h"

#define MASK_0 0x30
#define MASK_1 0x20

extern u8 buffer[8];

void DIR();
u8 AllKey();
u8 key();
u8 Get_key();

#endif

