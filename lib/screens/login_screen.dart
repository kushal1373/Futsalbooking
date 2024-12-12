import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'dashboard_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login.jpg', // Your futsal arena image
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          // Content on top of the image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Welcome Text
                  const Text(
                    "Welcome to our Login Page",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  // Futsal Quote Section
                  const SizedBox(height: 50), // Adjust for better position
                  Text(
                    '"Futsal is the foundation of football, where skill is built and perfected."',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40), // Space after the quote

                  // Email TextField with improved styling
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      prefixIcon:
                          const Icon(Icons.email, color: Colors.deepPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.deepPurple.shade200,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password TextField with improved styling
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter your password",
                      prefixIcon:
                          const Icon(Icons.lock, color: Colors.deepPurple),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.deepPurple.shade200,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),

                  // Login Button with a shadow effect
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                      shadowColor: Colors.deepPurple.shade300,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Forgot Password Link
                  TextButton(
                    onPressed: () {
                      // Add your forgot password logic here
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Sign up Link
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class LoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/login.jpg'), // Replace with your provided login background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Welcome Back!',
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextField(
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.email, color: Colors.white),
//                         hintText: 'Enter your email',
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.black.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                     child: TextField(
//                       obscureText: true,
//                       style: TextStyle(color: Colors.white),
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.lock, color: Colors.white),
//                         hintText: 'Enter your password',
//                         hintStyle: TextStyle(color: Colors.white70),
//                         filled: true,
//                         fillColor: Colors.black.withOpacity(0.5),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.purple,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 100, vertical: 15),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                     ),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/dashboard');
//                     },
//                     child: Text('Login', style: TextStyle(fontSize: 18)),
//                   ),
//                   SizedBox(height: 15),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/signup');
//                     },
//                     child: Text('Don\'t have an account? Sign up',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
