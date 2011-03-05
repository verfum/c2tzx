unsigned char __at (0x4000) g_video;

void ezOneParam(unsigned char x);
void ezTwoParam(unsigned char x, unsigned char y);
void ezZeroParam();
char ezZeroParamRet();
void ezRetInParam(char* ret);


// Look at .asm for how return value is handled of a call
// int flap()

void main(void)
{

   char mo;
   g_video = ezZeroParamRet();



   ezRetInParam(&mo);
   g_video = mo;

}

void ezRetInParam(char* ret)
{
   *ret = 11;
}

void ezZeroParam()
{
   g_video = 7;
}

char ezZeroParamRet()
{
   return 3;
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
