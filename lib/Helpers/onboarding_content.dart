

class Content{
  String image;
  String text;
  String description;

  Content({required this.image, required this.description, required this.text});
}

List<Content> contents = [
  Content(
    image:'assets/images/Group 1000000781.png',
    text: 'Welcome to Docs&Nurs',
    description: 'Your heath is our priority. Learn more how it works.',
  ),

  Content(
    image: 'assets/images/Illustration.png',
    description: 'Find trusted general practitioners and specialists near you.',
    text: 'Find & Locate',),

  Content(
      image: 'assets/images/Illustration1.png',
      description: 'Online chat consultation and make an appointment with a physician.',
      text: 'Chat & Book Appointment'),
];