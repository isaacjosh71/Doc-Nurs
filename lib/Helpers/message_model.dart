
import 'package:docs_and_nurs/Helpers/user_model.dart';

class Message{
  final User sender;
  final String text;
  final bool unread;

  Message({
    required this.sender,
    required this.text,
    required this.unread,
  });
}

List<Message> messages = [
  Message(
      sender: physician1,
      text: 'How can i help?',
      unread: true,),
  Message(
      sender: physician2,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. ',
      unread: false,
  ),
  Message(
      sender: physician3,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. ',
      unread: false,),
  Message(
      sender: physician4,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. ',
      unread: true,),
  Message(
      sender: physician5,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. ',
      unread: false,),
];

List<Message> chats = [
  Message(
    sender: physician1,
    text: 'How can i help?',
    unread: true,
  ),
  Message(
      sender: patient,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      unread: true,
  ),
  Message(
      sender: patient,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
      unread: true,
  ),
  Message(
      sender: physician1,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec fringilla quam eu faci lisis mollis. ',
      unread: true,
  )
];