
// Approach 1: Brute Force
class Solution {
  List<int> twoSum(List<int> nums, int target) {
    for (int i = 0; i < nums.length; i++) {
        int a = nums[i];
        for (int j = i + 1; j < nums.length; j++) {
            int b = nums[j];
            if (a + b == target) {
                return [i, j];
            }
        }
    }
    return [];
  }
}

// Approach 2: Two-pass Hash Table
class Solution2 {
  List<int> twoSum(List<int> nums, int target) {
    final Map<int, int> map = Map();

    for (int i = 0; i < nums.length; i++) {
        map[nums[i]] = i;
    }
    for (int i = 0; i < nums.length; i++) {
        final int complement = target - nums[i];
        if (map.containsKey(complement) && map[complement] != i) {
            return [i, map[complement]!];
        }
    }

    return [];
  }
}

// Approach 3: One-pass Hash Table
class Solution3 {
  List<int> twoSum(List<int> nums, int target) {
    final Map<int, int> map = Map();

    for (int i = 0; i < nums.length; i++) {
        final int complement = target - nums[i];
        if (map.containsKey(complement)) {
            return [map[complement]!, i];
        }
        map[nums[i]] = i;
    }

    return [];
  }
}