import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:harmonix/screens/welcome.dart';
import 'package:harmonix/settings/privacy_policy_page.dart';
import 'package:harmonix/settings/terms_condition_page.dart';
import 'package:harmonix/settings/faqs_page.dart';
import 'package:harmonix/settings/about_us_page.dart';

class SettingsPage extends StatefulWidget {
  final String username;
  final String email;

  const SettingsPage({
    super.key,
    required this.username,
    required this.email,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  bool isEditingUsername = false;
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.username;
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete your Account?'),
          content: const Text(
              '''If you select Delete we will delete your account on our server.

Your app data will also be deleted and you won't be able to retrieve it.

After deleting your account, you must log out.'''),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                deleteUserAccount();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Welcome()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Error occurred')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred')),
      );
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData = FirebaseAuth.instance.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await FirebaseAuth.instance.currentUser!.reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await FirebaseAuth.instance.currentUser!.reauthenticateWithProvider(GoogleAuthProvider());
      }

      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Reauthentication failed')),
      );
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Welcome()),
    );
  }

  void _saveUsername() async {
    String newUsername = _usernameController.text;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'name': newUsername});
      setState(() {
        isEditingUsername = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update username')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildAccountSection(),
          _buildAppearanceSection(),
          _buildMoreInformationSection(),
          _buildHelpAndSupportSection(),
          _buildContactUsSection(),
          _buildLogoutTile(),
          _buildDeleteAccountTile(),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ExpansionTile(
        leading: const Icon(Icons.account_circle, size: 30),
        title: const Text('Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        children: <Widget>[
          ListTile(
            title: Row(
              children: [
                isEditingUsername
                    ? Expanded(
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: 'Enter new username',
                          ),
                        ),
                      )
                    : Expanded(
                        child: Text('Username: ${_usernameController.text}', style: const TextStyle(fontSize: 16)),
                      ),
                IconButton(
                  icon: Icon(isEditingUsername ? Icons.check : Icons.edit),
                  onPressed: () {
                    if (isEditingUsername) {
                      _saveUsername();
                    } else {
                      setState(() {
                        isEditingUsername = true;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Email: ${widget.email}', style: const TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildAppearanceSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.brightness_6, size: 30),
        title: const Text('App Appearance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      title: const Text('Always Light', style: TextStyle(fontSize: 16)),
                      value: false,
                      groupValue: isDarkMode,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            isDarkMode = value;
                          });
                          // widget.toggleTheme(value);
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    RadioListTile<bool>(
                      title: const Text('Always Dark', style: TextStyle(fontSize: 16)),
                      value: true,
                      groupValue: isDarkMode,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() {
                            isDarkMode = value;
                          });
                          // widget.toggleTheme(value);
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
    );
  }

  Widget _buildMoreInformationSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ExpansionTile(
        leading: const Icon(Icons.info, size: 30),
        title: const Text('More Information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        children: <Widget>[
          ListTile(
            title: const Text('Privacy Policy', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Terms and Conditions', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsConditionsPage()),
              );
            },
          ),
          const ListTile(
            title: Text('App Version', style: TextStyle(fontSize: 16)),
            subtitle: Text('1.0.0', style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpAndSupportSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.help, size: 30),
        title: const Text('Help and Support', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: const Text('FAQs', style: TextStyle(fontSize: 16)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FAQsPage()),
          );
        },
      ),
    );
  }

  Widget _buildContactUsSection() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.contact_mail, size: 30),
        title: const Text('Contact Us', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: const Text('iitisoc24@gmail.com', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildLogoutTile() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.logout, size: 30),
        title: GestureDetector(
          onTap: () {
            signOut();
          },
          child: const Text('Log Out', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildDeleteAccountTile() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      child: ListTile(
        leading: const Icon(Icons.delete, size: 30, color: Colors.red),
        title: GestureDetector(
          onTap: _deleteAccount,
          child: const Text('Delete My Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
        ),
      ),
    );
  }
}
