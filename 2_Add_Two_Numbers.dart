/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
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