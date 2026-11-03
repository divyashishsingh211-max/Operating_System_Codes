/* Experiment 5 - Part B
 * Find the length of a string and extract a substring.
 */

#include <stdio.h>

int main()
{
    char str[100];
    int start, length, i, count = 0;

    printf("Enter a string: ");
    fgets(str, 100, stdin);

    while (str[count] != '\0' && str[count] != '\n')
    {
        count++;
    }

    printf("Length of string: %d\n", count);

    printf("Enter starting position: ");
    scanf("%d", &start);

    printf("Enter number of characters: ");
    scanf("%d", &length);

    printf("Substring: ");

    for (i = start; i < start + length && i < count; i++)
    {
        printf("%c", str[i]);
    }

    printf("\n");

    return 0;
}
