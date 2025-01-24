class Solution {
  int reverse(int x) {
    int rev = 0;
    while (x != 0) {
        int pop = x % 10;
        x = (x - pop) ~/ 10;
        if (
            // rev > pow(2, 31) / 10 
            // ||
            (rev == pow(2, 31) / 10 && pop > 7)
        ) {
            return 0;
        }
        if (
            rev < pow(-2, 31) / 10
             ||
            (rev == pow(-2, 31) / 10 && pop < -8)
        ) {
            return 0;
        }
        rev = rev * 10 + pop;
    }
    return rev;
  }
}