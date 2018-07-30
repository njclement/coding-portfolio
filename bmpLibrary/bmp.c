#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void bmp_header_(char **filenamep, unsigned int *WIDTHp,unsigned int *HEIGHTp)
{
  char *filename = *filenamep;
  unsigned int WIDTH = *WIDTHp;
  unsigned int HEIGHT = *HEIGHTp;
  FILE *fp;
  fp=fopen("drawing.bmp","w");

  char *ID;
  ID=malloc(2*sizeof(char));
  ID="BM";
  fwrite(ID,sizeof(char),2,fp);
  
  printf("%u, %u, %u\n",WIDTH,HEIGHT,54+4*WIDTH*HEIGHT);
  int SIZE=54+4*WIDTH*HEIGHT;
  fwrite(&SIZE,sizeof(int),1,fp);
  
  char *ZEROS;
  ZEROS=malloc(4*sizeof(char));
  fwrite(ZEROS,sizeof(char),4,fp);
  free(ZEROS);
  
  int OFFSET=54;
  fwrite(&OFFSET,sizeof(int),1,fp);
  
  int HEADERSIZE=40;
  fwrite(&HEADERSIZE,sizeof(int),1,fp);

  fwrite(&WIDTH,sizeof(int),1,fp);

  fwrite(&HEIGHT,sizeof(int),1,fp);
  
  short PLANES=1;
  fwrite(&PLANES,sizeof(short),1,fp);

  short BITS=32;
  fwrite(&BITS,sizeof(short),1,fp);

  int COMPRESSION=0;
  fwrite(&COMPRESSION,sizeof(int),1,fp);

  int DATASIZE=4*WIDTH*HEIGHT;
  fwrite(&DATASIZE,sizeof(int),1,fp);

  int XRESOL=2835;
  fwrite(&XRESOL,sizeof(int),1,fp);

  int YRESOL=2835;
  fwrite(&YRESOL,sizeof(int),1,fp);
  
  int PALETTE=0;
  fwrite(&PALETTE,sizeof(int),1,fp);

  int PALETTE_IMP=0;
  fwrite(&PALETTE_IMP,sizeof(int),1,fp);

  fclose(fp);
//  fp=fopen("hankhill","w");
//  fwrite("DANKMEMES",sizeof(char),9,fp);
//  fclose(fp);
}
