#include"8255.h"

void Init8255()
{
//	outportb(IO8255_Con,0x88);		//8255 ¿ØÖÆ×Ö
	outportb(IO8255_Con,0x92);		//8255 ¿ØÖÆ×Ö
	outportb(IO8255_PC, 0x00);		//0x00H->8255 PC->e3-ctrl
}

