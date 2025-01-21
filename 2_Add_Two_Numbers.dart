/**
 * You are given two non-empty linked lists representing two non-negative integers. 
 * The digits are stored in reverse order, and each of their nodes contains a single digit. 
 * Add the two numbers and return the sum as a linked list.
 * 
 * You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 * Input: l1 = [2,4,3], l2 = [5,6,4]
 * Output: [7,0,8]
 * Explanation: 342 + 465 = 807.
 * Example 2:
 * 
 * Input: l1 = [0], l2 = [0]
 * Output: [0]
 * Example 3:
 * Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 * Output: [8,9,9,9,0,0,0,1]
 * 
 * Constraints:
 * 
 * The number of nodes in each linked list is in the range [1, 100].
 * 0 <= Node.val <= 9
 * It is guaranteed that the list represents a number that does not have leading zeros.

 * 
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class ListNode {
   int val;
   ListNode? next;
   ListNode([this.val = 0, this.next]);
 }

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    BigInt a = getReversedNum(l1);
    BigInt b = getReversedNum(l2);
    String c = '${a + b}';

    int lastIndex = c.length - 1;
    ListNode headNode = ListNode(int.parse(c[lastIndex]));
    ListNode tempNode = headNode;
    for (int i = lastIndex - 1; i >= 0; i--) {
        while (tempNode.next != null) {
            tempNode = tempNode.next!;
        }
        tempNode.next = ListNode(int.parse(c[i]));
    }

    return headNode;
  }

  BigInt getReversedNum(ListNode? headNode) {
    if (headNode == null) {
        return BigInt.from(0);
    }

    ListNode curr = headNode;
    String num = '';


    while (true) {
        num = '${curr.val}$num';
        if (curr.next == null) {
            return BigInt.parse(num);
        } else {
            curr = curr.next!;
        }
    }
  }
}

// IMPROVED VERSION
class Solution2 {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummyHead = ListNode(0);
    ListNode curr = dummyHead;
    int carry = 0;
    while (l1 != null || l2 != null || carry != 0) {
        int x = l1 != null ? l1.val : 0;
        int y = l2 != null ? l2.val : 0;
        int sum = carry + x + y;
        carry = (sum / 10).floor();

        curr.next = ListNode(sum % 10);
        curr = curr.next!;
        if (l1 != null) l1 = l1.next;
        if (l2 != null) l2 = l2.next;
    }
    return dummyHead.next;
  }
}