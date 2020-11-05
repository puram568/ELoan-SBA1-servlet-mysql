package com.iiht.evaluation.eloan.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.iiht.evaluation.eloan.dao.ConnectionDao;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;

@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectionDao connDao;

	public void setConnDao(ConnectionDao connDao) {
		this.connDao = connDao;
	}

	public void init(ServletConfig config) {
		String jdbcURL = config.getServletContext().getInitParameter("jdbcUrl");
		String jdbcUsername = config.getServletContext().getInitParameter("jdbcUsername");
		String jdbcPassword = config.getServletContext().getInitParameter("jdbcPassword");
		System.out.println(jdbcURL + jdbcUsername + jdbcPassword);
		this.connDao = new ConnectionDao(jdbcURL, jdbcUsername, jdbcPassword);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String viewName = "";
		try {
			switch (action) {
			case "registernewuser":
				viewName = registernewuser(request, response);
				break;
			case "validate":
				viewName = validate(request, response);
				break;
			case "placeloan":
				viewName = placeloan(request, response);
				break;
			case "application1":
				viewName = application1(request, response);
				break;
			case "editLoanProcess":
				viewName = editLoanProcess(request, response);
				break;
			case "registeruser":
				viewName = registerUser(request, response);
				break;
			case "register":
				viewName = register(request, response);
				break;
			case "application":
				viewName = application(request, response);
				break;
			case "trackloan":
				viewName = trackloan(request, response);
				break;
			case "editloan":
				viewName = editloan(request, response);
				break;
			case "displaystatus":
				viewName = displaystatus(request, response);
				break;
			default:
				viewName = "notfound.jsp";
				break;
			}
		} catch (Exception ex) {

			throw new ServletException(ex.getMessage());
		}
		RequestDispatcher dispatch = request.getRequestDispatcher(viewName);
		dispatch.forward(request, response);
	}

	private String validate(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write the code to validate the user */
		HttpSession session = request.getSession();
		String view = "";

		String userName = request.getParameter("loginid");
		String password = request.getParameter("password");

		if (userName == null) {
			view = "index.jsp";
		} else if (password == null) {
			request.setAttribute("err", "Password is not received!");
			view = "index.jsp";
		} else {
			User user = null;
			try (Connection con = connDao.connect();
					PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE userName=?")) {
				pst.setString(1, userName);
				ResultSet rs = pst.executeQuery();

				if (rs.next()) {
					user = new User();
					user.setUsername(rs.getString(1));
					user.setPassword(rs.getString(2));
				}

				if (user == null || !password.equals(user.getPassword())) {
					view = "errorPage.jsp";
				} else if (user.getUsername().equals("admin")) {
					view = "adminhome1.jsp";
				} else {
					view = "userhome.jsp";
				}
			} catch (SQLException e) {
				throw e;
			}
			session.setAttribute("user", user);

		}
		return view;
	}

	private String placeloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/* write the code to place the loan information */
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		LoanInfo loanInfo = new LoanInfo();
		
