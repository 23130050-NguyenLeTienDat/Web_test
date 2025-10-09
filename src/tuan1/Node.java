package tuan1;

import java.util.ArrayList;
import java.util.List;

public class Node {
    int n;
    public List<Integer> state; // state: list các vị trí hàng của quân hậu, chỉ số list là cột
    public Node parent;
    
    // Constructor để tạo node gốc
    public Node(int n) {
        this.n = n;
        this.state = new ArrayList<>();
        this.parent = null;
    }
    
    // Constructor để tạo các node con
    public Node(int n, List<Integer> state) {
        this.n = n;
        this.state = state;
        this.parent = null;
    }

    /**
     * FIX: Sửa lại hoàn toàn logic kiểm tra tính hợp lệ.
     * Chỉ cần kiểm tra quân hậu cuối cùng với tất cả các quân hậu đã đặt trước đó.
     */
    public boolean isValid(List<Integer> state) {
        if (state.size() <= 1) {
            return true;
        }
        int lastQueenCol = state.size() - 1;
        int lastQueenRow = state.get(lastQueenCol);

        for (int prevCol = 0; prevCol < lastQueenCol; prevCol++) {
            int prevRow = state.get(prevCol);
            
            // 1. Kiểm tra cùng hàng
            if (lastQueenRow == prevRow) {
                return false;
            }
            
            // 2. Kiểm tra đường chéo
            if (Math.abs(lastQueenCol - prevCol) == Math.abs(lastQueenRow - prevRow)) {
                return false;
            }
        }
        return true;
    }

    private List<Integer> place(int row) {
        List<Integer> newState = new ArrayList<>(this.state);
        newState.add(row);
        if (isValid(newState)) {
            return newState;
        }
        return null;
    }

    public List<Node> getNeighbours() {
        // Nếu đã đặt đủ N quân hậu, không có trạng thái kế tiếp
        if (state.size() == n) {
            return new ArrayList<>(); // FIX: Trả về list rỗng thay vì null để an toàn hơn
        }

        List<Node> neighbours = new ArrayList<>();
        for (int row = 0; row < n; row++) {
            List<Integer> newState = place(row);
            if (newState != null) {
                Node child = new Node(n, newState);
                neighbours.add(child);
            }
        }
        return neighbours;
    }
}