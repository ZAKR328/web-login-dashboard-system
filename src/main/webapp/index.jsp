<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Signup</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f8fafc;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1e293b;
        }
        .container {
            display: flex;
            background: white;
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgba(0,0,0,0.1);
            overflow: hidden;
            max-width: 1000px;
            width: 90%;
            min-height: 600px;
        }
        .form-section {
            flex: 1;
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .image-section {
            flex: 1;
            background: #0f172a;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
            padding: 40px;
        }
        .image-content h2 { font-size: 2.5rem; margin-bottom: 20px; }
        .image-content p { font-size: 1.1rem; opacity: 0.8; color: #cbd5e1; }
        .form-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            color: #0f172a;
            text-align: center;
        }
        .form-subtitle {
            color: #64748b;
            text-align: center;
            margin-bottom: 40px;
        }
        .form-group { position: relative; margin-bottom: 24px; }
        .form-group i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }
        .form-control {
            width: 100%;
            padding: 16px 20px 16px 48px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            outline: none;
        }
        .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59,130,246,0.1);
        }
        .btn-primary {
            width: 100%;
            background: #3b82f6;
            color: white;
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-primary:hover { background: #2563eb; }
        .form-switch {
            text-align: center;
            margin-top: 24px;
            color: #64748b;
        }
        .form-switch a { color: #3b82f6; text-decoration: none; font-weight: 600; }
        .form-container { display: none; }
        .form-container.active { display: block; }
        .alert {
            padding: 12px 16px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 500;
            text-align: center;
        }
        .alert-error { background: #fef2f2; color: #ef4444; border: 1px solid #fecaca; }
        .alert-success { background: #f0fdfa; color: #10b981; border: 1px solid #a7f3d0; }
        .forgot-password { text-align: right; margin-top: 8px; }
        .forgot-password a { color: #3b82f6; text-decoration: none; font-size: 0.9rem; }
        .checkbox-group {
            display: flex;
            align-items: flex-start;
            margin-bottom: 24px;
            font-size: 0.9rem;
            color: #64748b;
        }
        .checkbox-group input { margin-right: 10px; margin-top: 3px; }

        /* Social Login CSS */
        .social-login { margin-top: 24px; }
        .social-title {
            text-align: center;
            color: #64748b;
            margin-bottom: 16px;
            position: relative;
            font-weight: 500;
            font-size: 0.9rem;
        }
        .social-title::before,
        .social-title::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 30%;
            height: 1px;
            background: #e2e8f0;
        }
        .social-title::before { left: 0; }
        .social-title::after { right: 0; }
        .social-buttons { display: flex; gap: 12px; }
        .social-btn {
            flex: 1;
            padding: 14px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            background: white;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }
        .social-btn:hover {
            border-color: #cbd5e1;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        }
        .social-btn.google { color: #ea4335; }
        .social-btn.facebook { color: #1877f2; }
        .social-btn.twitter { color: #1da1f2; }

        /* Forgot Password CSS */
        .forgot-form-group { position: relative; margin-bottom: 24px; }
        .forgot-form-group i {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">

        <!-- Login Form -->
        <div class="form-container active" id="loginForm">
            <h1 class="form-title">Welcome Back</h1>
            <p class="form-subtitle">Sign in to your account to continue</p>

            <%
                String error = request.getParameter("error");
                String success = request.getParameter("success");
            %>
            <% if (error != null) { %>
            <div class="alert alert-error"><%= error %></div>
            <% } %>
            <% if (success != null) { %>
            <div class="alert alert-success"><%= success %></div>
            <% } %>

            <form action="login" method="post">
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="forgot-password">
                    <a href="#" onclick="showForgotPassword()">Forgot Password?</a>
                </div>
                <button type="submit" class="btn-primary">Sign In</button>
            </form>

            <!-- Social Login -->
            <div class="social-login">
                <div class="social-title">Or continue with</div>
                <div class="social-buttons">
                    <div class="social-btn google">
                        <i class="fab fa-google"></i>
                    </div>
                    <div class="social-btn facebook">
                        <i class="fab fa-facebook-f"></i>
                    </div>
                    <div class="social-btn twitter">
                        <i class="fab fa-twitter"></i>
                    </div>
                </div>
            </div>

            <div class="form-switch">
                Don't have an account? <a href="#" onclick="showSignup()">Create one</a>
            </div>
        </div>

        <!-- Signup Form -->
        <div class="form-container" id="signupForm">
            <h1 class="form-title">Create Account</h1>
            <p class="form-subtitle">Join us and start your journey today</p>

            <form action="register" method="post">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                    <i class="fas fa-user"></i>
                </div>
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="form-group">
                    <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                    <i class="fas fa-lock"></i>
                </div>
                <div class="checkbox-group">
                    <input type="checkbox" id="terms" required>
                    <label for="terms">I agree to the Terms of Service and Privacy Policy</label>
                </div>
                <button type="submit" class="btn-primary">Create Account</button>
            </form>

            <!-- Social Login -->
            <div class="social-login">
                <div class="social-title">Or sign up with</div>
                <div class="social-buttons">
                    <div class="social-btn google">
                        <i class="fab fa-google"></i>
                    </div>
                    <div class="social-btn facebook">
                        <i class="fab fa-facebook-f"></i>
                    </div>
                    <div class="social-btn twitter">
                        <i class="fab fa-twitter"></i>
                    </div>
                </div>
            </div>

            <div class="form-switch">
                Already have an account? <a href="#" onclick="showLogin()">Sign in</a>
            </div>
        </div>

        <!-- Forgot Password Form -->
        <div class="form-container" id="forgotForm">
            <h1 class="form-title">Reset Password</h1>
            <p class="form-subtitle">Enter your email and we'll send reset instructions</p>

            <form action="forgot-password" method="post">
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>
                <button type="submit" class="btn-primary">
                    Send Reset Instructions
                </button>
            </form>

            <div class="form-switch">
                Remember your password? <a href="#" onclick="showLogin()">Sign in</a>
            </div>
        </div>

    </div>

    <div class="image-section">
        <div class="image-content" id="imageContent">
            <h2>Hello, Friend!</h2>
            <p>Enter your personal details and start your journey with us today</p>
        </div>
    </div>
</div>

<script>
    function showSignup() {
        document.getElementById('loginForm').classList.remove('active');
        document.getElementById('signupForm').classList.add('active');
        document.getElementById('forgotForm').classList.remove('active');
        document.getElementById('imageContent').innerHTML = `
            <h2>Welcome Back!</h2>
            <p>To keep connected with us please login with your personal info</p>
        `;
    }
    function showLogin() {
        document.getElementById('loginForm').classList.add('active');
        document.getElementById('signupForm').classList.remove('active');
        document.getElementById('forgotForm').classList.remove('active');
        document.getElementById('imageContent').innerHTML = `
            <h2>Hello, Friend!</h2>
            <p>Enter your personal details and start your journey with us today</p>
        `;
    }
    function showForgotPassword() {
        document.getElementById('loginForm').classList.remove('active');
        document.getElementById('signupForm').classList.remove('active');
        document.getElementById('forgotForm').classList.add('active');
        document.getElementById('imageContent').innerHTML = `
            <h2>Don't Worry!</h2>
            <p>We'll help you reset your password and get back to your account safely</p>
        `;
    }
</script>
</body>
</html>