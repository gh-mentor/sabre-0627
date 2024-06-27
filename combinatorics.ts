/*
This file contains the combinatorics functions.
*/


/**
 * Calculates the factorial of a given number.
 * @param n - The number to calculate the factorial for.
 * @returns The factorial of the given number.
 * @example factorial(5) => 120
 * @example factorial(0) => 1
 * @example factorial(1) => 1
 * @example factorial(10) => 3628800
 */
function factorial(n: number): number {
    let result = 1;
    for (let i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

/**
 * Calculate  the number of permutations of n items taken r at a time.
 * @param n - The total number of items.
 * @param r - The number of items to take.
 * @returns The number of permutations of n items taken r at a time.
 * @example permutation(5, 3) => 60
 * @example permutation(5, 5) => 120
 * @example permutation(5, 0) => 1
 * @example permutation(5, 1) => 5
 */
function permutation(n: number, r: number): number {
    return factorial(n) / factorial(n - r);
}

/**
 * Calculate the number of combinations of n items taken r at a time.
 * @param n - The total number of items.
 * @param r - The number of items to take.
 * @returns The number of combinations of n items taken r at a time.
 * 
 */
function combination(n: number, r: number): number {
    return permutation(n, r) / factorial(r);    
}

