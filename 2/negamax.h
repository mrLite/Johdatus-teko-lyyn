#ifndef __NEGAMAX_H__
#define __NEGAMAX_H__

typedef struct move {
	int slot;
	int max;
} move;

int GRID_SIDE;
int GRID_SIZE;

struct move negamax(int game_grid[], int player);
int grid_full(int grid[]);
void print_grid(int grid[]);
int check_availability(int grid[], int number);
int check_situation(int grid[]);

#endif