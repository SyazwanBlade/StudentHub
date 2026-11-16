import 'package:flutter/material.dart';

class Programme1Screen extends StatelessWidget {
  Programme1Screen({super.key});

  final _programme1data = [
    {
      'ID': '106222',
      'Name': 'Samson',
      'Department': 'Software Engineering',
      'Age': 90,
      'Email': '106222@siswa.unimas.my',
    },
    {
      'ID': '102208',
      'Name': 'Syazwan',
      'Department': 'Software Engineering',
      'Age': 67,
      'Email': '102208@siswa.unimas.my',
    },
    {
      'ID': '97930',
      'Name': 'Adib',
      'Department': 'Software Engineering',
      'Age': 40,
      'Email': '97930@siswa.unimas.my',
    },
    {
      'ID': '99207',
      'Name': 'Izz',
      'Department': 'Software Engineering',
      'Age': 15,
      'Email': '99207@siswa.unimas.my',
    },
    {
      'ID': '103118',
      'Name': 'Ahmad',
      'Department': 'Software Engineering',
      'Age': 301,
      'Email': '103118@siswa.unimas.my',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: DataTable(
                border: TableBorder.all(
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                columnSpacing: 30,
                headingRowColor: WidgetStateProperty.all(
                  Colors.redAccent.shade400,
                ),
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Department')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('Email')),
                ],
                rows: _programme1data.map((user) {
                  return DataRow(
                    cells: [
                      DataCell(Text(user['ID'].toString())),
                      DataCell(Text(user['Name'].toString())),
                      DataCell(Text(user['Department'].toString())),
                      DataCell(Text(user['Age'].toString())),
                      DataCell(Text(user['Email'].toString())),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
