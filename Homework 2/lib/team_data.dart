class TeamMember {
  final String name;
  final String country;
  final String role;
  final String hobbies;
  final String motto;
  final String? imagePath;

  TeamMember({
    required this.name,
    required this.country,
    required this.role,
    required this.hobbies,
    required this.motto,
    this.imagePath,
  });
}

const String teamName = 'COIL Flutter - Group 5';
const String teamDescription =
    'A collaborative Flutter project between TAMK (Finland) and THWS (Germany) '
    'as part of the Cross Platform Development course.';

final List<TeamMember> teamMembers = [
  TeamMember(
    name: 'Halil Hakan Karabay',
    country: 'Türkiye',
    role: 'Backend Developer',
    hobbies: 'Football',
    motto: 'Duck it',
    imagePath: 'assets/images/halil.jpg',
  ),
  TeamMember(
    name: 'Anastasiia Pylova',
    country: 'Russia',
    role: 'Frontend Developer',
    hobbies: 'Dance, Volleyball, Photography',
    motto: 'Better late than never',
    imagePath: 'assets/images/anastasiia.jpeg',
  ),
  TeamMember(
    name: 'Armanc Beler',
    country: 'Türkiye',
    role: 'Developer',
    hobbies: 'Video Games',
    motto: 'Stay alive',
    imagePath: null,
  ),
  TeamMember(
    name: 'Yasas Thamara Wijethunga',
    country: 'Sri Lanka (lives in Finland)',
    role: 'Full Stack Developer',
    hobbies: 'Traveling, Playing Cricket',
    motto: 'Work hard until you achieve your goals',
    imagePath: 'assets/images/yasas.jpg',
  ),
  TeamMember(
    name: 'Sofiia Khyzhnychenko',
    country: 'Ukraine',
    role: 'Frontend Developer',
    hobbies: 'Sport',
    motto: 'Don\'t kill my vibe',
    imagePath: 'assets/images/sofiia.jpeg',
  ),
  TeamMember(
    name: 'Tran Ngoc Lan Ch',
    country: 'TBD',
    role: 'TBD',
    hobbies: 'TBD',
    motto: 'TBD',
    imagePath: null,
  ),
];