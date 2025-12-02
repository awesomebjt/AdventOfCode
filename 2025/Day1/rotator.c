#include <stdio.h>
#include <stdlib.h>

int zeroes = 0;
long int pos = 50;
long int newpos = 50;

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
  while ((nread = getline(&line, &size, stream)) != -1) {
    char dir = line[0];
    long int num;
    num = strtol(&line[1], NULL, 10);
//    while(num >= 100) {
//      num = num % 100; // here we eliminate the excess 100-position rotations that just put us back where we started
//      zeroes += 1; // every 100 positions crosses zero once
//    }
    switch (dir) {
      case 'R':
        // turn right (count up)
        while(num > 0) {
          pos += 1;
          num -= 1;
          if (pos == 100) {pos = 0;}
          if (pos == 0) {zeroes += 1;}
        }
        break;
      case 'L':
        // turn left (count down)
        while (num > 0) {
          pos -= 1;
          num -= 1;
          if (pos == -1) {pos = 99;}
          if (pos == 0) {zeroes += 1;}
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
