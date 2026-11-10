import 'package:flutter/material.dart';

/// Placeholder - owner replaces this with the real page.
class RecordsPage extends StatefulWidget {
  const RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();

}

class _RecordsPageState extends State<RecordsPage> {

  int? _sortColumnIndex;
  bool _isAscending = true;

  final _myData = [
  {'ID': '106222', 'Name': 'Samson', 'Department': 'Software Engineering', 'Age': 90, 'Email': '106222@siswa.unimas.my'},
  {'ID': '102208', 'Name': 'Syazwan', 'Department': 'Software Engineering', 'Age': 67, 'Email': '102208@siswa.unimas.my'},
  {'ID': '97930', 'Name': 'Adib', 'Department': 'Software Engineering', 'Age': 40, 'Email': '97930@siswa.unimas.my'},
  {'ID': '99207', 'Name': 'Izz', 'Department': 'Software Engineering', 'Age': 15, 'Email': '99207@siswa.unimas.my'},
  {'ID': '103118', 'Name': 'Ahmad', 'Department': 'Software Engineering', 'Age': 301, 'Email': '103118@siswa.unimas.my'},
  {'ID': '619619', 'Name': 'Rey Mysterio', 'Department': 'Sport Science', 'Age': 50, 'Email': '619619@siswa.unimas.my'},
  {'ID': '144040', 'Name': 'Elon Musk', 'Department': 'Entrepreneurship', 'Age': 47, 'Email': '104040@siswa.unimas.my'},
  {'ID': '199990', 'Name': 'Sam Altman', 'Department': 'Entrepreneurship', 'Age': 30, 'Email': '199990@siswa.unimas.my'},
  {'ID': '210220', 'Name': 'Labu', 'Department': 'Sport Science', 'Age': 40, 'Email': '210220@siswa.unimas.my'},
  {'ID': '167800', 'Name': 'Riger', 'Department': 'Sport Science', 'Age': 24, 'Email': '167800@siswa.unimas.my'},
  ];

  void _onSort(int columnIndex, bool ascending){
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;

      if(columnIndex == 0){
        _myData.sort((a,b){
          final aValue = int.parse(a['ID'] as String);
          final bValue = int.parse(b['ID'] as String);
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        });
      } else if (columnIndex == 1){
        _myData.sort((a,b){
          final aValue = a['Name'] as String;
          final bValue = b['Name'] as String;
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        });
      } else if (columnIndex == 2){
        _myData.sort((a,b){
          final aValue = a['Department'] as String;
          final bValue = b['Department'] as String;
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        });
      } else if (columnIndex == 3){
        _myData.sort((a,b){
          final aValue = a['Age'] as int;
          final bValue = b['Age'] as int;
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        });
      } else if (columnIndex == 4){
        _myData.sort((a,b){
          final aEmail = a['Email'] as String;
          final bEmail = b['Email'] as String;

          final aValue = int.parse(aEmail.split('@')[0]);
          final bValue = int.parse(bEmail.split('@')[0]);
          return ascending
              ? aValue.compareTo(bValue)
              : bValue.compareTo(aValue);
        });
      }
    });
  }

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
                  sortColumnIndex: _sortColumnIndex,
                  sortAscending: _isAscending,
                  border: TableBorder.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      borderRadius: BorderRadius.circular(12.0)),
                  columnSpacing: 30,
                  headingRowColor: WidgetStateProperty.all(Colors.blue.shade100),
                  columns: [
                    DataColumn(label: Text('ID'), onSort: _onSort),
                    DataColumn(label: Text('Name'), onSort: _onSort,),
                    DataColumn(label: Text('Department'), onSort: _onSort),
                    DataColumn(label: Text('Age'), onSort: _onSort),
                    DataColumn(label: Text('Email'), onSort: _onSort),
                   ],
                  rows: _myData.map((user) {
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
