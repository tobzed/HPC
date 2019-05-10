#include "pi.h"
#define MASTER 0

void init_pi(int set_seed, char *outfile)
{
	if (filename != NULL) {
		free(filename);
		filename = NULL;
	}

	if (outfile != NULL) {
		filename = (char*)calloc(sizeof(char), strlen(outfile)+1);
		memcpy(filename, outfile, strlen(outfile));
		filename[strlen(outfile)] = 0;
	}
	seed = set_seed;
}

void cleanup_pi()
{
	if (filename != NULL)
		free(filename);
}

void compute_pi(int flip, int *local_count, double *answer)
{
	int world_rank, num_ranks;

	MPI_Comm_rank(MPI_COMM_WORLD,&world_rank);
	MPI_Comm_size(MPI_COMM_WORLD,&num_ranks);
	int recv_buffer[num_ranks];

	srand(seed * world_rank);

	int local_flip = (double)flip / (double)num_ranks;
	int i;
	double x,y,z;

	for(i = 0; i < local_flip; ++i) {
		x = (double) rand() / (double) RAND_MAX;
		y = (double) rand() / (double) RAND_MAX;
		z = x*x + y*y;
		if(z <= 1.0) {
			(*local_count)++;
		}
	}
	MPI_Gather( local_count, 1, MPI_INT, recv_buffer, 1, MPI_INT, MASTER, MPI_COMM_WORLD );
	if(world_rank == MASTER) {
		int res = 0;
		for(i = 0; i < num_ranks; ++i) {
			res += recv_buffer[i];
		}
		*answer = (double)res / (double)flip * 4.0;
	}
}
