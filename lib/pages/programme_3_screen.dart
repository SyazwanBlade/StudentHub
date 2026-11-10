import 'package:flutter/material.dart';

class Programme3Screen extends StatelessWidget {
  Programme3Screen({super.key});

  final _programme1data = [
    {'ID': '210220', 'Name': 'Labu', 'Department': 'Sport Science', 'Age': 40, 'Email': '210220@siswa.unimas.my'},
    {'ID': '167800', 'Name': 'Riger', 'Department': 'Sport Science', 'Age': 24, 'Email': '167800@siswa.unimas.my'},
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
                    borderRadius: BorderRadius.circular(12.0)),
                columnSpacing: 30,
                headingRowColor: WidgetStateProperty.all(Colors.cyan.shade300),
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