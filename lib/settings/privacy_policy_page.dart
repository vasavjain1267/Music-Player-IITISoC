import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: January 1, 2024',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to our music streaming app. We respect your privacy and are committed to protecting your personal data. This privacy policy will inform you about how we look after your personal data when you visit our website or use our app and tell you about your privacy rights and how the law protects you.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Data We Collect About You',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may collect, use, store, and transfer different kinds of personal data about you which we have grouped together as follows:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '- Identity Data: includes first name, last name, username, or similar identifier.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Contact Data: includes email address and telephone numbers.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Technical Data: includes internet protocol (IP) address, your login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform, and other technology on the devices you use to access this app.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Usage Data: includes information about how you use our app, products, and services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Personal Data',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We will only use your personal data when the law allows us to. Most commonly, we will use your personal data in the following circumstances:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '- To register you as a new user.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- To process and deliver your order including managing payments, fees, and charges.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- To manage our relationship with you which will include notifying you about changes to our terms or privacy policy, asking you to leave a review, or take a survey.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- To administer and protect our business and this app (including troubleshooting, data analysis, testing, system maintenance, support, reporting, and hosting of data).',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '4. Data Security',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We have put in place appropriate security measures to prevent your personal data from being accidentally lost, used or accessed in an unauthorized way, altered, or disclosed. In addition, we limit access to your personal data to those employees, agents, contractors, and other third parties who have a business need to know. They will only process your personal data on our instructions, and they are subject to a duty of confidentiality.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Your Legal Rights',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Under certain circumstances, you have rights under data protection laws in relation to your personal data. These include the right to:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '- Request access to your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Request correction of your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Request erasure of your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Object to processing of your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Request restriction of processing your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Request transfer of your personal data.',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Right to withdraw consent.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'If you wish to exercise any of the rights set out above, please contact us.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '6. Changes to this Privacy Policy',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We keep our privacy policy under regular review. This version was last updated on January 1, 2024. We may update this privacy policy from time to time, and we will notify you of any significant changes via email or through our app.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '7. Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about this privacy policy or our privacy practices, please contact us at iitisoc24@gmail.com.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
