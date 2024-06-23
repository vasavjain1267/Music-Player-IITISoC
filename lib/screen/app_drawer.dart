import 'package:flutter/material.dart';
import 'package:home_page/pages/about_us_page.dart';
import 'package:home_page/pages/faqs_page.dart';

class AppDrawer extends StatefulWidget {
  final Function(bool) onThemeChanged;
  final String username;
  final String email;
  final String password;
  final Function(bool) toggleTheme;

  AppDrawer({
    required this.onThemeChanged,
    required this.username,
    required this.email,
    required this.password,
    required this.toggleTheme,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool isDarkMode = false;

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Implement account deletion logic here
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deleted')),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu',
                style: TextStyle(color: Colors.white, fontSize: 24)),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 197, 115, 8),
            ),
          ),
          ExpansionTile(
            leading: const Icon(Icons.account_circle, size: 30),
            title: const Text('Account', style: TextStyle(fontSize: 20)),
            children: <Widget>[
              ListTile(
                title: Text('Username: ${widget.username}',
                    style: const TextStyle(fontSize: 18)),
              ),
              ListTile(
                title: Text('Email: ${widget.email}',
                    style: const TextStyle(fontSize: 18)),
              ),
              ListTile(
                title: TextFormField(
                  initialValue: widget.password,
                  obscureText: true,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text('App Appearance'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Select Theme'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RadioListTile<bool>(
                          title: const Text('Always Light',
                              style: TextStyle(fontSize: 18)),
                          value: false,
                          groupValue: isDarkMode,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                isDarkMode = value;
                              });
                              widget.toggleTheme(value);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                        RadioListTile<bool>(
                          title: const Text('Always Dark',
                              style: TextStyle(fontSize: 18)),
                          value: true,
                          groupValue: isDarkMode,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                isDarkMode = value;
                              });
                              widget.toggleTheme(value);
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.contact_mail, size: 30),
            title: Text('Contact Us', style: TextStyle(fontSize: 20)),
            subtitle:
                Text('iitisoc24@gmail.com', style: TextStyle(fontSize: 16)),
          ),
          ListTile(
            leading: const Icon(Icons.help, size: 30),
            title: const Text('Help and Support'),
            subtitle: const Text(
              'FAQs',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete My Account'),
            onTap: _deleteAccount,
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, size: 30),
            title: const Text('About Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
        ],
      ),
    ));
  }
}
