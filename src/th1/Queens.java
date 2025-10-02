package th1;
import th1.BFS;
public class Queens {
	private int n;
	private Node goal;
	public Queens(int n) {
		// TODO Auto-generated constructor stub
		this.n = n;
	}
	public void bfs() {
		BFS bfs = new BFS();
		this.goal = bfs.bfsUsingQueue(new Node(n), n);
	}
	public void dfs() {
		DFS dfs = new  DFS();
		this.goal = dfs.DFSUsingStack(new Node(n), n);
	}
}
