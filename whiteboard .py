# "Sum Of Array Singles
# --------------------
# Given an array of numbers in which two numbers occur once and the rest occur only twice. Your task will be to return the sum of the numbers that occur only once.
# Example 1:
# Input: repeats([4, 5, 7, 5, 4, 8])
# Output: 15
# Explanation: only the numbers 7 and 8 occur once, and their sum is 15. Every other number occurs twice.

# Example 2:
# Input: repeats([13, 8, 7, 4, 4, 8])
# Output: 20
# Explanation: only the numbers 13 and 7 occur once, and their sum is 20. Every other number occurs twice."

def solution(given_list):
    singularNum = 0
    for num in given_list:
        if given_list.count(num) == 1:
            singularNum += num
    return singularNum

print(solution([1, 1, 2, 2, 3, 3, 4 ]))
