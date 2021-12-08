package net.java.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.java.dao.ShoesDAO;
import net.java.model.BillDetail;
import net.java.model.Shoes;



/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ShoesDAO shoesDAO = new ShoesDAO();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int ShoesID =Integer.parseInt(request.getParameter("ShoesID"));
		Shoes shoes;
		try {
			shoes = shoesDAO.Get_Shoes_By_ID(ShoesID);
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("cart");
			
				if(obj==null) {
					BillDetail billDetail = new BillDetail();
					billDetail.setShoes(shoes);
					billDetail.setQuantity(1);
					billDetail.setUnitPrice(shoes.getPrice());
					// gio hang co nhieu mat hang
					Map<Integer, BillDetail> map = new HashMap<>();
					map.put(ShoesID, billDetail);// them mat hang vao ds
					
					session.setAttribute("cart", map);// luu tam vao session
				}else {
					@SuppressWarnings("unchecked")
					Map<Integer, BillDetail> map = (Map<Integer, BillDetail>) obj;
					BillDetail billDetail= map.get(ShoesID);
					if(billDetail==null) {
						billDetail = new BillDetail();
						billDetail.setShoes(shoes);
						billDetail.setQuantity(1);
						billDetail.setUnitPrice(shoes.getPrice());
						map.put(ShoesID, billDetail);
					}else {
						billDetail.setQuantity(billDetail.getQuantity()+1);
					}
					session.setAttribute("cart", map);// luu tam vao session
				}
				
				response.sendRedirect("Cart.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
