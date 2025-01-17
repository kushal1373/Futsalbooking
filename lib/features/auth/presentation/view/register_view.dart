// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
// // import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_event.dart';

// // class RegisterView extends StatefulWidget {
// //   const RegisterView({super.key});

// //   @override
// //   State<RegisterView> createState() => _RegisterViewState();
// // }

// // class _RegisterViewState extends State<RegisterView> {
// //   final _gap = const SizedBox(height: 8);
// //   final _key = GlobalKey<FormState>();
// //   final _fnameController = TextEditingController(text: 'kushal');
// //   final _lnameController = TextEditingController(text: 'thapa');
// //   final _phoneController = TextEditingController(text: '123456789');
// //   final _usernameController = TextEditingController(text: 'kushal');
// //   final _passwordController = TextEditingController(text: 'kushalthapa1373');

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: BlocBuilder<RegisterBloc, RegisterState>(
// //           builder: (context, state) {
// //             return Text('Register Student');
// //           },
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Stack(
// //         children: [
// //           // Background image that fills the entire screen
// //           Container(
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 image: AssetImage(
// //                     'assets/images/registration.jpg'), // Replace with your image path
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //           ),
// //           SafeArea(
// //             child: SingleChildScrollView(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(8),
// //                 child: Form(
// //                   key: _key,
// //                   child: Column(
// //                     children: [
// //                       InkWell(
// //                         onTap: () {
// //                           showModalBottomSheet(
// //                             backgroundColor: Colors.grey[300],
// //                             context: context,
// //                             isScrollControlled: true,
// //                             shape: const RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.vertical(
// //                                 top: Radius.circular(20),
// //                               ),
// //                             ),
// //                             builder: (context) => Padding(
// //                               padding: const EdgeInsets.all(20),
// //                               child: Row(
// //                                 mainAxisAlignment:
// //                                     MainAxisAlignment.spaceAround,
// //                                 children: [
// //                                   ElevatedButton.icon(
// //                                     onPressed: () {
// //                                       Navigator.pop(context);
// //                                       // Upload image if not null
// //                                     },
// //                                     icon: const Icon(Icons.camera),
// //                                     label: const Text('Camera'),
// //                                   ),
// //                                   ElevatedButton.icon(
// //                                     onPressed: () {},
// //                                     icon: const Icon(Icons.image),
// //                                     label: const Text('Gallery'),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                         child: SizedBox(
// //                           height: 200,
// //                           width: 200,
// //                           child: CircleAvatar(
// //                             radius: 50,
// //                             backgroundImage:
// //                                 const AssetImage('assets/images/profile.png')
// //                                     as ImageProvider,
// //                           ),
// //                         ),
// //                       ),
// //                       const SizedBox(height: 25),
// //                       buildTextField(
// //                         controller: _fnameController,
// //                         labelText: 'First Name',
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter first name';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       _gap,
// //                       buildTextField(
// //                         controller: _lnameController,
// //                         labelText: 'Last Name',
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter last name';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       _gap,
// //                       buildTextField(
// //                         controller: _phoneController,
// //                         labelText: 'Phone No',
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter phoneNo';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       _gap,
// //                       buildTextField(
// //                         controller: _passwordController,
// //                         labelText: 'Password',
// //                         obscureText: true,
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter password';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       _gap,
// //                       SizedBox(
// //                         width: double.infinity,
// //                         child: ElevatedButton(
// //                           onPressed: () {
// //                             if (_key.currentState!.validate()) {
// //                               context.read<RegisterBloc>().add(
// //                                     RegisterStudent(
// //                                       context: context,
// //                                       fName: _fnameController.text,
// //                                       lName: _lnameController.text,
// //                                       phone: _phoneController.text,
// //                                       username: _usernameController.text,
// //                                       password: _passwordController.text,
// //                                     ),
// //                                   );
// //                             }
// //                           },
// //                           child: const Text('Register'),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //     String? Function(String?)? validator,
// //     bool obscureText = false,
// //   }) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.black.withOpacity(0.6), // Semi-transparent background
// //         borderRadius: BorderRadius.circular(10),
// //       ),
// //       padding: const EdgeInsets.symmetric(horizontal: 10),
// //       child: TextFormField(
// //         controller: controller,
// //         obscureText: obscureText,
// //         decoration: InputDecoration(
// //           labelText: labelText,
// //           labelStyle: const TextStyle(color: Colors.white),
// //           border: InputBorder.none,
// //         ),
// //         style: const TextStyle(color: Colors.white),
// //         validator: validator,
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_event.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 8);
//   final _key = GlobalKey<FormState>();
//   final _fnameController = TextEditingController(text: 'kushal');
//   final _lnameController = TextEditingController(text: 'thapa');
//   final _phoneController = TextEditingController(text: '123456789');
//   final _usernameController = TextEditingController(text: 'kushal');
//   final _passwordController = TextEditingController(text: 'kushalthapa1373');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: BlocBuilder<RegisterBloc, RegisterState>(
//           builder: (context, state) {
//             return const Text('Register Student');
//           },
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // Background image that fills the entire screen
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/registration.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Form(
//                   key: _key,
//                   child: Column(
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           showModalBottomSheet(
//                             backgroundColor: Colors.grey[300],
//                             context: context,
//                             isScrollControlled: true,
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(20),
//                               ),
//                             ),
//                             builder: (context) => Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   ElevatedButton.icon(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     icon: const Icon(Icons.camera),
//                                     label: const Text('Camera'),
//                                   ),
//                                   ElevatedButton.icon(
//                                     onPressed: () {},
//                                     icon: const Icon(Icons.image),
//                                     label: const Text('Gallery'),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                         child: SizedBox(
//                           height: 200,
//                           width: 200,
//                           child: CircleAvatar(
//                             radius: 50,
//                             backgroundImage:
//                                 const AssetImage('assets/images/profile.png')
//                                     as ImageProvider,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 25),
//                       buildTextField(
//                         controller: _fnameController,
//                         labelText: 'First Name',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter first name';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _lnameController,
//                         labelText: 'Last Name',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter last name';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _phoneController,
//                         labelText: 'Phone No',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _usernameController,
//                         labelText: 'Username',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter username';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _passwordController,
//                         labelText: 'Password',
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             if (_key.currentState!.validate()) {
//                               context.read<RegisterBloc>().add(
//                                     RegisterStudent(
//                                       context: context,
//                                       fName: _fnameController.text,
//                                       lName: _lnameController.text,
//                                       phone: _phoneController.text,
//                                       username: _usernameController.text,
//                                       password: _passwordController.text,
//                                     ),
//                                   );
//                               // Navigate back to login page upon successful registration
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Registration successful! Please log in.'),
//                                   backgroundColor: Colors.green,
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             }
//                           },
//                           child: const Text('Register'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     String? Function(String?)? validator,
//     bool obscureText = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(0.6),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           labelText: labelText,
//           labelStyle: const TextStyle(color: Colors.white),
//           border: InputBorder.none,
//         ),
//         style: const TextStyle(color: Colors.white),
//         validator: validator,
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_bloc.dart';
// import 'package:futsal_booking/features/auth/presentation/view_model/signup/register_event.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final _gap = const SizedBox(height: 16);
//   final _key = GlobalKey<FormState>();
//   final _fnameController = TextEditingController(text: 'kushal');
//   final _lnameController = TextEditingController(text: 'thapa');
//   final _phoneController = TextEditingController(text: '123456789');
//   final _usernameController = TextEditingController(text: 'kushal');
//   final _passwordController = TextEditingController(text: 'kushal1373');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text(
//           'Register',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // White background for a professional look
//           Container(
//             color: Colors.white,
//           ),
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                 child: Form(
//                   key: _key,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Create Your Account",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.teal,
//                         ),
//                       ),
//                       const SizedBox(height: 24),
//                       buildTextField(
//                         controller: _fnameController,
//                         labelText: 'First Name',
//                         icon: Icons.person,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter first name';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _lnameController,
//                         labelText: 'Last Name',
//                         icon: Icons.person_outline,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter last name';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _phoneController,
//                         labelText: 'Phone Number',
//                         icon: Icons.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _usernameController,
//                         labelText: 'Username',
//                         icon: Icons.account_circle,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter username';
//                           }
//                           return null;
//                         },
//                       ),
//                       _gap,
//                       buildTextField(
//                         controller: _passwordController,
//                         labelText: 'Password',
//                         icon: Icons.lock,
//                         obscureText: true,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter password';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 32),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             if (_key.currentState!.validate()) {
//                               context.read<RegisterBloc>().add(
//                                     RegisterStudent(
//                                       context: context,
//                                       fName: _fnameController.text,
//                                       lName: _lnameController.text,
//                                       phone: _phoneController.text,
//                                       username: _usernameController.text,
//                                       password: _passwordController.text,
//                                     ),
//                                   );
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(
//                                   content: Text(
//                                       'Registration successful! Please log in.'),
//                                   backgroundColor: Colors.green,
//                                 ),
//                               );
//                               Navigator.pop(context);
//                             }
//                           },
//                           child: const Text(
//                             'Register',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required IconData icon,
//     String? Function(String?)? validator,
//     bool obscureText = false,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.teal),
//         labelText: labelText,
//         labelStyle: const TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.bold,
//         ),
//         filled: true,
//         fillColor: Colors.grey[200],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.teal, width: 2),
//         ),
//       ),
//       style: const TextStyle(color: Colors.black),
//       validator: validator,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _gap = const SizedBox(height: 16);
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: '');
  final _lnameController = TextEditingController(text: '');
  final _phoneController = TextEditingController(text: '');
  final _usernameController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    Hive.openBox('users'); // Open Hive box for users
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Register',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // White background for a professional look
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 24),
                      buildTextField(
                        controller: _fnameController,
                        labelText: 'First Name',
                        icon: Icons.person,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _lnameController,
                        labelText: 'Last Name',
                        icon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _phoneController,
                        labelText: 'Phone Number',
                        icon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter phone number';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _usernameController,
                        labelText: 'Username',
                        icon: Icons.account_circle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      _gap,
                      buildTextField(
                        controller: _passwordController,
                        labelText: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () async {
                            if (_key.currentState!.validate()) {
                              final box = Hive.box('users');

                              if (box.containsKey(_usernameController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Username already exists!'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              await box.put(
                                _usernameController.text,
                                {
                                  'firstName': _fnameController.text,
                                  'lastName': _lnameController.text,
                                  'phone': _phoneController.text,
                                  'password': _passwordController.text,
                                },
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Registration successful! Please log in.'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    String? Function(String?)? validator,
    bool obscureText = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.teal),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      validator: validator,
    );
  }
}
