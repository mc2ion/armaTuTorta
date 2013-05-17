package servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Util.SendEmail;

import command.CommandExecutor;
import domain.Client;
import domain.OrderItem;
import domain.StepOption;

/**
 * Servlet implementation class ListStepOptionsServlet
 */
@WebServlet(description = "servlet to list step options", urlPatterns = { "/DulcesTortasServlet" })
public class DulcesTortasServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DulcesTortasServlet() {
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
				@SuppressWarnings("unchecked")
				ArrayList<StepOption> list = (ArrayList<StepOption>)CommandExecutor.getInstance().executeDatabaseCommand(new command.ListDulcesTortas(typeId));
				
				System.out.println("aqui");
				request.setAttribute("options", list);
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dulcesTortas.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("aqui error");
				request.setAttribute("options", new ArrayList<StepOption>());
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/dulcesTortas.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] productos = request.getParameterValues("dulcesTortas");
		if (productos == null)
			doGet(request,response);
		else{
			HttpSession infoPage = request.getSession();
			Client clientAux = (Client) infoPage.getAttribute("client");
			@SuppressWarnings("unchecked")
			HashMap<String, String> hashMap = (HashMap<String, String>) infoPage.getAttribute("hashMapDulcesTortas");
			@SuppressWarnings("unchecked")
			HashMap<String, Double> hashMapPrice = (HashMap<String, Double>) infoPage.getAttribute("hashMapPriceDulcesTortas");
			@SuppressWarnings("unchecked")
			HashMap<String, Long> hashMapId = (HashMap<String, Long>) infoPage.getAttribute("hashMapIdDulcesTortas");
			
			String price = request.getParameter("priceDulcCake");
			final String[] cantProd = new String[productos.length];
			for (int i = 0 ; i < productos.length ; i++){
				String cantidad = request.getParameter("selDulcesTortas" + productos[i]);
				cantProd[i] = cantidad + " " + hashMap.get(productos[i]);
			}
			
			
			
			/* Establezco los valores de las cosas pedidas */
			List<OrderItem> orderItems = new LinkedList<OrderItem>();
			
			OrderItem item = new OrderItem();
			/* Relleno */
			for (int i = 0; i < productos.length; i++){
				item = new OrderItem();
				String productName = hashMap.get(productos[i]);
				item.setPrice(hashMapPrice.get(productName));
				item.setStepOptionId(hashMapId.get(productName));
				System.out.println("price " + item.getPrice() + item.getStepOptionId());
				orderItems.add(item);
			}
			
//			
//			
//			final Properties propertiesFile = new Properties();
//			propertiesFile.load( new FileInputStream( getServletContext().getInitParameter("properties") ) );
//			
//			try{
//				final Client client = (Client) CommandExecutor.getInstance().executeDatabaseCommand(new command.SelectClient(Long.valueOf(clientAux.getId())));
//				final String[] datos = {"17/05/2013", price};
//				new Thread(new Runnable() {
//				    public void run() {
//			    		SendEmail.sendEmailOrderDulcesTortas(propertiesFile, "123", false, "contrato", datos, cantProd, client);
//							
//				    }
//				}).start();
//			}catch (Exception e) {}
//			
//			request.setAttribute("info", "2");
//			RequestDispatcher  rd;
//			rd = getServletContext().getRequestDispatcher("/creaTuTortaConfirmation.jsp");
//			rd.forward(request, response);
		}
	}
}