//		loanInfo.setApplno(request.getParameter("loanAppNum"));
		loanInfo.setPurpose(request.getParameter("loanName"));
		loanInfo.setAmtrequest(Integer.parseInt(request.getParameter("loanAmount")));
		loanInfo.setDoa(request.getParameter("loanAppDate"));
		loanInfo.setBstructure(request.getParameter("businessStructure"));
		loanInfo.setBindicator(request.getParameter("billingIndicator"));
		loanInfo.setTaxindicator(request.getParameter("taxIndicator"));
		loanInfo.setAddress(request.getParameter("address"));
		loanInfo.setMobile(request.getParameter("mobile"));
		loanInfo.setEmail(request.getParameter("email"));
 
		try (Connection con = connDao.connect();

			PreparedStatement pst = con.prepareStatement("INSERT INTO loan (userName,loanName,loanAmount,loanAppDate,businessStructure,billingIndicator,taxIndicator,address,mobile,email,status) VALUES (?,?,?,?,?,?,?,?,?,?,?)")) {

			pst.setString(1, user.getUsername());
//			pst.setString(1, loanInfo.getApplno());
			pst.setString(2, loanInfo.getPurpose());
			pst.setLong(3, loanInfo.getAmtrequest());
			pst.setString(4, loanInfo.getDoa());
			pst.setString(5, loanInfo.getBstructure());
			pst.setString(6, loanInfo.getBindicator());
			pst.setString(7, loanInfo.getTaxindicator());
			pst.setString(8, loanInfo.getAddress());
			pst.setString(9, loanInfo.getMobile());
			pst.setString(10, loanInfo.getEmail());
			pst.setString(11, "Pending");
	

			pst.executeUpdate();

		} catch (SQLException e) {
			throw e;
		}
		
		return "userhome.jsp";
	}

	private String application1(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/* write the code to display the loan application page */

		return "application.jsp";
	}

	private String editLoanProcess(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/* write the code to edit the loan info */
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userName = user.getUsername();
	
		try (Connection con = connDao.connect();
				
			PreparedStatement pst = con.prepareStatement("UPDATE loan SET loanName=?,loanAmount=?,loanAppDate=?,businessStructure=?,billingIndicator=?,taxIndicator=?,address=?,mobile=?,email=? where loanAppNo=?")) {

			pst.setString(1, request.getParameter("loanName"));
			pst.setString(2, request.getParameter("loanAmount"));
			pst.setString(3, request.getParameter("loanAppDate"));
			pst.setString(4, request.getParameter("businessStructure"));
			pst.setString(5, request.getParameter("billingIndicator"));
			pst.setString(6, request.getParameter("taxIndicator"));
			pst.setString(7, request.getParameter("address"));
			pst.setString(8, request.getParameter("mobile"));
			pst.setString(9, request.getParameter("email"));
			pst.setString(10, request.getParameter("loanAppNum"));

			pst.executeUpdate();

		} catch (SQLException e) {
			throw e;
		}
		
		request.setAttribute("msg", "Loan Updated Successfully");

		return "userhome.jsp";
	}

	private String registerUser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/* write the code to redirect page to read the user details */
		return "newuserui.jsp";
	}

	private String registernewuser(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/*
		 * write the code to create the new user account read from user and return to
		 * index page
		 */
		HttpSession session = request.getSession();
		String view = "";

		String userName = request.getParameter("usrName");
		String password = request.getParameter("password");

		if (userName == null) {
			view = "index.jsp";
		} else if (password == null) {
			request.setAttribute("err", "Password is not received!");
			view = "index.jsp";
		} else {
			User user = null;
			try (Connection con = connDao.connect();
					PreparedStatement pst = con.prepareStatement("INSERT INTO user VALUES (?,?,?)")) {

				pst.setString(1, userName);
				pst.setString(2, password);
				pst.setNString(3, "USER");

				pst.executeUpdate();

			} catch (SQLException e) {
				throw e;
			}
			session.setAttribute("user", user);

			view = "register.jsp";
		}
		
		return view;
	}

	private String register(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/* write the code to redirect to register page */

		return "register.jsp";
	}

	private String displaystatus(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/*
		 * write the code the display the loan status based on the given application
		 * number
		 */
		fetchDetails(request);
		return "editloan.jsp";
	}

	private String editloan(HttpServletRequest request, HttpServletResponse response)throws SQLException{
		// TODO Auto-generated method stub
		/* write a code to return to editloan page */
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userName = user.getUsername();
		fetchDetails(request);
		
		List<LoanInfo> editableLoan = new ArrayList<LoanInfo>();
		
		String loanNoToBeEdited = request.getParameter("loanNum");
		List editedLoanInfo = new ArrayList();
		try (Connection con = connDao.connect();
				PreparedStatement pst = con.prepareStatement("SELECT * FROM loan WHERE loanAppNo =?")) {
			pst.setString(1, loanNoToBeEdited);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
						
				LoanInfo loanInfo = new LoanInfo();
				loanInfo.setApplno(rs.getString(2));
				loanInfo.setPurpose(rs.getString(3));
				loanInfo.setAmtrequest(Integer.parseInt(rs.getString(4)));
				loanInfo.setDoa(rs.getString(5));
				loanInfo.setBstructure(rs.getString(6));
				loanInfo.setBindicator(rs.getString(7));
				loanInfo.setTaxindicator(rs.getString(8));
				loanInfo.setAddress(rs.getString(9));
				loanInfo.setMobile(rs.getString(10));
				loanInfo.setEmail(rs.getString(11));
				loanInfo.setStatus(rs.getString(12));
				
				editedLoanInfo.add(loanInfo);
				
				
			}
			request.setAttribute("editedLoanInfo", editedLoanInfo);

		} catch (SQLException e) {
			throw e;
		}
		
		
		return "editloanui.jsp";
	}
	
	private void fetchDetails(HttpServletRequest request) throws SQLException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String userName = user.getUsername();
		List<LoanInfo> loanList = new ArrayList<LoanInfo>();
		try (Connection con = connDao.connect();
				PreparedStatement pst = con.prepareStatement("SELECT * FROM loan WHERE userName=?")) {
			pst.setString(1, userName);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				LoanInfo loanInfo = new LoanInfo();
				loanInfo.setApplno(rs.getString(2));
				loanInfo.setPurpose(rs.getString(3));
				loanInfo.setAmtrequest(Integer.parseInt(rs.getString(4)));
				loanInfo.setDoa(rs.getString(5));
				loanInfo.setBstructure(rs.getString(6));
				loanInfo.setBindicator(rs.getString(7));
				loanInfo.setTaxindicator(rs.getString(8));
				loanInfo.setAddress(rs.getString(9));
				loanInfo.setMobile(rs.getString(10));
				loanInfo.setEmail(rs.getString(11));
				loanInfo.setStatus(rs.getString(12));
				loanList.add(loanInfo);
			}
			//request.setAttribute("loanList", loanList);
			session.setAttribute("loanList", loanList);
			
		} catch (SQLException e) {
			throw e;
		}
	}

	private String trackloan(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		fetchDetails(request);
		
		return "trackloan.jsp";
	}

	private String application(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/* write a code to return to trackloan page */
		return "trackloan.jsp";
	}
}