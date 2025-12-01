#include <stdio.h>
#include <stdlib.h>

int zeroes = 0;
long int pos = 50;

int main(int argc, char *argv[]) {
  FILE *stream;
  char *line = NULL;
  size_t size = 0;
  ssize_t nread;

  if (argc != 2) {
    fprintf(stderr, "Usage: %s <file>\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  stream = fopen(argv[1], "r");
  if (stream == NULL) {
    perror("fopen");
    exit(EXIT_FAILURE);
  }
  printf("Starting at %d...\n",pos);
  while ((nread = getline(&line, &size, stream)) != -1) {
    char dir = line[0];
    long int num;
    num = strtol(&line[1], NULL, 10);
    while(num > 100) {
      num = num % 100; // here we eliminate the excess 100-position rotations that just put us back where we started
    }
    switch (dir) {
      case 'R':
        // turn right (count up)
        pos += num;
        pos %= 100; //cancel out 100 if we went over it
        printf("Moved %ld to the %c to point at %ld\n",num,dir,pos);
        // increment zero if we are at zeroes
        if (pos == 0) {
          zeroes += 1;
        }
        break;
      case 'L':
        // turn left (count down)
        pos -= num;
        if (pos < 0) {
          pos = 100 - labs(pos);
        }
         printf("Moved %ld to the %c to point at %ld\n",num,dir,pos);
        // increment zeroes if we are at zero
        if (pos == 0) {
          zeroes += 1;
        }
        break;
      default:
        break;
    }
  }

  printf("Zeroes: %d\n", zeroes);

  free(line);
  fclose(stream);
  exit(EXIT_SUCCESS);
}
