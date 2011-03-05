unsigned char __at (0x4000) g_video;

void ezOneParam(unsigned char x);
void ezTwoParam(unsigned char x, unsigned char y);


// Look at .asm for how return value is handled of a call
// int flap()

void main(void)
{

   ezTwoParam(21,23);
   ezOneParam(42);

}

void ezOneParam(unsigned char x)
{
   g_video = x;
}

void ezTwoParam(unsigned char x, unsigned char y)
{
   g_video = x;
   g_video = y;
}
