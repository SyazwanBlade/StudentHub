import 'package:flutter/material.dart';

class Programme2Screen extends StatelessWidget {
  Programme2Screen({super.key});

  final _programme1data = [
    {
      'ID': '144040',
      'Name': 'Elon Musk',
      'Department': 'Entrepreneurship',
      'Age': 47,
      'Email': '104040@siswa.unimas.my',
    },
    {
      'ID': '199990',
      'Name': 'Sam Altman',
      'Department': 'Entrepreneurship',
      'Age': 30,
      'Email': '199990@siswa.unimas.my',
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
                headingRowColor: WidgetStateProperty.all(Colors.green.shade400),
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
