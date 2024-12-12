// import 'package:flutter/material.dart';

// class RegistrationScreen StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<RegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _numberController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();

//   String? _selectedLocation;
//   final List<String> _locations = ['Kathmandu', 'Jhapa', 'Dhangadi', 'Pokhara'];

//   void _register() {
//     if (_formKey.currentState!.validate()) {
//       String name = _nameController.text;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Registered $name successfully')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(35, 50, 60, 1.0),
//         title: Text("Registration Page",style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Spacer(),
//               // Placeholder for Logo
//               Center(
//                 child: Image.asset(
//                   './assets/logos/jagg.png', // Replace with your logo URL
//                   height: 180,
//                   width: 180,

//                   fit: BoxFit.contain,
//                 ),
//               ),
//               Spacer(flex: 2),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: InputDecoration(
//                         labelText: 'Full Name',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: _numberController,
//                       decoration: InputDecoration(
//                         labelText: 'Phone Number',
//                         border: OutlineInputBorder(),
//                       ),
//                       keyboardType: TextInputType.phone,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your phone number';
//                         }
//                           // else if (!RegExp(r'^\d{10}\$').hasMatch(value)) {
//                         //   return 'Enter a valid 10-digit phone number';
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     DropdownButtonFormField<String>(
//                       value: _selectedLocation,
//                       decoration: InputDecoration(
//                         labelText: 'Location',
//                         border: OutlineInputBorder(),
//                       ),
//                       items: _locations
//                           .map((location) => DropdownMenuItem(
//                         value: location,
//                         child: Text(location),
//                       ))
//                           .toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedLocation = value;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return 'Please select a location';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a password';
//                         } else if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: _confirmPasswordController,
//                       decoration: InputDecoration(
//                         labelText: 'Confirm Password',
//                         border: OutlineInputBorder(),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please confirm your password';
//                         } else if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 24),
//                     ElevatedButton(
//                       onPressed: _register,
//                       child: Text('Register'),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//               TextButton(
//                 onPressed: () {
//                   // Navigate to Login Page Logic
//                   Navigator.pop(context);
//                 },
//                 child: Text('Already have an account? Login'),
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SignupPage extends StatelessWidget {
//   const SignupPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple.shade50,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
//         backgroundColor: Colors.deepPurple,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Image.asset(
//               'assets/images/signup.jpg',
//               height: 300,
//               width: 500 // Adjust according to your logo
//             ),
//             const SizedBox(height: 30),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "First Name",
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 prefixIcon: const Icon(Icons.person, color: Colors.deepPurple),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 prefixIcon: const Icon(Icons.email, color: Colors.deepPurple),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {},
//               child: const Text(
//                 "Sign Up",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/signup.jpg',
              fit: BoxFit
                  .cover, // Ensures the image covers the entire background
            ),
          ),
          // Content (text fields and button) above the image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100), // Adjust this height as needed
                // First Name TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle:
                        TextStyle(color: Colors.white), // White label text
                    filled: true, // Fill the background
                    fillColor: Colors.white
                        .withOpacity(0.7), // Semi-transparent background
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.blue.shade700, width: 2), // Blue border
                    ),
                    prefixIcon: const Icon(Icons.person,
                        color: Colors.blue), // Blue icon
                  ),
                ),
                const SizedBox(height: 20),
                // Email TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue.shade700, width: 2),
                    ),
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 20),
                // Password TextField
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.blue.shade700, width: 2),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                // Sign Up Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class SignupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/signup.jpg'), // Replace with your provided signup background image
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
//                     'Create Account',
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
//                         prefixIcon: Icon(Icons.person, color: Colors.white),
//                         hintText: 'Enter your name',
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
//                     child: Text('Sign Up', style: TextStyle(fontSize: 18)),
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
