import 'package:flutter/material.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWidget(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'TERMS & POLICIES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'This Privacy Policy governs the manner in which Mizoram Information Commission/Department of'
                'Finance, Government of Mizoram collects, uses, maintains and discloses information collected from'
                'Citizens (cach, a "User" of the www.rti.mizoram.gov.in website. This privacy policy applies to the Site/s'
                'and all products and services offered by Mizoram Information Commission/Departmient of Finance.'
                'Government of Mizoram.',
              ),
              Text(
                'Personal identification information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'We may collect personal identification information from Users in a variety of ways. including. but not'
                'limited to, when Users visit our site, register on the site, place an order, fill out a form, and in connection'
                'with other activities, services, features or resources we make available on our Site. Users may be asked'
                'for, as appropriate, name, cmail address, mailing address, phone number, credit card information. etc.'
                'Users may, however, visit our Site anonymously. We will collect personal identification information from'
                'Users only if they voluntarily submit such information to us. Users can always refuse to supply personal'
                'identification information, except that it may prevent them from engaging in certain Site related activities.',
              ),
              Text(
                'Non-personal identification information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'We may collect non-personal identification information about Users whenever they interact with our Site.'
                'Non-personal identification information may include the browser name. the type of computer and'
                'technical information about Users means of connection to our Site, such as the operating system and the'
                'Internet service provider utilized and other similar information.',
              ),
              Text('Web browser cookies'),
              Text(
                'Our Site may use "cookies" to enhance User experience. Users web browser places cookies on their hard'
                'drive for record-keeping purposes and sometimes to track information about them. User may choose to set'
                'their web browser to refuse cookies, or (o alert you when cookies are being sent. If they do so, note that'
                'some parts of the Site may not function properly.',
              ),
              Text(
                'How we use collected information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                subtitle: Column(children: [
                  Text(
                      'Mizoram Information Commission/Department of Finance, Government of Mizoram may collect and use Users personal information for the following purposes:'),
                  Text(
                      'Mizoram Information Commission/Department of Finance, Government of Mizoram may collect and use'
                      'Users personal information for the following purposes:\n'
                      '- To improve customer service. Information you provide helps us respond to your customer service'
                      'requests and support needs more efficiently,\n'
                      '- To personalize user experience. We may use information in the aggregate to understand how our Users'
                      'as a group use the services and resources provided on our Site.\n'
                      '- To improve our Site. We may use feedback you provide to improve our products and services.\n'
                      '- To process payments. We may use the information Users provide about themselves when placing an'
                      'order only to provide service to that order. We do not share this information with outside parties except to'
                      'the extent necessary to provide the service.\n'
                      '- To run a promotion, contest, survey or other Site feature. To send Users information they agreed to'
                      'receive about topics we think will be of interest to them.\n'
                      '- To send periodic emails. We may use the email address to send User information and updates pertaining'
                      'to their order. It may also be used to respond to their inquiries, questions, and/or other requests. If User'
                      'decides to opt-in to our mailing list, they will receive emails that may include company news, updates.'
                      'related product or service information, etc. If at any time the User would like to unsubscribe from'
                      'receiving future emails, we include detailed unsubscribe instructions at the bottom of each email or User'
                      'may contact us via our Site.')
                ]),
              ),
              Text(
                'How we protect your information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ListTile(
                subtitle: Column(
                  children: [
                    Text(
                        'We adopt appropriate data collection, storage and processing practices and security measures to protect'
                        'against unauthorized access, alteration, disclosure or destruction of your personal information, username,'
                        'password, transaction information and data stored on our Site.'
                        'Sensitive and private data exchange between the Site and its Users happens over a SSL secured'
                        'communication channel and is encrypted and protected with digital signatures.\n'
                        'Sharing your personal information'
                        'We do not sell, trade, or rent Users personal identification information to others. We may share generic'
                        'aggregated demographic information not linked to any personal identification information regarding'
                        'visitors and users with our business partners, trusted affiliates and advertisers for the purposes outlined above.\n'
                        'EPABX -0389-2334833, 2335288 New Secretariat Complex, Khatla. E-mail- secy.mic-mz@gov.in'
                        '2336288, 2336388, 2336488 AlZAWL-796001 Website — www.mic.mizoram.gov.in'
                        'Telefax-0389-2334928 MIZORAM'
                        'MIZORAM INFORMATION COMMISSION ('
                        'NEW SECRETARIAT COMPLEX, KHATLA = RIGHT TO'
                        'MIZORAM : AIZAWL =) INFORMATION')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
