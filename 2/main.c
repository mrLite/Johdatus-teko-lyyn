#include <stdio.h>
#include <stdlib.h>
#include "negamax.h"

int main(void) {
	GRID_SIDE = 3;
	GRID_SIZE = 9;
	int grid[9] = {2,2,1,0,1,0,2,1,0};
	
	negamax(grid, 1);
}