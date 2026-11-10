
class Student {
  final String name;
  final String matricNo;
  final String programme;
  final String email;
  final double cgpa;

  const Student({
    required this.name,
    required this.matricNo,
    required this.programme,
    required this.email,
    required this.cgpa,
  });
}

// Sample student data
const List<Student> sampleStudents = [
  Student(
    name: 'Ali Tan',
    matricNo: '118998',
    programme: 'Software Engineering',
    email: 'ali.tan@unimas.my',
    cgpa: 3.90,
  ),
  Student(
    name: 'Sara Lee',
    matricNo: '127845',
    programme: 'Software Engineering',
    email: 'sara.lee@unimas.my',
    cgpa: 3.80,
  ),
  Student(
    name: 'John Lim',
    matricNo: '135672',
    programme: 'Computer Science',
    email: 'john.lim@unimas.my',
    cgpa: 3.70,
  ),
  Student(
    name: 'Aina Rahman',
    matricNo: '142389',
    programme: 'Information Systems',
    email: 'aina.rahman@unimas.my',
    cgpa: 3.60,
  ),
  Student(
    name: 'David Ng',
    matricNo: '156721',
    programme: 'Software Engineering',
    email: 'david.ng@unimas.my',
    cgpa: 3.50,
  ),
  Student(
    name: 'Nur Izzati',
    matricNo: '163854',
    programme: 'Data Science',
    email: 'izzati@unimas.my',
    cgpa: 3.85,
  ),
  Student(
    name: 'Daniel Wong',
    matricNo: '174293',
    programme: 'Computer Science',
    email: 'daniel.wong@unimas.my',
    cgpa: 3.45,
  ),
];


