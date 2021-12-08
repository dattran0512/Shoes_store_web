package net.java.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.java.dao.ShoesDAO;
import net.java.model.Shoes;
import net.java.model.TypeShoes;

/**
 * Servlet implementation class GetAllShoesForMan
 */
@WebServlet("/GetAllShoesForMan")
public class GetAllShoesForMan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       ShoesDAO shoesDAO = new ShoesDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllShoesForMan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<TypeShoes> listTypeWomenShoes = shoesDAO.getAll_TypeWomen(); 
		request.setAttribute("listWomenShoes", listTypeWomenShoes);
		
		List<TypeShoes> listTypeManShoes = shoesDAO.getAll_TypeMan();
		request.setAttribute("listManShoes", listTypeManShoes);
		
		List<Shoes> listManShoes = shoesDAO.getAllManShoes();
		request.setAttribute("listShoes" , listManShoes);
		request.getRequestDispatcher("Shoes.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
