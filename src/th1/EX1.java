package th1;

import java.io.File;
import java.io.IOException;

public class EX1 {
	//method delectedFile
	public static boolean deletedFile(String path) {
		File file = new File(path);
		return deletedFileRecursive(file);
	}
	//recursive
	private static boolean deletedFileRecursive(File file) {
		if(!file.exists()) return true; // neu file khong ton tai tra ve true vi khong co file nen cung co nghia la file da mat == voi deleted 
		if(file.isDirectory()) { // neu file la thu muc 
			File[] listFile = file.listFiles(); //tao list file la danh sasch cac file co trong thu muc
			if(listFile != null) {// neu listfile khong rong 
				for(File f : listFile) { // khi 1 file thuoc listfile 
					if(!deletedFileRecursive(f)) {// thi no khong xoa duoc 
						return false;
					}
				}
			}
		}
		//if()
		return file.delete();// tra ve kqua khi xoa file
	}
	
 public static boolean deleteFile2(String path){
	 File file = new File(path);
	 if(!file.exists()) return true;
	 	File[] list = file.listFiles();
	 	if(list != null) {
	 	for(File f : list){
	 		deleteFile2(f.getAbsolutePath());
	 	}
	 }
	 	System.out.println("Da xoa: " + path);
		return file.delete();
}
	public static void findByExts(String path, String... exts) {
		File file = new File(path);;
		if(!file.exists()) System.out.println("file khong ton tai");
		if(file.isFile()) {
			String name = file.getName().toLowerCase();
			for(String ext : exts) {
				if(name.endsWith(ext.toLowerCase())) {
					System.out.println("File is found: " + file.getAbsolutePath());
					break;
				}
			}
		}else if(file.isDirectory()) {
			for(File f : file.listFiles()) {
				findByExts(f.getAbsolutePath(), exts);
			}
		}
	}
		public static void main(String[] args) {
		//tao cac file va thu muc
		new File("D:\\LTM\\test").mkdirs();
		try {
			new File("D:\\LTM\\test\\hehe.txt").createNewFile();
			new File("D:\\LTM\\test\\heh1231").mkdir();
			new File("D:\\LTM\\test\\heh1231\\aa.txt").createNewFile();
		} catch(IOException e) {
			e.printStackTrace();
		}
		String path = "D:\\LTM\\test";

		/*
		long start = System.nanoTime();

		boolean kqua = deletedFile(path);
		System.out.println(kqua);
		long end = System.nanoTime();
		long result = end - start ;
		System.out.println(result + "ns"); 
		*/

		long start2 = System.nanoTime();
		//boolean kqua2 = deleteFile2(path);
		//System.out.println(kqua2);
		findByExts(path, ".txt");
		long end2 = System.nanoTime();
		long result2 = end2 - start2 ;
		System.out.println(result2 + "ns");
		
		

	}
}

