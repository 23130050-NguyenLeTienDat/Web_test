package th0;

import java.util.ArrayList;
import java.util.List;

public class Node {
	int state;
	boolean visited;
	List<Node> neighbours;
	Node parent;
	public Node(int state) {
		this.state = state;
		this.neighbours = new ArrayList<Node>();
		this.parent= null;
	}
	public void addNeighbours ( Node newNeighbours) {
		this.neighbours.add(newNeighbours);
	}
	public List<Node> getNeighbours() {
		return neighbours;
	}
}
