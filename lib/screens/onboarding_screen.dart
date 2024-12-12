// import 'package:flutter/material.dart';
// import 'package:futsal_booking/screens/login_screen.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.deepPurple.shade50,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/logo.jpg',
//               height: 100,
//               width: 200, // Adjust according to your logo
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               "Welcome to Futsal Booking",
//               style: TextStyle(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.deepPurple,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 0),
//             Image.asset(
//               'assets/images/onboarding.jpg', // Add your onboarding image here
//               height: 300,
//             ),
//             const SizedBox(height: 30),
//             Text(
//               "Book your futsal matches seamlessly and manage your schedule effortlessly.",
//               style: TextStyle(fontSize: 16, color: Colors.deepPurple.shade400),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginPage()),
//                 );
//               },
//               child: const Text(
//                 "Get Started",
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:futsal_booking/screens/login_screen.dart';
import 'dart:ui'; // Required for BackdropFilter

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Onboarding image as the background
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Content inside the screen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stack to position logo and apply blur effect around the logo area
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Apply a blur effect to a larger area around the logo
                    Positioned(
                      top: -100, // Adjusted to blur the area around the logo
                      left: 0,
                      right: 0,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 12, sigmaY: 12), // Stronger blur effect
                        child: Container(
                          height:
                              240, // Adjusted height for larger blurred area
                          width: 240, // Adjusted width for the blurred area
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(
                                120), // Circular blur around the logo
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Logo Image in the center of the blurred area
                    Image.asset(
                      'assets/images/logo.jpg',
                      height: 120, // Adjust logo size
                      width: 120, // Adjust logo width
                    ),
                  ],
                ),
                const SizedBox(height: 40), // Space between logo and text

                // Welcome Text with gradient effect
                ShaderMask(
                  shaderCallback: (bounds) {
                    return const LinearGradient(
                      colors: [Colors.deepPurple, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "Welcome to Futsal Booking",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 6.0,
                          color: Color(0x80000000),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),

                // Description Text with semi-transparent background and soft shadow
                AnimatedOpacity(
                  duration: const Duration(seconds: 10),
                  opacity: 1.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Text(
                      "Book your futsal matches seamlessly and manage your schedule effortlessly.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 60),

                // Get Started Button with glassmorphism
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                     'assets/onboarding.jpg'), // Replace with your provided onboarding background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Welcome to Futsal Booking',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.purple,
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/login');
//                   },
//                   child: Text('Get Started', style: TextStyle(fontSize: 18)),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
