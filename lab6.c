
#include<stdio.h>
#include "frame.h"
#include "shims.h"

Frame dataset[] = 
{
	{ 8002003001, 0, 0,
	
{ 500 , 235, -93, -34, 70, -23, -38, 47, 0, -47, 38, 23, -70, 34, 93, -235, -500, -235, 93, 34, -70, 23, 38, -47, 0, 47, -38, -23, 70, -34, -93, 235, 500, 235, -93, -34, 70, -23, -38, 47, 0, -47, 38, 23, -70, 34, 93, -235, -500, -235, 93, 34, -70, 23, 38, -47, 0, 47, -38, -23, 70, -34, -93, 235 }

	},

	{ 20123123123, 0, 0,

{ 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1, 1, -1 } 

	},

	{ 7000123456, 0, 0,

{ 0 , 86, 74, 73, 82, 73, 74, 86, 0, -86, -74, -73, -82, -73, -74, -86, 0, 86, 74, 73, 82, 73, 74, 86, 0, -86, -74, -73, -82, -73, -74, -86, 0, 86, 74, 73, 82, 73, 74, 86, 0, -86, -74, -73, -82, -73, -74, -86, 0, 86, 74, 73, 82, 73, 74, 86, 0, -86, -74, -73, -82, -73, -74, -86 }

	}

};

int main()
{

	Frame *f;

	f = s_shim(dataset, 3);

	printf("\nLab 6: frame %ld is best\n", f->frame_id);

	return 0;
}


