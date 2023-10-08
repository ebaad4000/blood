import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DonorListScreen extends StatefulWidget {
  final donorsGroup;
  const DonorListScreen({super.key, required this.donorsGroup});

  @override
  _DonorListScreenState createState() => _DonorListScreenState();
}

class _DonorListScreenState extends State<DonorListScreen> {
  
  Future<List<String>>fetchBloodGroupDonors(bloodGroup) async {
    var data = await FirebaseFirestore.instance
        .collection("bloodDonors")
        .doc("donorsBloodGroups")
        .get();
    List<String> filteredData = [];
    for (var i = 0; i < data.data()!.length; i++) {
      if (data.data()!['donorsList'][i]['Blood_Group'] == bloodGroup) {
        filteredData.add(data.data()!['donorsList'][i]['Name']);
      }
    }
    return filteredData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors for Blood Group ${widget.donorsGroup}'),
      ),
      body: FutureBuilder(
        future: fetchBloodGroupDonors(widget.donorsGroup),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(snapshot.data![index]),
              subtitle: Text('Blood Group: ${widget.donorsGroup}'),
            );
          },
        );
        
      }),
    );
  }
}
