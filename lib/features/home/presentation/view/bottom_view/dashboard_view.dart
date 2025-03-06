// import 'package:flutter/material.dart';
// import 'package:futsal_booking/screens/court_detail_page.dart';

// class DashboardView extends StatefulWidget {
//   const DashboardView({Key? key}) : super(key: key);

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   final TextEditingController _searchController = TextEditingController();
//   final List<String> courtNames = [
//     'Manang Marshyangdi Futsal',
//     'Samakhushi Futsal',
//     'Monastery Futsal',
//     'Dhuku Futsal',
//   ];
//   final List<String> courtImages = [
//     'assets/images/Manangfutsal.jpg',
//     'assets/images/Samakhushifutsal.jpg',
//     'assets/images/monaestryfutsal.jpg',
//     'assets/images/dhukufutsal.jpg',
//   ];
//   List<String> filteredCourtNames = [];
//   List<String> filteredCourtImages = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredCourtNames = List.from(courtNames);
//     filteredCourtImages = List.from(courtImages);
//     _searchController.addListener(_filterCourts);
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _filterCourts() {
//     String query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredCourtNames = courtNames
//           .where((court) => court.toLowerCase().contains(query))
//           .toList();
//       filteredCourtImages = [];
//       for (var court in filteredCourtNames) {
//         int index = courtNames.indexOf(court);
//         if (index != -1) {
//           filteredCourtImages.add(courtImages[index]);
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             controller: _searchController,
//             decoration: InputDecoration(
//               hintText: 'Search courts...',
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: filteredCourtNames.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CourtDetailPage(
//                         courtName: filteredCourtNames[index],
//                         courtImage: filteredCourtImages[index],
//                       ),
//                     ),
//                   );
//                 },
//                 child: Card(
//                   margin: const EdgeInsets.only(bottom: 16),
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.vertical(
//                             top: Radius.circular(15)),
//                         child: Image.asset(
//                           filteredCourtImages[index],
//                           height: 200,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Text(
//                           filteredCourtNames[index],
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

//this is functionable
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:futsal_booking/features/home/presentation/view/bottom_view/Bookings_view.dart';
// import 'package:futsal_booking/features/home/presentation/view_model/dashboard_cubit.dart';

// class DashboardView extends StatefulWidget {
//   const DashboardView({Key? key}) : super(key: key);

//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }

// class _DashboardViewState extends State<DashboardView> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<DashboardCubit>().fetchDashboardData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Dashboard")),
//       body: BlocBuilder<DashboardCubit, DashboardState>(
//         builder: (context, state) {
//           if (state is DashboardLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is DashboardLoaded) {
//             final courts = state.courts;
//             return ListView.builder(
//               itemCount: courts.length,
//               itemBuilder: (context, index) {
//                 final court = courts[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => BookingView(
//                           court: court,
//                           userId: 'exampleUserId', // Replace with actual logged-in userId if available
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.all(12),
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.network(
//                           court.imageUrl,
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               const Icon(Icons.broken_image, size: 60),
//                         ),
//                       ),
//                       title: Text(court.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                       subtitle: Text('ID: ${court.id}'),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (state is DashboardError) {
//             return Center(child: Text("Error: ${state.message}"));
//           } else {
//             return const SizedBox.shrink();
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futsal_booking/features/home/presentation/view/bottom_view/Bookings_view.dart';
import 'package:futsal_booking/features/home/presentation/view_model/dashboard_cubit.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardCubit>().fetchDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a consistent title for the dashboard.
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardLoaded) {
            final courts = state.courts;
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: courts.length,
              itemBuilder: (context, index) {
                final court = courts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingView(
                          court: court,
                          userId: 'exampleUserId', // Replace with actual userId if available.
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    height: 200, // Large image height for better visibility.
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(court.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        // Dark overlay for better text contrast.
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                        // Court details at the bottom.
                        Positioned(
                          bottom: 16,
                          left: 16,
                          right: 16,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                court.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Court ID: ${court.id}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is DashboardError) {
            return Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
