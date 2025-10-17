package th2;

import java.io.File;
import java.util.Scanner;

public class AppComandLine {
	private static String currentDir = "D:\\LTM\\tét";
	public static void changeDirectory(String path) {
		if(path.equals("..")) {
			File parent = new File(currentDir).getParentFile();
			if(parent != null) currentDir = parent.getAbsolutePath();
		} else {
			File newDir = new File(currentDir, path);
			if(newDir.isDirectory()) currentDir = newDir.getAbsolutePath();
		}
	}
	public static void listDirectory(String path) {
		File file = new File(path);
		File[] list = file.listFiles();
		if(!file.exists()) return;
		if(list == null) return;
		for(File l : list) {
			if(l.isDirectory()) System.out.println(l.getName().toUpperCase());
		}
		for(File l : list) {
			if(l.isFile()) System.out.println(l.getName().toLowerCase());
		}
	}
	public static void delete(String path) {
		File file = new File(path);
		 	File[] list = file.listFiles();
		 	if(list != null) {
		 	for(File f : list){
		 		delete(f.getAbsolutePath());
		 		System.out.println("File is deleteed " + f.getName());
		 	}
		 	}
		 	file.delete();
	}
	public static void processComand(String cmd) {
		switch(cmd) {
			case "CD":
				changeDirectory(cmd);
			case "DIR":
				listDirectory(cmd);
			case "DELETE":
				delete(cmd);
		}
	}
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while(true) {
			System.out.println(currentDir+ ">");
			String in  = sc.nextLine().trim().toUpperCase();
			if(in.equalsIgnoreCase("EXIT")) break;
			processComand(in);
		}
	}
}