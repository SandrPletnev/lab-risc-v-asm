#include <stdio.h>

#define N 5
#define M 6

void process(int n, int m, int* arr, int* posNumCnt, int* negNumCnt)
{
    for (int row = 0; row < n; row++)
    {
        for (int column = 0; column < m; column++)
        {
            if (arr[row * m + column] > 0)
            {
                (*posNumCnt)++;
            }
            else if (arr[row * m + column] < 0)
            {
                (*negNumCnt)++;
            }
        }
    }
}

int main(int argc, char** argv)
{
    int matrix[M][N] = { {2, 1, 4, 3, -9},
                     {-4, 3, 5, 7, 8},
                     {-6, -7, -8, -9, -1},
                     {1, 2, 3, 4, 5},
                     {1, 3, 3, 7, -8},
                     {-7, -1, -2, -5, 6} };

    int posNumCnt = 0;
    int negNumCnt = 0;

    process(N, M, &matrix[0][0], &posNumCnt, &negNumCnt);

    printf("%d\n", posNumCnt);
    printf("%d\n", negNumCnt);

    return 0;
}