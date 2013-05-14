package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Util.SendEmail;


import command.CommandExecutor;
import domain.Client;
import domain.ListOrder_Step;
import domain.OrderCake;
import domain.StepOption;

/**
 * Servlet implementation class ListStepOptionsServlet
 */
@WebServlet(description = "servlet to list step options", urlPatterns = { "/ArmaTuTortaServlet" })
public class ArmaTuTortaServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArmaTuTortaServlet() {
        super();
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			Client user = (Client)session.getAttribute("client");
			
			if(user != null){
				// perform list user operations
				Integer typeId = Integer.valueOf(request.getParameter("typeId"));
				System.out.println("typeId" + typeId);
				@SuppressWarnings("unchecked")
				ArrayList<ListOrder_Step> list = (ArrayList<ListOrder_Step>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListPasos(typeId));
				
				System.out.println("aqui " + list.size());
				request.setAttribute("options", list);
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/creaTuTorta.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("options", new ArrayList<StepOption>());
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/creaTuTorta.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			request.setAttribute("options", new ArrayList<StepOption>());
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/creaTuTorta.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("pr");
		
		if (type == null)
			doGet(request, response);
		else{
			Properties propertiesFile = new Properties();
			propertiesFile.load( new FileInputStream( getServletContext().getInitParameter("properties") ) );
			OrderCake orderCake = new OrderCake();
			if  (type.equals("1")){
				String dirPath = propertiesFile.getProperty("pedidosTortasDirectory");
				orderCake = requestMultipart(request, response, dirPath );
			}else{
				requestPlain(request, response, propertiesFile);
			}
			RequestDispatcher  rd;
			request.setAttribute("pedido", orderCake);
			request.setAttribute("info", type);
		
			rd = getServletContext().getRequestDispatcher("/creaTuTortaConfirmation.jsp");
			rd.forward(request, response);
			
		}
	}
	
	static OrderCake requestMultipart(HttpServletRequest request, HttpServletResponse response, String dirPath) throws IOException{
		
		MultipartRequest multipart = new MultipartRequest(request, dirPath, 5*1024*1024, new DefaultFileRenamePolicy());
		
		HttpSession infoPage = request.getSession();
		final Client client = (Client) infoPage.getAttribute("client");
		
		String formaInt = multipart.getParameter("1");
		String tamInt = multipart.getParameter("2");
		String saborInt = multipart.getParameter("3");
		String capasInt = multipart.getParameter("4");
		String[] rellenoInt = multipart.getParameterValues("5");
		String cubiertaInt = multipart.getParameter("6");
		String forma, tamano, sabor, capas,  cubierta;
		final String[] relleno = new String[rellenoInt.length];
		String precio = multipart.getParameter("priceCake");
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> hashMap = (HashMap<String, String>) infoPage.getAttribute("hashMap");
		forma = hashMap.get("1"+formaInt);
		tamano = hashMap.get("2"+tamInt);
		sabor = hashMap.get("3"+saborInt);
		capas = hashMap.get("4"+capasInt);
		cubierta = hashMap.get("6"+cubiertaInt);
		for (int i = 0 ; i < rellenoInt.length; i++){
			relleno[i] = hashMap.get("5"+ rellenoInt[i]);
		}
		
		OrderCake orderCake = new OrderCake();
		orderCake.setForma(forma);
		orderCake.setSabor(sabor);
		orderCake.setTamano(tamano);
		orderCake.setCapas(capas);
		orderCake.setCubiertas(cubierta);
		orderCake.setRelleno(relleno);
		orderCake.setPrecio(precio);
	
		if (cubierta.contains("Fondant con la imagen")){	
			File imageFile = multipart.getFile("txtImage");
			String image = imageFile.getName();
			String dir = dirPath;
			System.out.println("dir " +dir);
			int pointIndex = image.indexOf(".");
			String extension = image.substring(pointIndex);
			String name = image.substring(0,pointIndex);
			image = name.toLowerCase().replace(" ", "_") + "_" + client.getLastName() + extension;
			File destination = new File(dir + image);
			imageFile.renameTo(destination);
			orderCake.setNombreImagen(dir + image);
		}
		
		return orderCake;
	}
	
	static void requestPlain(HttpServletRequest request, HttpServletResponse response, final Properties propertiesFile){
		String forma = request.getParameter("forma");
		String tam = request.getParameter("tam");
		String sabor = request.getParameter("sabor");
		String capas = request.getParameter("capas");
		String[] relleno =request.getParameterValues("relleno");
		String cubierta = request.getParameter("cubierta");
		String precio = request.getParameter("priceCake");
		String fecha = request.getParameter("txtFecha");
		String clientId =  request.getParameter("clientId");
		
		try{
		final Client client = (Client) CommandExecutor.getInstance().executeDatabaseCommand(new command.SelectClient(Long.valueOf(clientId)));
		
		String nombreImagen = request.getParameter("nombreImagen");
		boolean attach = false;
		if (nombreImagen != "")
			attach = true;
		final boolean attachment = attach;
		final String[] relle = relleno;
		
		System.out.println(attach);
		final String[] datos = {forma, tam, sabor, capas, cubierta, precio, nombreImagen, fecha};
		new Thread(new Runnable() {
		    public void run() {
	    		SendEmail.sendEmailOrderCake(propertiesFile, "123", attachment, "contrato", datos, relle, client);
					
		    }
		}).start();

		
		} catch (Exception e) {}
	}
}
