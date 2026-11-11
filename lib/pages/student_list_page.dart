import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentListPage extends StatelessWidget {
  const StudentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      // Student list showing names only
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleStudents.length,
        itemBuilder: (context, index) {
          final student = sampleStudents[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),

              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: const Icon(Icons.person, color: Colors.blue),
              ),

              // Show student name only
              title: Text(
                student.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),

              // Open student details when clicked
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentDetailsPage(student: student),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Student Details Page
class StudentDetailsPage extends StatelessWidget {
  final Student student;

  const StudentDetailsPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Details',
          style: TextStyle(color: Colors.white),
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

            // Student profile icon
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.person, size: 65, color: Colors.blue),
            ),

            const SizedBox(height: 16),

            // Student name
            Text(
              student.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // Student information
            _buildDetailCard(Icons.badge, 'Matric Number', student.matricNo),

            _buildDetailCard(Icons.school, 'Programme', student.programme),

            _buildDetailCard(Icons.email, 'Email', student.email),
          ],
        ),
      ),
    );
  }

  // Reusable student information card
  Widget _buildDetailCard(IconData icon, String title, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue, size: 28),
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
