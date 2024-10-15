import 'package:flutter/material.dart';
import 'package:rti_new_apps/widgets/reusable_widget.dart';

class PaymentPolicy extends StatelessWidget {
  const PaymentPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWidget(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Text(
                  'PAYMENT POLICY',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Text(
                  'Applicants have to ensure that Transaction Reference Number has been generated and if the same his not'
                  'been generated, she/he has to make the payment of bill afresh to ensure delivery of RTT application'
                  'Refund of the money due to above unsuccesstul transaction the consumer has to take up the matter with'
                  'the respective issuer bank. Mizoram Information Commission/Department of Finance, Government of'
                  'Mizoram will not be responsible for such refund.'
                  'Phere are three ways of transaction (Tow'
                  'Amount is debited from applicants” necount nnd success message is shown in Mizoram Information'
                  'Commission/Department of Finance, Government of Mizoram portal, Connection does not break.'
                  'Connection breaks before amount is debited [rom users necount, There should not be any issue as'
                  'Citizens bank/card account is not debited,'
                  'Connection breaks after amount is debited from users account but payment status is not shown in'
                  'Mizoram Information Commission/Department of Finance, Government of Mizoram™s R11 portal.'
                  'Successiul payments will be settled during reconciliation process between Mizoram Information'
                  'Commission/Department of Finance, Government of Mizoram and Designated Bank. The applicants'
                  'can pay again to make sure that he/she gets transaction receipt, In case of double (or multiple payment)\n'
                  'Contact us:'
                  'Mizoram Information Commission,'
                  'New Secretariat Complex, Khatla,'
                  'Mizoram : Aizawl-796001')
            ],
          ),
        ),
      ),
    );
  }
}
