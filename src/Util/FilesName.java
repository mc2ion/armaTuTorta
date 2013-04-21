package Util;

import java.io.File;


public class FilesName  {

	public static void getFilesNames() {
		File folder = new File("../images/galeria_cupcakes");
		
		File[] listOfFiles = folder.listFiles();

	    for (int i = 0; i < listOfFiles.length; i++) {
	      if (listOfFiles[i].isFile()) {
	        System.out.println("File " + listOfFiles[i].getName());
	      } else if (listOfFiles[i].isDirectory()) {
	        System.out.println("Directory " + listOfFiles[i].getName());
	      }
	    }

	}
		
	
}
