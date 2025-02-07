import 'package:flutter/material.dart';

class ArenaView extends StatelessWidget {
  const ArenaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.sports_soccer, color: Colors.teal),
          title: Text("Manang Marshyangdi Arena"),
          subtitle: Text("Location: Kathmandu"),
        ),
        ListTile(
          leading: Icon(Icons.sports_soccer, color: Colors.teal),
          title: Text("Chyasal Futsal Arena"),
          subtitle: Text("Location: Bhaktapur"),
        ),
      ],
    );
  }
}
