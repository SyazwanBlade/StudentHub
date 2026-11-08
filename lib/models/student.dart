/// A student record shared by the Home and Programme pages.
class Student {
  const Student({
    required this.name,
    required this.matric,
    required this.programme,
    this.role,
    this.photoAsset,
    this.isActive = true,
  });

  final String name;
  final String matric;
  final String programme;

  /// Team role (only for our group members).
  final String? role;

  /// Asset path of the profile photo. Null means show an initial instead.
  final String? photoAsset;

  final bool isActive;
}

/// Programme names used for the tabs on the Programme page.
const programmes = [
  'Software Engineering',
  'Computer Science',
  'Networking',
  'Multimedia',
];

/// Sample data. Edit freely: the Home and Programme pages read from here.
const sampleStudents = [
  // --- Our group members (with photos) ---
  Student(
    name: 'Syazwan Bin Salleh',
    matric: '102208',
    programme: 'Software Engineering',
    role: 'Project Manager',
    photoAsset: 'assets/images/syazwan.jpg',
  ),
  Student(
    name: 'Ahmad Fakhrurizzudin Bin Ahmad Fairuz',
    matric: '103118',
    programme: 'Software Engineering',
    role: 'Requirements',
    photoAsset: 'assets/images/ahmad.jpg',
  ),
  Student(
    name: 'Samson Riger Anak Samuel Kruger',
    matric: '106222',
    programme: 'Software Engineering',
    role: 'Flutter Architect',
    photoAsset: 'assets/images/samson.jpg',
  ),
  Student(
    name: 'Adib Aziman Bin Hossen',
    matric: '97930',
    programme: 'Software Engineering',
    role: 'Backend & AI Integration',
    photoAsset: 'assets/images/adib.jpg',
  ),
  Student(
    name: 'Izz Fariq Hazim Dahlan',
    matric: '99207',
    programme: 'Software Engineering',
    role: 'QA & CI/CD',
    photoAsset: 'assets/images/izz.jpg',
  ),
  // --- Filler students (no photo) ---
  Student(
    name: 'Nur Aina Binti Rosli',
    matric: '101001',
    programme: 'Computer Science',
  ),
  Student(
    name: 'Daniel Anak Jimmy',
    matric: '101002',
    programme: 'Computer Science',
  ),
  Student(
    name: 'Farah Binti Hamid',
    matric: '101003',
    programme: 'Computer Science',
    isActive: false,
  ),
  Student(name: 'Haziq Bin Mansor', matric: '101004', programme: 'Networking'),
  Student(
    name: 'Siti Balqis Binti Aziz',
    matric: '101005',
    programme: 'Networking',
  ),
  Student(name: 'Jason Lim Wei Han', matric: '101006', programme: 'Multimedia'),
  Student(
    name: 'Alya Sofea Binti Karim',
    matric: '101007',
    programme: 'Multimedia',
    isActive: false,
  ),
];
