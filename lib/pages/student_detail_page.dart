
import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentDetailPage extends StatelessWidget {
  final Student student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, size: 65, color: Colors.blue),
            ),

            const SizedBox(height: 16),

            Text(
              student.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            _buildDetailCard(
              Icons.badge,
              'Matric Number',
              student.matricNo,
              selectable: true,
            ),

            _buildDetailCard(
              Icons.school,
              'Programme',
              student.programme,
            ),

            _buildDetailCard(
              Icons.email,
              'Email',
              student.email,
              selectable: true,
            ),

            _buildDetailCard(
              Icons.grade,
              'CGPA',
              student.cgpa.toStringAsFixed(2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(
    IconData icon,
    String title,
    String value, {
    bool selectable = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        subtitle: selectable
            ? SelectableText(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )
            : Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
