import 'package:flutter/material.dart';
import 'package:iwelcgm/screens/coaching.dart';
import 'package:iwelcgm/screens/events.dart';
import 'package:iwelcgm/screens/help.dart';
import 'package:iwelcgm/screens/news.dart';
import 'package:iwelcgm/screens/settings.dart';
import 'package:iwelcgm/screens/social_media.dart';
import 'package:iwelcgm/screens/support.dart';
import 'package:iwelcgm/screens/user_info.dart';

class NavigationDrawerWidget extends StatelessWidget {
  // const NavigationDrawerWidget({Key? key}) : super(key: key);

  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Robert Morrow';
    final location = 'Exton, PA';
    final urlImage =
        'https://www2.pictures.gi.zimbio.com/33rd+Annual+People+Choice+Awards+Arrivals+zCU2qOx4Pu-x.jpg';

    return Drawer(
      child: Material(
        color: Colors.teal,
        child: ListView(
          // padding: padding,
          children: [
            buildHeader(
                urlImage: urlImage,
                name: name,
                location: location,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserInfoScreen(
                          name: name,
                          urlImage: urlImage,
                        )))),
            Container(
              padding: padding,
              child: Column(
                children: [
                  Divider(color: Colors.white70),
                  Text(
                    'HOME iWel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'EVENTS',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'DIABETES COACHING',
                    icon: Icons.favorite_border,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'DIABETES NEWS',
                    icon: Icons.add_to_queue_outlined,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'SOCIAL MEDIA',
                    icon: Icons.people,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'USER INFORMATION',
                    icon: Icons.account_box_outlined,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'SETTINGS',
                    icon: Icons.settings,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'HELP',
                    icon: Icons.announcement_outlined,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'SUPPORT',
                    icon: Icons.add_ic_call_outlined,
                    onClicked: () => selectedItem(context, 7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String location,
    VoidCallback? onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 30)),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImage),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    location,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    final urlImage =
        'https://www2.pictures.gi.zimbio.com/33rd+Annual+People+Choice+Awards+Arrivals+zCU2qOx4Pu-x.jpg';

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EventsScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CoachingScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SocialMediaScreen(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserInfoScreen(
            name: 'Robert Morrow',
            urlImage: urlImage,
          ),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HelpScreen(),
        ));
        break;
      case 7:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SupportScreen(),
        ));
        break;
    }
  }
}
