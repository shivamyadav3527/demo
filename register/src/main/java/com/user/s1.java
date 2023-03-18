package com.user;

import java.io.IOException;
import java.io.*;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.*;

/**
 * Servlet implementation class s1
 */
@WebServlet("/s1")
@MultipartConfig
public class s1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public s1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		Part part=request.getPart("image");
		String filename=part.getSubmittedFileName();

		
		
		
		
		//connection...........
		 try {
			 Thread.sleep(2000);
			 Class.forName("com.mysql.jdbc.Driver");
			 String url="jdbc:mysql://localhost:3306/register";
			 String username="root";
			 String passwod="7238";
			 Connection con=DriverManager.getConnection(url,username,passwod);
	    	 String q="insert into user(name,password,email,imageName) values(?,?,?,?)";
			 
			 PreparedStatement pstmt=con.prepareStatement(q);
			 pstmt.setString(1,name);
			 pstmt.setString(2,password);
			 pstmt.setString(3,email);
			 pstmt.setString(4,filename);
			 
			 pstmt.executeUpdate();
			 
			 InputStream is=part.getInputStream();
			 byte []data=new byte[is.available()];
			 
			 is.read(data);
			 String path=request.getRealPath("/")+"img"+File.separator+filename;
			 
			 FileOutputStream fos=new FileOutputStream(path);
			 fos.write(data);
			 fos.close();
			 
			 out.println("done");

		 }
			 
		catch(Exception e){
			e.printStackTrace();
			out.println("Error");
			}
	 }

}
