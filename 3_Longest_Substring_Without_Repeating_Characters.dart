// Given a string s, find the length of the longest substring without repeating characters.

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;

    for (int i = 0; i < s.length; i++) {
        List<String> checkedChars = [];
        int length = 0;
        
        for (int j = i; j < s.length; j++) {
            if (!(checkedChars.contains(s[j]))) {
                checkedChars.add(s[j]);
                length++;
            } else {
                break;
            }
        }
        if (length > maxLength) {
            maxLength = length;
        }
    }
    return maxLength;
  }
}


// Better solution
class Solution2 {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    List<String> checkedChars = [];

    for (int i = 0; i < s.length; i++) {
        String char = s[i];
        if (checkedChars.contains(char)) {
            checkedChars = checkedChars.sublist(checkedChars.indexOf(char) + 1);
        }
        checkedChars.add(char);
        
        if (checkedChars.length > maxLength) {
            maxLength = checkedChars.length;
        }
    }
    return maxLength;
  }
}