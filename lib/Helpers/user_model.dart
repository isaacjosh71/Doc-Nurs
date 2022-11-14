
class User {
  final int id;
  final String name;
  final String image;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.isOnline
  });
}

//patient
final User patient = User(
    id: 0,
    name: 'Physician',
  isOnline: true,
    image: ''
);

//physician
final User physician1 = User(
  id: 1,
    name: 'Dr. Ellen Omorogbe',
    image: 'assets/images/Frame 1000000947.png',
  isOnline: true
);
final User physician2 = User(
  id: 2,
    name: 'Dr. Ellen Omorogbe',
    image: 'assets/images/Frame 1000000947.png',
  isOnline: true
);
final User physician3 = User(
  id: 3,
    name: 'Mary Dangote',
    image: 'assets/images/Frame 1000000947.png',
  isOnline: true
);
final User physician4= User(
  id: 4,
    name: 'Mary Dangote',
    image: 'assets/images/Frame 1000000947.png',
  isOnline: true
);
final User physician5 = User(
  id: 5,
    name: 'Dr. Ellen Omorogbe',
    image: 'assets/images/Frame 1000000947.png',
  isOnline: true
);