package com.iiht.evaluation.eloan.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iiht.evaluation.eloan.dao.ConnectionDao;
import com.iiht.evaluation.eloan.dto.LoanDto;
import com.iiht.evaluation.eloan.model.ApprovedLoan;
import com.iiht.evaluation.eloan.model.LoanInfo;
import com.iiht.evaluation.eloan.model.User;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ConnectionDao connDao;
	private LoanInfo loanInfo;

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
//		System.out.println(action);
		String viewName = "";
		try {
			switch (action) {
			case "listall":
				viewName = listall(request, response);
				break;
			case "process":
				viewName = process(request, response);
				break;
			case "callemi":
				viewName = calemi(request, response);
				break;
			case "updatestatus":
				viewName = updatestatus(request, response);
				break;
			case "logout":
				viewName = adminLogout(request, response);
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

	private String updatestatus(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/* write the code for updatestatus of loan and return to admin home page */
		
		String appNo = request.getParameter("LoanNo");
		double amotsanctioned = Double.parseDouble(request.getParameter("TermPaymentAmount"));
		double loanterm = Double.parseDouble(request.getParameter("Term"));
		String psd = request.getParameter("StartDate");
		String lcd = request.getParameter("ClosureDate");
		double emi = Double.parseDouble(request.getParameter("EMI"));
			
		try (Connection con = connDao.connect();
				PreparedStatement pst = con.prepareStatement("INSERT INTO approvedloan VALUES(?,?,?,?,?,?,?)")) {
			pst.setString(1, appNo);
			pst.setDouble(2, amotsanctioned);
			pst.setDouble(3, loanterm);
			pst.setString(4, psd);
			pst.setString(5, lcd);
			pst.setDouble(6, emi);
			pst.setString(7, "Approved");
			pst.executeUpdate();
			
		} catch (SQLException e) {
			throw e;
		}
		
		try (Connection con = connDao.connect();
				PreparedStatement pst = con.prepareStatement("UPDATE loan SET status=? WHERE loanAppNo=?")) {
			pst.setString(1, "Approved");
			pst.setString(2, appNo);

			pst.executeUpdate();
			
		} catch (SQLException e) {
			throw e;
		}
		
		
		request.setAttribute("msg", "Loan is Approved");
		
		return "adminhome1.jsp";
	}

	private String calemi(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
		/* write the code to calculate emi for given applno and display the details */

		String LoanNo=request.getParameter("LoanNo");
		double term = Double.parseDouble(request.getParameter("Term"));
		double amount = Double.parseDouble(request.getParameter("LoanAmount"));
		String sdate = request.getParameter("StartDate");
		String cdate = request.getParameter("ClosureDate");
		
		double  TermPaymentAmount= ( amount* (1 + (0.15*(term/12))));
		double EMI = TermPaymentAmount/term;
		
		request.setAttribute("LoanNo", LoanNo);
		request.setAttribute("TermPaymentAmount", TermPaymentAmount);
		request.setAttribute("SanctionedAmount", amount);
		request.setAttribute("Term", term);
		request.setAttribute("EMI", EMI);
		request.setAttribute("StartDate", sdate);
		request.setAttribute("ClosureDate", cdate);

		return "calemi.jsp";
	}

	private String process(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		// TODO Auto-generated method stub
	/* return to process page */
		return  "process.jsp";
	}

	private String adminLogout(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		/* write code to return index page */
		return "index.jsp";
	}

	private String listall(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/* write the code to display all the loans */

		try (Connection con = connDao.connect(); PreparedStatement pst = con.prepareStatement("SELECT * FROM loan")) {
			ResultSet rs = pst.executeQuery();
			List<LoanInfo> loans = new ArrayList<LoanInfo>();

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
				loanInfo.setStatus(rs.getNString(12));

				loans.add(loanInfo);
			}

			request.setAttribute("loanList", loans);

		} catch (SQLException e) {
			throw e;
		}

		return "listall.jsp";
	}

}