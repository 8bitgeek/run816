#include <stdint.h>

#define SZ (1024*8)

uint8_t buf1[SZ];
uint8_t buf2[SZ];

void fl(uint8_t* a, uint8_t c, int sz)
{
	while(sz--)
		*a++ = c;
}

void cp(uint8_t* a, uint8_t* b, int sz)
{
	while (sz--)
		*a++ = *b++;
}

int main()
{
	unsigned int n;
	for(n=0; n < 0x00FF; n++)
	{
		fl(buf1,0xaa,SZ);
		cp(buf2,buf1,SZ);
		cp(buf1,buf2,SZ);
	}
	return 0;
}

