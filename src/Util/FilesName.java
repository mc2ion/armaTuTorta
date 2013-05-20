package Util;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;



public class FilesName  {
	
	private static HashMap<String, String[]> fileNamesCupcakes = new HashMap<String, String[]>();
	private static HashMap<String, String[]> fileNamesCakes = new HashMap<String, String[]>();
	private static HashMap<String, String[]> fileNamesSpecialsCakes = new HashMap<String, String[]>();
	private static String CUPCAKES = "cupcakes";
	
	public static void cleanCupcakesCache(){
		fileNamesCupcakes.clear();
		System.out.println("Cupcakes's cache was clear");
	}
	
	public static void cleanCakesCache(){
		fileNamesCakes.clear();
		System.out.println("Cakes's cache was clear");
	}
	
	public static void cleanSpecialsCakesCache(){
		fileNamesSpecialsCakes.clear();
		System.out.println("Specials Cakes's cache was clear");
	}

	public static String[] getFilesNamesIndex(HttpServletRequest request) {
		
		String[] filesName;
		if (fileNamesCupcakes.get(CUPCAKES) == null){
			String path = "\\home\\armatuto\\public_html\\images\\galeria_inicio";
			
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();
			filesName = new String[listOfFiles.length]; ;
			for (int i = 0; i < listOfFiles.length; i++) {
			      if (listOfFiles[i].isFile()) {
			    	  filesName[i] = listOfFiles[i].getName();
			      } 
		    }
			fileNamesCupcakes.put(CUPCAKES, filesName);
		}else{
			filesName = (String[]) fileNamesCupcakes.get(CUPCAKES);
		}
	    return filesName;

	}
	
}
