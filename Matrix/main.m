//
//  main.m
//  Matrix
//
//  Created by Bharath G M on 1/3/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


void printDiagonal(int arr[4][4], int row, int col)
{
    int i,j,k;
    for (k = 0; k < row; k++)
    {
        for (i = 0, j = k; j>=0; i++,j--)
        {
            printf("%d \t ",arr[j][i]);
        }
        printf("\n");
        
    }
    for (k = row - 1; k >=0; k--)
    {
        for (i = col-1, j = k; j < col; i--,j++)
        {
            printf("%d \t ",arr[i][j]);
        }
        printf("\n");
    }
    printf("\n\n");
    
}


void displayMatrix(unsigned int const *p, unsigned int r, unsigned int c)
{
    unsigned int row, col;
    printf("\n\n");
    
    for(row = 0; row < r; row++)
    {
        for(col = 0; col < c; col++)
        {
            printf("%d\t", *(p + row * c + col));
        }
        printf("\n");
    }
    
    printf("\n\n");
}

void rotate(unsigned int *pS, unsigned int *pD, unsigned int row, unsigned int col)
{
    unsigned int r, c;
    for(r = 0; r < row; r++)
    {
        for(c = 0; c < col; c++)
        {
            //            printf("\n Source %d, Row %d,Col %d, Index %d \n Total = %d \n",*pS,r,col,c, *(pS + r * col + c));
            
            
//            printf("Dest = %d ColIndex = %d Row = %d, RowIndex = %d, Row -r-1 = %d, Total = %d\n",*pD,c,row,r,row -r -1,
//                   (c * row + (row - r - 1)));
            
            *(pD + c * row + (row - r - 1)) = *(pS + r * col + c);
            
            
        }
    }
}


int main()
{
    // declarations
    unsigned int image[][4] = {{1,2,3,4}, {5,6,7,8}, {9,10,11,12}};
    
    int arr[4][4] = {{1,2,3,4}, {5,6,7,8}, {9,10,11,12},{13,14,15,16}};
    
    printDiagonal(arr,4,4);
   
    unsigned int *pSource;
    unsigned int *pDestination;
    unsigned int m, n;
    
    // setting initial values and memory allocation
    m = 3, n = 4, pSource = (unsigned int *)image;
    pDestination = (unsigned int *)malloc(sizeof(int)*m*n);
    
    // process each buffer
    displayMatrix(pSource, m, n);
    
    rotate(pSource, pDestination, m, n);
    
    displayMatrix(pDestination, n, m);
    
    free(pDestination);
    
    getchar();
    return 0;
}

