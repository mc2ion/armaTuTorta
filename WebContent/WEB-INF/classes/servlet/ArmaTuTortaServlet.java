package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
		String formaInt = request.getParameter("1");
		if (formaInt == null)
			doGet(request, response);
		else{
			String tamInt = request.getParameter("2");
			String saborInt = request.getParameter("3");
			String capasInt = request.getParameter("4");
			String[] rellenoInt = request.getParameterValues("5");
			String cubiertaInt = request.getParameter("6");
			String forma, tamano, sabor, capas,  cubierta;
			final String[] relleno = new String[rellenoInt.length];
			String precio = request.getParameter("priceCake");
			
			HttpSession infoPage = request.getSession();
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
			System.out.print(" form " + forma + "/" + tamano + "/" + sabor +"/" + capas +"/"  +cubierta +"/"  +
					Arrays.deepToString(relleno));
			
			OrderCake orderCake = new OrderCake();
			orderCake.setForma(forma);
			orderCake.setSabor(sabor);
			orderCake.setTamano(tamano);
			orderCake.setCapas(capas);
			orderCake.setCubiertas(cubierta);
			orderCake.setRelleno(relleno);
			orderCake.setPrecio(precio);
			
			
			RequestDispatcher  rd;
			request.setAttribute("pedido", orderCake);
			rd = getServletContext().getRequestDispatcher("/creaTuTortaConfirmation.jsp");
			rd.forward(request, response);
			
		}
	}
}
