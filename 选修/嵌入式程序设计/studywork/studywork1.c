#include<stdio.h>

unsigned int setBit(unsigned int num, int i, int value) {
    if (value) {
        return num | (1 << i);
    } else {
        return num & ~(1 << i);
    }
}

int checkBit(unsigned int num, int i) {
    return (num >> i) & 1;
}

void printBinary(unsigned int num) {
    for (int i = 31; i >= 0; i--) {
        printf("%d", (num >> i) & 1);
    }
    printf("\n");
}

unsigned int intToBCD(unsigned int num) {
    unsigned int bcd = 0;
    int i = 0;
    while (num > 0) {
        bcd |= (num % 10) << (i * 4);
        num /= 10;
        i++;
    }
    return bcd;
}

int isLittleEndian() {
    int num = 1;
    char *ptr = (char *)&num;
    return *ptr;
}

#define COMBINE_UINTS(a, b, c, d) ((unsigned int)(a) | ((unsigned int)(b) << 8) | ((unsigned int)(c) << 16) | ((unsigned int)(d) << 24))



int main() {
    // 测试setBit
    unsigned int num1 = 5; // 二进制为0101
    unsigned int newNum1 = setBit(num1, 1, 0); // 将第1位置0，结果应为0100 (4)
    printf("setBit test: %u\n", newNum1);

    // 测试checkBit
    int bitValue = checkBit(5, 0);
    printf("checkBit test: %d\n", bitValue);

    // 测试printBinary
    printf("printBinary test: ");
    printBinary(5);

    // 测试intToBCD
    unsigned int num2 = 1234;
    unsigned int bcdNum = intToBCD(num2);
    printf("intToBCD test: %u\n", bcdNum);

    // 测试isLittleEndian
    if (isLittleEndian()) {
        printf("isLittleEndian test: This is a little - endian machine.\n");
    } else {
        printf("isLittleEndian test: This is a big - endian machine.\n");
    }

    // 测试COMBINE_UINTS
    unsigned char a = 1, b = 2, c = 3, d = 4;
    unsigned int combined = COMBINE_UINTS(a, b, c, d);
    printf("COMBINE_UINTS test: %u\n", combined);

    return 0;
}