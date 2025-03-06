// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:futsal_booking/features/home/presentation/view_model/dashboard_cubit.dart';
// // import 'court_detail_page.dart';

// // class DashboardScreen extends StatefulWidget {
// //   const DashboardScreen({Key? key}) : super(key: key);

// //   @override
// //   State<DashboardScreen> createState() => _DashboardScreenState();
// // }

// // class _DashboardScreenState extends State<DashboardScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Fetch data from API
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       context.read<DashboardCubit>().fetchDashboardData();
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Futsal Court Finder"),
// //         backgroundColor: Colors.deepPurple,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.filter_list, color: Colors.white),
// //             onPressed: _showFilterDialog,
// //           ),
// //         ],
// //       ),
// //       body: BlocBuilder<DashboardCubit, DashboardState>(
// //         builder: (context, state) {
// //           if (state is DashboardLoading) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (state is DashboardLoaded) {
// //             final courts = state.courts; // List<CourtModel> from API

// //             return ListView.builder(
// //               itemCount: courts.length,
// //               itemBuilder: (context, index) {
// //                 final court = courts[index];
// //                 return GestureDetector(
// //                   onTap: () {
// //                     // Navigate to CourtDetailPage with data
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => CourtDetailPage(
// //                           courtName: court.name,
// //                           courtImage: court.imageUrl, // API-based image
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                   child: Card(
// //                     margin: const EdgeInsets.all(12),
// //                     elevation: 4,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(15),
// //                     ),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Show the image from the server
// //                         ClipRRect(
// //                           borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
// //                           child: Image.network(
// //                             court.imageUrl,
// //                             height: 200,
// //                             width: double.infinity,
// //                             fit: BoxFit.cover,
// //                             errorBuilder: (context, error, stackTrace) {
// //                               return const SizedBox(
// //                                 height: 200,
// //                                 child: Center(child: Icon(Icons.error)),
// //                               );
// //                             },
// //                           ),
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.all(16),
// //                           child: Text(
// //                             court.name,
// //                             style: const TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 );
// //               },
// //             );
// //           } else if (state is DashboardError) {
// //             return Center(child: Text("Error: ${state.message}"));
// //           } else {
// //             return const Center(child: Text("Something went wrong!"));
// //           }
// //         },
// //       ),
// //       bottomNavigationBar: BottomNavigationBar(
// //         currentIndex: 0,
// //         onTap: (index) {
// //           // Handle bottom nav
// //         },
// //         selectedItemColor: Colors.deepPurple,
// //         unselectedItemColor: Colors.grey,
// //         items: const [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.search),
// //             label: 'Search',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.calendar_today),
// //             label: 'Bookings',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person),
// //             label: 'Profile',
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _showFilterDialog() {
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (context) {
// //         return Container(
// //           padding: const EdgeInsets.all(20),
// //           child: const Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Text("Filters"),
// //               // Additional filter options go here
// //             ],
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/home/presentation/view_model/dashboard_cubit.dart';
// import 'court_detail_page.dart'; // Make sure this is your updated detail page with booking functionality

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);

//   @override
//   State<DashboardScreen> createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Fetch API data after first frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<DashboardCubit>().fetchDashboardData();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Futsal Court Finder',
//           style: TextStyle(
//             fontFamily: 'Montserrat Regular',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onPressed: _showFilterDialog,
//           ),
//         ],
//       ),
//       body: BlocBuilder<DashboardCubit, DashboardState>(
//         builder: (context, state) {
//           if (state is DashboardLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is DashboardLoaded) {
//             final courts = state.courts; // List of CourtEntity/CourtModel
//             return ListView.builder(
//               itemCount: courts.length,
//               itemBuilder: (context, index) {
//                 final court = courts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to detail page with court info
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CourtDetailPage(
//                           courtName: court.name,
//                           courtImage: court.imageUrl,
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Image fills the card width, fixed height, using BoxFit.cover
//                         ClipRRect(
//                           borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
//                           child: Image.network(
//                             court.imageUrl,
//                             height: 200,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) {
//                               return const SizedBox(
//                                 height: 200,
//                                 child: Center(child: Icon(Icons.error)),
//                               );
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Text(
//                             court.name,
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontFamily: 'Montserrat Bold',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is DashboardError) {
//             return Center(child: Text("Error: ${state.message}"));
//           } else {
//             return const Center(child: Text("Something went wrong!"));
//           }
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         onTap: (index) {
//           // Handle bottom navigation if needed.
//         },
//         selectedItemColor: Colors.deepPurple,
//         unselectedItemColor: Colors.grey,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_today),
//             label: 'Bookings',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   void _showFilterDialog() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(20),
//         child: const Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text("Filters"),
//             // Additional filter options
//           ],
//         ),
//       ),
//     );
//   }
// }
