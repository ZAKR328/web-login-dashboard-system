package com.example.assignment02.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.assignment02.dao.UserDao;
import com.example.assignment02.model.User;

@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;
    public void init() { userDao = new UserDao(); }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { doGet(request, response); }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action) {
                case "/new": showNewForm(request, response); break;
                case "/insert": insertUser(request, response); break;
                case "/delete": deleteUser(request, response); break;
                case "/edit": showEditForm(request, response); break;
                case "/update": updateUser(request, response); break;
                default:
                    response.sendRedirect("index.jsp");
                    break;
            }
        } catch (SQLException ex) { throw new ServletException(ex); }
    }
    private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<User> listUser = userDao.getAllUser();
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("user-list.jsp").forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user-form.jsp").forward(request, response);
    }
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDao.getUser(id);
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("user-form.jsp").forward(request, response);
    }
    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User newUser = new User();
        newUser.setName(request.getParameter("name"));
        newUser.setEmail(request.getParameter("email"));
        newUser.setCountry(request.getParameter("country"));
        userDao.saveUser(newUser);
        response.sendRedirect("index.jsp");
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User user = new User();
        user.setId(Integer.parseInt(request.getParameter("id")));
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setCountry(request.getParameter("country"));
        userDao.updateUser(user);
        response.sendRedirect("index.jsp");
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        userDao.deleteUser(Integer.parseInt(request.getParameter("id")));
        response.sendRedirect("index.jsp");
    }
}