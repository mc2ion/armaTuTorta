package Util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;



public class FilesName  {
	
	public static String[] getFilesNamesIndex(HttpServletRequest request) {
		
		String[] filesName = null;
		//String path = "/home/armatuto/public_html/images/galeria_inicio";
		String path = "C:\\Program Files (x86)\\Apache Software Foundation\\Tomcat 7.0\\webapps\\armaTuTorta\\images\\galeria_inicio";
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		if (listOfFiles.length > 0){
			filesName = new String[listOfFiles.length]; ;
			for (int i = 0; i < listOfFiles.length; i++) {
			      if (listOfFiles[i].isFile()) {
			    	  filesName[i] = listOfFiles[i].getName();
		      } 
			}
		}
	    return filesName;
	}
	
	/**
	 * Funci�n que elimina acentos y caracteres especiales de
	 * una cadena de texto.
	 * @param input
	 * @return cadena de texto limpia de acentos y caracteres especiales.
	 */
	public static String remove(String input) {
	    // Cadena de caracteres original a sustituir.
	    String original = "��������������u�������������������";
	    // Cadena de caracteres ASCII que reemplazar�n los originales.
	    String ascii = "aaaeeeiiiooouuunAAAEEEIIIOOOUUUNcC";
	    String output = input;
	    for (int i=0; i<original.length(); i++) {
	        // Reemplazamos los caracteres especiales.
	        output = output.replace(original.charAt(i), ascii.charAt(i));
	    }//for i

	    return output;
	}
}
