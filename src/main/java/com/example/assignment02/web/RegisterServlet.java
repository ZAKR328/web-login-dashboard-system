package com.example.assignment02.web;

import com.example.assignment02.dao.UserDao;
import com.example.assignment02.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDao userDao = new UserDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User existingUser = userDao.getUserByEmail(email);
        if (existingUser != null) {
            response.sendRedirect("index.html?error=Email+already+exists");
        } else {
            User newUser = new User();
            newUser.setName(name);
            newUser.setEmail(email);
            newUser.setPassword(password);
            userDao.saveUser(newUser);
            response.sendRedirect("index.html?success=Account+created+successfully");
        }
    }
}