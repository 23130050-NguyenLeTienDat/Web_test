package th1;

import java.util.ArrayList;
import java.util.List;

public class Node {
	int n;
	boolean visited;
	public List<Integer> state;
	public List<Node> neighbours;
	public Node parent;
	public Node(int n) {
		// TODO Auto-generated constructor stub
		this.n = n;
		this.neighbours = new ArrayList<Node>();
		this.parent = null;
	}
	public Node(int n, List<Integer> state) {
		// TODO Auto-generated constructor stub
		this.n = n;
		this.state = state;
	}
	public void addNeighbours(Node neighbour) {
		this.neighbours.add(neighbour);
	}
	public boolean isValid(List<Integer> state) {
		if(state.size() ==1) return true;
		while(state.size() >1){
			/*for (int i = 0; i < state.size(); i++) {
				if(state.contains(i)) {
					return false;
				}else if(state.get(i+1) == state.get(i)+1) {
					return false;
				}else if(state.get(i-1) == state.get(i)-1) {
					return false;
				}
			}*/
			for (int i = 0; i < state.size(); i++) {
				if(state.size() -1 != i) {
					if(Math.abs((state.size()-1) -i) ==  Math.abs((state.get(state.size()-1)- state.get(i)))) {
						return false;
					}
				}
			}
		}
		return true;
	}
	private List<Integer> place(int x){
		List<Integer> stateNow = this.state;
		stateNow.add(x);
		if(isValid(stateNow)) {
			this.state = stateNow;
		}else if(!isValid(stateNow)) return null;
		return this.state;
	}
}
