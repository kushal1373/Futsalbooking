// import 'package:flutter/material.dart';

// import 'court_detail_page.dart';

// class DashboardScreen extends StatefulWidget {
//   const DashboardScreen({Key? key}) : super(key: key);

//   @override
//   _DashboardScreenState createState() => _DashboardScreenState();
// }

// class _DashboardScreenState extends State<DashboardScreen> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Court Finder',
//           style: TextStyle(
//             fontFamily: 'Montserrat Regular',
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onPressed: _showFilterDialog,
//           ),
//         ],
//       ),
//       body: _buildBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
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

//   Widget _buildBody() {
//     switch (_currentIndex) {
//       case 0:
//         return _buildCourtsList();
//       case 1:
//         return _buildBookingsList();
//       case 2:
//         return _buildProfile();
//       default:
//         return _buildCourtsList();
//     }
//   }

//   Widget _buildCourtsList() {
//     List<String> courtNames = [
//       'Manang Marshyangdi Futsal',
//       'Samakhushi Futsal',
//       'Monaestry Futsal',
//       'Dhuku Futsal',
//       'Gongabu Futsal'
//     ];
//     List<String> courtImages = [
//       'assets/images/Manangfutsal.jpg',
//       'assets/images/Samakhushifutsal.jpg',
//       'assets/images/monaestryfutsal.jpg',
//       'assets/images/dhukufutsal.jpg',
//       'assets/images/signupimage.jpg',
//     ];

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: courtNames.length,
//       itemBuilder: (context, index) {
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CourtDetailPage(
//                   courtName: courtNames[index],
//                   courtImage: courtImages[index],
//                 ),
//               ),
//             );
//           },
//           child: Card(
//             margin: const EdgeInsets.only(bottom: 16),
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius:
//                       const BorderRadius.vertical(top: Radius.circular(15)),
//                   child: Image.asset(
//                     courtImages[index],
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(16),
//                   child: Text(
//                     courtNames[index],
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontFamily: 'Montserrat Bold',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildBookingsList() {
//     return const Center(child: Text("Bookings Screen"));
//   }

//   Widget _buildProfile() {
//     return const Center(child: Text("Profile Screen"));
//   }

//   void _showFilterDialog() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(20),
//           child: const Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Filters"),
//               // Additional filter options go here
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'court_detail_page.dart'; // Assume this is for court details navigation

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Court Finder',
          style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildCourtsList();
      case 1:
        return _buildBookingsList();
      case 2:
        return _buildProfile();
      default:
        return _buildCourtsList();
    }
  }

  Widget _buildCourtsList() {
    List<String> courtNames = [
      'Manang Marshyangdi Futsal',
      'Samakhushi Futsal',
      'Monaestry Futsal',
      'Dhuku Futsal',
      'Gongabu Futsal'
    ];
    List<String> courtImages = [
      'assets/images/Manangfutsal.jpg',
      'assets/images/Samakhushifutsal.jpg',
      'assets/images/monaestryfutsal.jpg',
      'assets/images/dhukufutsal.jpg',
      'assets/images/signupimage.jpg',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courtNames.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourtDetailPage(
                  courtName: courtNames[index],
                  courtImage: courtImages[index],
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: Image.asset(
                    courtImages[index],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    courtNames[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat Bold',
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBookingsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Manang Marshyangdi Futsal",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat Bold',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Date: 2023-12-20",
                  style: TextStyle(
                    fontFamily: 'Montserrat Regular',
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Time: 6:00 PM - 7:00 PM",
                  style: TextStyle(
                    fontFamily: 'Montserrat Regular',
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage:
                    AssetImage('assets/images/profile_placeholder.jpg'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Kushal Thapa",
                    style: TextStyle(
                      fontFamily: 'Montserrat Regular',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: 'Montserrat Bold',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "kushalthapa1373@gmail.com",
                    style: TextStyle(
                      fontFamily: 'Montserrat Regular',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/login'));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(
                fontFamily: 'Montserrat Bold',
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Filters"),
              // Additional filter options go here
            ],
          ),
        );
      },
    );
  }
}
