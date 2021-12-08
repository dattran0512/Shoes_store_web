package net.java.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.java.dao.BillDAO;
import net.java.model.BillDetail;

/**
 * Servlet implementation class CartCheckOut
 */
@WebServlet("/CartCheckOut")
public class CartCheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BillDAO billDAO = new BillDAO();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartCheckOut() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("cart");
		
		String customerName = request.getParameter("name");
		String customerPhone = request.getParameter("phone");
		int  customerCity= Integer.parseInt( request.getParameter("calc_shipping_provinces"));
		String  customerDistrict= request.getParameter("calc_shipping_district");
		String  customerDetailAdd= request.getParameter("detailAddress");
		String totalAddress = customerDetailAdd + "- " + customerDistrict +"- "+ customerCity;
		
		
		if(obj!=null) {
		
		@SuppressWarnings("unchecked")
		Map<Integer, BillDetail> map = (Map<Integer, BillDetail>) obj;  
		
		final String IdBill = UUID.randomUUID().toString();  // tạo chuỗi khóa ngẫu nhiên cho Bill
		Date date = new Date();
		SimpleDateFormat  formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");  // trả về ngày giờ hiện tại 
		String strDate = formatter.format(date);  
		
		
		long totalOrder = 0;
		billDAO.insertBill(IdBill, customerName, customerPhone, customerCity, customerDistrict, customerDetailAdd, totalAddress, totalOrder,strDate) ;
		
		for(Entry<Integer, BillDetail> entry : map.entrySet()) {  // với từng billdetail trong map thì lấy giá trị ra rồi đẩy vào database
			totalOrder += entry.getValue().getUnitPrice();
			billDAO.insertBillDetail(entry.getKey(), entry.getValue().getUnitPrice(), entry.getValue().getQuantity(), entry.getValue().getShoes().getId(), IdBill);
		}
		
		billDAO.UpdateTotalOrderBill(IdBill,totalOrder);  // update tổng giá  tiền của Bill
		
		
		
		session.removeAttribute("cart"); // xóa giỏ hàng
		
	
		}
		
		} catch (Exception e) {
	}
		 response.sendRedirect("index.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
