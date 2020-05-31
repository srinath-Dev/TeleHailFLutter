import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoguysrinath/models/contact.dart';
import 'package:videoguysrinath/models/user.dart';
import 'package:videoguysrinath/provider/user_provider.dart';
import 'package:videoguysrinath/resources/auth_method.dart';
import 'package:videoguysrinath/resources/chat_methods.dart';
import 'package:videoguysrinath/screens/cached_image.dart';
import 'package:videoguysrinath/screens/chat_screen.dart';
import 'package:videoguysrinath/utils/universal_variable.dart';
import 'package:videoguysrinath/widgets/custom_tile.dart';
import 'package:videoguysrinath/widgets/last_message_container.dart';
import 'package:videoguysrinath/widgets/online_dot_indicator.dart';


class ContactView extends StatelessWidget {
  final Contact contact;
  final AuthMethods _authMethods = AuthMethods();

  ContactView(this.contact);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: _authMethods.getUserDetailsById(contact.uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User user = snapshot.data;

          return ViewLayout(
            contact: user,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ViewLayout extends StatelessWidget {
  final User contact;
  final ChatMethods _chatMethods = ChatMethods();

  ViewLayout({
    @required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return CustomTile(
      mini: false,
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              receiver: contact,
            ),
          )),
      title: Text(
        (contact != null ? contact.name : null) != null ? contact.name : "..",
        style:
        TextStyle(color: Colors.white, fontFamily: "Arial", fontSize: 19),
      ),
      subtitle: LastMessageContainer(
        stream: _chatMethods.fetchLastMessageBetween(
          senderId: userProvider.getUser.uid,
          receiverId: contact.uid,
        ),
      ),
      leading: Container(
        constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Stack(
          children: <Widget>[
            CachedImage(
              contact.profilePhoto,
              radius: 80,
              isRound: true,
            ),
            OnlineDotIndicator(
              uid: contact.uid,
            ),
          ],
        ),
      ),
    );
  }
}