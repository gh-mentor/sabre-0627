/*
This file contains the combinatorics functions.
*/

/*
Create a function 'factorial' to return the factorial of a number. Do not use recursion
Arguments:
- n: unsigned integer
Return:
- unsigned integer
Requirements:
- n >= 0
- factorial(1) = 1
- factorial(n) = n * (n-1) * (n-2) * ... * 1
*/
function factorial(n: number): number {
    let result = 1;
    for (let i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

/*
Create a function 'permutation' to return the number of permutations of n items taken k at a time.
Arguments:
- n: unsigned integer
- k: unsigned integer
Return:
- unsigned integer
Requirements:
- n >= k
- permutation(n, 0) = 1
- permutation(n, 1) = n
- permutation(n, n) = n!
*/
function permutation(n: number, k: number): number {
    let result = 1;
    for (let i = n; i > n - k; i--) {
        result *= i;
    }
    return result;
}

// export the functions
export { factorial, permutation };
