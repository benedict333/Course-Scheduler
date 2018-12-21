package com.servlet;

import java.io.IOException;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.Address;
import com.user.Course;
import com.user.Student;
import com.user.WeekDay;

/**
 * Servlet implementation class SchedulerServlet
 */
@WebServlet("/SchedulerServlet")
public class SchedulerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SchedulerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		ArrayList<Course> courses = (ArrayList<Course>)session.getAttribute("courses");
		if (courses ==null)
		{
		courses=new ArrayList<Course>();
		}
		Course course= new Course();
		course.setCourseName(request.getParameter("courseName"));
		course.setProfessor(request.getParameter("professor"));
		course.setTime(request.getParameter("time"));
		course.setRoomNumber(request.getParameter("roomNumber"));
		course.setStartDate(request.getParameter("startDate"));
		String[]weekDay = request.getParameterValues("weekday");//for an array we use 'getparameterValues' for normal object use 'getparameter'		
		ArrayList<WeekDay>	weekDayEnum = new ArrayList<WeekDay>();     
       
        for(int i=0;i<weekDay.length;i++)
        {
        	weekDayEnum.add(WeekDay.valueOf(weekDay[i]));
        	
        }      
            
         course.setWeekDay(weekDayEnum);
        courses.add(course);
         
         session.setAttribute("courses", courses);		
         
		RequestDispatcher rs= request.getRequestDispatcher("course.jsp");
		rs.forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
