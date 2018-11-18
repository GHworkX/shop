package cn.xd.utils;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class SaveFileUtils {
	public static Boolean saveFile(File file,String fileName,String filePath){
		if (file != null) {
			File diskFile = new File(filePath + "//" +fileName);
			try {
				FileUtils.copyFile(file, diskFile);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}
		return true;
	}
}
