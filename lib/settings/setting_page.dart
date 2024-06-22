import 'package:flutter/material.dart';

import 'package:harmonix/settings/privacy_policy_page.dart';
import 'package:harmonix/settings/terms_condition_page.dart';
import 'package:harmonix/settings/faqs_page.dart';
import 'package:harmonix/settings/about_us_page.dart';

class SettingsPage extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final Function(bool) toggleTheme;

  const SettingsPage({
    super.key,
    required this.username,
    required this.email,
    required this.password,
    required this.toggleTheme,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
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
            leading: const Icon(Icons.brightness_6, size: 30),
            title: const Text('App Appearance', style: TextStyle(fontSize: 20)),
            subtitle: const Text('Theme', style: TextStyle(fontSize: 16)),
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
          ExpansionTile(
            leading: const Icon(Icons.info, size: 30),
            title:
                const Text('More Information', style: TextStyle(fontSize: 20)),
            children: <Widget>[
              ListTile(
                title: const Text('Privacy Policy',
                    style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicyPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Terms and Conditions',
                    style: TextStyle(fontSize: 18)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsConditionsPage()),
                  );
                },
              ),
              const ListTile(
                title: Text('App Version', style: TextStyle(fontSize: 18)),
                subtitle: Text('1.0.0', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.help, size: 30),
            title:
                const Text('Help and Support', style: TextStyle(fontSize: 20)),
            subtitle: const Text('FAQs', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FAQsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline, size: 30),
            title: const Text('About Us', style: TextStyle(fontSize: 20)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
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
            leading: const Icon(Icons.logout, size: 30),
            title: GestureDetector(
               onTap: () {
             // AuthenticationRepository.instance.logout();
            },
              child: const Text('Log Out', style: TextStyle(fontSize: 20))),
           
          ),
          ListTile(
            leading: const Icon(Icons.delete, size: 30),
            title:
                const Text('Delete My Account', style: TextStyle(fontSize: 20)),
            onTap: _deleteAccount,
          ),
        ],
      ),
    );
  }
}
