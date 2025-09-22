#include <stdio.h>
#include <stdlib.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char str1[100] = "Hello";
    char str2[100] = " World";

    printf("Length of str1: %d\n", mystrlen(str1));
    mystrcat(str1, str2);
    printf("Concatenated: %s\n", str1);

    char copy[100];
    mystrcpy(copy, str1);
    printf("Copied: %s\n", copy);

    char ncopy[100];
    mystrncpy(ncopy, str1, 5);
    printf("First 5 chars: %s\n", ncopy);

    printf("\n--- Testing File Functions ---\n");
    FILE* fp = fopen("test.txt", "r");
    if (fp) {
        int lines, words, chars;
        wordCount(fp, &lines, &words, &chars);
        printf("Lines: %d, Words: %d, Chars: %d\n", lines, words, chars);

        rewind(fp);
        char** matches;
        int count = mygrep(fp, "Hello", &matches);
        printf("Found %d matches:\n", count);
        for (int i = 0; i < count; i++) {
            printf("%s", matches[i]);
            free(matches[i]);
        }
        free(matches);
        fclose(fp);
    } else {
        printf("test.txt not found!\n");
    }

    return 0;
}
