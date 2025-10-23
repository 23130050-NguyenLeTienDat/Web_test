package TH3;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class SplitAndJoin {
	public static void split(String source, long pSize) throws IOException {
		String dest;
		FileOutputStream fos;
		//Open source file
		FileInputStream fis = new FileInputStream(source);
		//File number
		File file = new File(source);
		long fileNum = file.length() / pSize;
		//remain
		long remain = file.length() % pSize;
		//repeat
		int fileNo = 0;
		for (; fileNo< fileNum; fileNo++) {
		//create part file
			dest = source + createExit(fileNo);
			fos = new FileOutputStream(dest);
		//copy pSize from source to part
			copy(fis, fos, pSize);
		//close part file
			fos.close();
		//end repeat
		}
		if (remain > 0) {
			//create part file
			dest = source + createExit(fileNo);
			fos = new FileOutputStream(dest);
			//copy pSize from source to part
			byte[] buff = new byte[102400];
			int count;
			while((count = fis.read(buff))!=-1) fos.write(buff, 0 , count);
			//close part file
		}
		//close source
		fis.close();
	}
	private static void copy(FileInputStream fis, FileOutputStream fos, long pSize) throws IOException {
		byte[] buff = new byte[102400];
		int count;
		long remain = pSize;
		int byteMustRead;
		while(remain>0) {
			byteMustRead = (int) (remain>buff.length? buff.length: remain);
			count = fis.read(buff, 0 , byteMustRead);
			fos.write(buff,0,count);
			remain -= count;
		}
		
	}
	private static String createExit(int fileNo) {
		fileNo++;
		if(fileNo<10) return ".00" + fileNo;
		if(fileNo<100) return ".0" + fileNo;	
		return "." + fileNo;
	}
	public static void join(String pathFile) throws IOException {
		String pFile;
		String org = pathFile.substring(0, pathFile.lastIndexOf("."));
		FileOutputStream fos = new FileOutputStream(org);
		File file;
		int fileNo = 0;
		FileInputStream fis;
		while(true) {
			pFile = org + createExit(fileNo++);
			file = new File(pFile);
				byte[] buff = new byte[102400];
			int count;
			while((count = fis.read(buff))!=-1) fos.write(buff, 0 , count);
			fis.close();
		}
		fos.close();
	}
	public static void main(String[] args) throws IOException {
		String source = "D:\\123\\hehe\\";
		long pSize = 1000000;
		split(source, pSize);
		join(source);
	}
}
