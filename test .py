from whiteboard import solution
from unittest import TestCase


class TestWhiteboard(TestCase):

    def test_two_single_occurrences_first_example(self):
        self.assertEqual(solution([4, 5, 7, 5, 4, 8]), 15)

    def test_two_single_occurrences_second_example(self):
        self.assertEqual(solution([13, 8, 7, 4, 4, 8]), 20)

    def test_multiple_single_occurrences(self):
        self.assertEqual(solution(
            [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]), 55)

    def test_no_single_occurrences(self):
        self.assertEqual(solution([1, 2, 2, 3, 3]), 1)
        self.assertEqual(solution([1, 1, 2, 2, 3, 3, 4, 4]), 0)

    def test_multiple_and_single_occurrences(self):
        self.assertEqual(solution([1, 1, 2, 2, 3, 3, 4, 5, 5]), 4)
