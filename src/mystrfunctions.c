#include "../include/mystrfunctions.h"

int mystrlen(const char* s) {
    int len = 0;
    while (s && s[len] != '\0') len++;
    return len;
}

int mystrcpy(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int i = 0;
    while ((dest[i] = src[i]) != '\0') i++;
    return 0;
}

int mystrncpy(char* dest, const char* src, int n) {
    if (!dest || !src || n <= 0) return -1;
    int i = 0;
    for (; i < n && src[i] != '\0'; i++) dest[i] = src[i];
    for (; i < n; i++) dest[i] = '\0';
    return 0;
}

int mystrcat(char* dest, const char* src) {
    if (!dest || !src) return -1;
    int i = 0, j = 0;
    while (dest[i] != '\0') i++;
    while ((dest[i++] = src[j++]) != '\0');
    return 0;
}
