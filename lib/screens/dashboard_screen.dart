import 'package:flutter/material.dart';

import 'court_detail_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();
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
  List<String> filteredCourtNames = [];
  List<String> filteredCourtImages = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered lists with all courts
    filteredCourtNames = List.from(courtNames);
    filteredCourtImages = List.from(courtImages);
    // Add listener to search controller
    _searchController.addListener(_filterCourts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterCourts);
    _searchController.dispose();
    super.dispose();
  }

  void _filterCourts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredCourtNames = courtNames
          .where((court) => court.toLowerCase().contains(query))
          .toList();
      filteredCourtImages = [];
      for (var court in filteredCourtNames) {
        int index = courtNames.indexOf(court);
        if (index != -1) {
          filteredCourtImages.add(courtImages[index]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Futsal Court Finder',
          style: TextStyle(
            fontFamily: 'Montserrat Regular',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courts...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(child: _buildBody()),
        ],
      ),
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
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredCourtNames.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourtDetailPage(
                  courtName: filteredCourtNames[index],
                  courtImage: filteredCourtImages[index],
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
                    filteredCourtImages[index],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    filteredCourtNames[index],
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
    return const Center(child: Text("Bookings Screen"));
  }

  Widget _buildProfile() {
    return const Center(child: Text("Profile Screen"));
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
