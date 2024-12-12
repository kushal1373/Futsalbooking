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
//   }
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
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          ),
          // Content inside the screen
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stack to position logo and apply blur effect above the logo
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Apply a blur effect above the logo
                    Positioned(
                      top:
                          -50, // This will make the blur area extend above the logo
                      left: 0,
                      right: 0,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10.0, sigmaY: 10.0), // Apply blur
                        child: Container(
                          height:
                              200, // This will determine how much of the area gets blurred above the logo
                          width: 220, // Same width as logo
                          color: Colors
                              .transparent, // Transparent container to create the blur effect
                        ),
                      ),
                    ),
                    // Logo Image in the center of the blur area
                    Image.asset(
                      'assets/images/logo.jpg',
                      height: 100, // Adjust logo size
                      width: 200, // Adjust logo width
                    ),
                  ],
                ),
                const SizedBox(height: 40), // Space between logo and text

                // Welcome Text with improved font size and contrast
                const Text(
                  "Welcome to Futsal Booking",
                  style: TextStyle(
                    fontSize: 32, // Larger font size for visibility
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white, // White color for readability on background
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6.0,
                        color: Color(0x80000000), // Black with 50% opacity
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                    height: 30), // Space between welcome text and description

                // Description Text with better contrast and background
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                        0.5), // Semi-transparent background for text
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Book your futsal matches seamlessly and manage your schedule effortlessly.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white, // Text color adjusted for contrast
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60), // Space before button

                // Get Started Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple, // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                    style: TextStyle(fontSize: 20, color: Colors.white),
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
