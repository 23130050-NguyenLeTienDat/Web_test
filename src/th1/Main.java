package th1;

import th0.Node;

public class Main {
	public static void main(String[] args) {
		Queens q = new Queens(8);
		q.bfs();
		q.dfs();
	}
}
