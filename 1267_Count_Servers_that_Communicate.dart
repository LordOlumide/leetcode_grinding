class Solution {
  int countServers(List<List<int>> grid) {
    int ans = 0;
    int noOfRows = grid.length;
    int noOfCols = grid[0].length;

    List<int> noOnRow = List.filled(noOfRows, 0);
    List<int> noOnCol = List.filled(noOfCols, 0);

    for (int i = 0; i < noOfRows; i++) {
        for (int j = 0; j < noOfCols; j++) {
            if (grid[i][j] == 1) {
                noOnRow[i]++;
                noOnCol[j]++;
            }
        }
    }
    for (int i = 0; i < noOfRows; i++) {
        for (int j = 0; j < noOfCols; j++) {
            if (grid[i][j] == 1 && (noOnRow[i] > 1 || noOnCol[j] > 1)) {
                ans++;
            }
        }
    }
    return ans;
  }
}