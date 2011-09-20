#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include "negamax.h"

///
/// Returns struct move {slot, value}, where slot is the index of the move on the game grid which yields the best value.
///
struct move negamax(int game_grid[], int player) {
	// To start with, we have to check if the game is still on.
	int situation = check_situation(game_grid);
	int max = -1;
	move best_move = {-1, -1};

	// check_situation() returns 0 if the game hasn't ended yet.
	if (situation == 0) {
		// For each legal move on the board, find the one which maximizes the minimum gain.
		int i;
		for(i = 0; i < GRID_SIZE; i++) {
			if (game_grid[i] == 0) {
				int* temp_grid = malloc(sizeof(int)*GRID_SIZE);
				if (temp_grid != NULL) {
					int n;
					for (n = 0; n < GRID_SIZE; n++) {
						temp_grid[n] = game_grid[n];
					}
					int current_slot = i;
					temp_grid[i] = player;
					
					print_grid(temp_grid);
					printf("\n");
					
					move x = negamax(temp_grid, ((player%2)+1));
					if (-(x.max) > max) {
						best_move.max = -(x.max);
						best_move.slot = current_slot;
						max = -(x.max);
					}
					free(temp_grid);
				}
				else {
					printf("I CAN HAS NO MEMORY!!1\n");
					exit(EXIT_FAILURE);
				}
			}
		}
	}
	// Now, if the game has indeed ended, check_situation() returns:
	// 1 if X has won
	// -1 if O has won
	// 10 if the end result was a tie.
	else if (situation == 1) {
		if (player == 1) {
			best_move.max = 1;
		}
		else
			best_move.max = -1;
	}
	else if (situation == -1) {
		if (player == 2) {
			best_move.max = 1;
		}
		else
			best_move.max = -1;
	}
	else if (situation == 10) {
		best_move.max = 0;
	}
	else {
		printf("An unknown error has occured.\n");
		exit(EXIT_FAILURE);
	}
		
	return best_move;
}

///
/// Prints the game grid.
///
void print_grid(int grid[]) {
	int i;
	for (i = 0; i < GRID_SIZE; i++) {
		if (grid[i] == 0)
			printf(" ");
		else if (grid[i] == 1)
			printf("X");
		else
			printf("O");
			
		if ((i+1)%GRID_SIDE == 0)
			printf("\n");
		else
			printf("|");
		}
}

///
/// Returns 1 if the grid is full and 0 if there's at least one free slot.
///
int grid_full(int grid[]) {
	int full = 1;
	int i;
	for (i = 0; i < GRID_SIZE; i++) {
		if (grid[i] == 0)
			full = 0;
	}
	return full;
}

///
/// Check to see if the slot in the game grid chosen by the user is available.
/// Returns 1 if available, 0 if not.
///
int check_availability(int grid[], int number) {
	int available;
	if (grid[number] != 0)
		available = 0;
	else if (grid[number] == 0)
		available = 1;
	return available;
}

///
/// Checks the current game situation, returns 1 if X has won, -1 if O has won and 10 if it's a tie.
/// Also returns 0 if the game hasn't ended yet.
///
int check_situation(int grid[]) {
	int situation;
	
	if (grid[0] == 1 && grid[1] == 1 && grid[2] == 1)
		situation = 1;
	else if (grid[3] == 1 && grid[4] == 1 && grid[5] == 1)
		situation = 1;
	else if (grid[6] == 1 && grid[7] == 1 && grid[8] == 1)
		situation = 1;
	else if (grid[0] == 1 && grid[3] == 1 && grid[6] == 1)
		situation = 1;
	else if (grid[1] == 1 && grid[4] == 1 && grid[7] == 1)
		situation = 1;
	else if (grid[2] == 1 && grid[5] == 1 && grid[8] == 1)
		situation = 1;
	else if (grid[0] == 1 && grid[4] == 1 && grid[8] == 1)
		situation = 1;
	else if (grid[2] == 1 && grid[4] == 1 && grid[6] == 1)
		situation = 1;

	else if (grid[0] == 2 && grid[1] == 2 && grid[2] == 2)
		situation = -1;
	else if (grid[3] == 2 && grid[4] == 2 && grid[5] == 2)
		situation = -1;
	else if (grid[6] == 2 && grid[7] == 2 && grid[8] == 2)
		situation = -1;
	else if (grid[0] == 2 && grid[3] == 2 && grid[6] == 2)
		situation = -1;
	else if (grid[1] == 2 && grid[4] == 2 && grid[7] == 2)
		situation = -1;
	else if (grid[2] == 2 && grid[5] == 2 && grid[8] == 2)
		situation = -1;
	else if (grid[0] == 2 && grid[4] == 2 && grid[8] == 2)
		situation = -1;
	else if (grid[2] == 2 && grid[4] == 2 && grid[6] == 2)
		situation = -1;
	
	else if (grid_full(grid))
		situation = 10;
	
	else
		situation = 0;
	
	return situation;
}