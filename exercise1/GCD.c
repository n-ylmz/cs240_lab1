#include <stdio.h>

int GCD(int a, int b) {
    if (b == 0) {
        return a;
    }
    return GCD(b, a % b);
}

int main() {
    static int a = 48;
    static int b = 18;

    int res = GCD(a, b);
    printf("%d\n", res);

    return 0;
}
