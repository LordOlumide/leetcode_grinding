class TestCase {
  final List<int> a;
  final List<int> b;
  const TestCase(this.a, this.b);
}

void main() {
  List<TestCase> testCases = [
    TestCase([1, 3], [2]),
    TestCase([1, 2], [3, 4]),
    TestCase([], [1]),
    TestCase([2], []),
    TestCase([1, 3], [2, 7]),
  ];

  for (int i = 0; i < testCases.length; i++) {
    print('==================================');
    print(Solution.findMedianSortedArrays(testCases[i].a, testCases[i].b));
  }
}

class Solution {
  static double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    int aIndex = 0;
    int bIndex = 0;
    int aLen = nums1.length;
    int bLen = nums2.length;
    int mergedLen = aLen + bLen;

    List<int> mergedArr = [];
    if (nums1.isNotEmpty) {
      while (aIndex < aLen) {
        if (nums2.isEmpty || bIndex == bLen) {
          mergedArr.addAll(nums1.sublist(aIndex));
          break;
        }
        if (nums1[aIndex] < nums2[bIndex]) {
          mergedArr.add(nums1[aIndex]);
          aIndex++;
        } else if (nums1[aIndex] > nums2[bIndex]) {
          mergedArr.add(nums2[bIndex]);
          bIndex++;
        } else {
          mergedArr.add(nums1[aIndex]);
          mergedArr.add(nums2[bIndex]);
          aIndex++;
          bIndex++;
        }
      }
    }
    if (nums2.isNotEmpty) {
      if (bIndex < bLen) {
        mergedArr.addAll(nums2.sublist(bIndex));
      }
    }

    if (mergedLen.isOdd) {
      return mergedArr[mergedLen ~/ 2].toDouble();
    } else {
      int ansIndex = (mergedLen ~/ 2) - 1;
      return (mergedArr[ansIndex] + mergedArr[ansIndex + 1]) / 2;
    }
  }
}
