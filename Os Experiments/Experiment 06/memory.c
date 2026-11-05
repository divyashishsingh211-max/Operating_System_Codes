#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
    int mb;

    if (argc != 2)
    {
        printf("Usage: %s <memory_in_MB>\n", argv[0]);
        return 1;
    }

    mb = atoi(argv[1]);

    size_t size = (size_t)mb * 1024 * 1024;
    char *memory = malloc(size);

    if (memory == NULL)
    {
        printf("Memory allocation failed\n");
        return 1;
    }

    /* Touch one byte per 4 KB page so the pages become resident. */
    for (size_t i = 0; i < size; i += 4096)
    {
        memory[i] = 1;
    }

    printf("%d MB memory allocated.\n", mb);
    printf("Program is running... Press Ctrl+C to exit.\n");
    fflush(stdout);

    while (1)
    {
        sleep(1);
    }

    return 0;
}
