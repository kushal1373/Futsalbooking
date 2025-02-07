import 'package:flutter/material.dart';
import 'package:futsal_booking/screens/court_detail_page.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> courtNames = [
    'Manang Marshyangdi Futsal',
    'Samakhushi Futsal',
    'Monastery Futsal',
    'Dhuku Futsal',
  ];
  final List<String> courtImages = [
    'assets/images/Manangfutsal.jpg',
    'assets/images/Samakhushifutsal.jpg',
    'assets/images/monaestryfutsal.jpg',
    'assets/images/dhukufutsal.jpg',
  ];
  List<String> filteredCourtNames = [];
  List<String> filteredCourtImages = [];

  @override
  void initState() {
    super.initState();
    filteredCourtNames = List.from(courtNames);
    filteredCourtImages = List.from(courtImages);
    _searchController.addListener(_filterCourts);
  }

  @override
  void dispose() {
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
    return Column(
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
        Expanded(
          child: ListView.builder(
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
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
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
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}