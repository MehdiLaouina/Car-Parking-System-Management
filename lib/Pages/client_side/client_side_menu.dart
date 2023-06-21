import 'package:application/Pages/client_side/client_bookings_page.dart';
import 'package:application/Pages/client_side/client_profile_info.dart';
import 'package:application/Pages/default_page.dart';
import 'package:application/models/client/Client.dart';
import 'package:application/services/api_service.dart';
import 'package:flutter/material.dart';

class ClientSideMenu extends StatelessWidget {
  final Client client;
  const ClientSideMenu({super.key, required this.client});

  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final name = client.data.name;
    final email = client.data.email;
    const urlImage = 'assets/images/App_Logo.png';

    return Drawer(
      child: Material(
        color: Colors.deepPurple[300],
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  buildSearchField(),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Profile',
                    icon: Icons.person_2,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Bookings',
                    icon: Icons.bookmark_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Log Out',
                    icon: Icons.logout,
                    onClicked: () {
                      showLogoutConfirmation(context);
                    },
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
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 35, backgroundImage: AssetImage(urlImage)),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.deepPurple[400],
                child:
                    const Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    const color = Colors.white;

    return TextField(
      style: const TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: const TextStyle(color: color),
        prefixIcon: const Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ClientProfileInfo(client: client),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ClientBookingsPage(client: client),
        ));
        break;
      case 2:
        APIService.logOut();
        break;
    }
  }

  void showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout Confirmation'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                // Perform logout operation here
                selectedItem(context, 2);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const DefaultHome()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
