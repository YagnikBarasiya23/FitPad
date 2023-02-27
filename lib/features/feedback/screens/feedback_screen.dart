import 'package:fitpad/shared/utils/constants.dart';
import 'package:fitpad/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          'Feedback',
          style: kTextStyleHeaders,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Rate Experience',
              style: kTextStyleHeadings,
            ),
            const SizedBox(height: 5),
            const Text('Are you Satisfied from our services?',
                style: kTextStyleSmall),
            const SizedBox(height: 20),
            RatingBar.builder(
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Color(0xFFE21414),
                );
              },
              itemCount: 5,
              itemSize: 45,
              unratedColor: Colors.white,
              itemPadding: const EdgeInsets.all(5),
              initialRating: 0,
              allowHalfRating: true,
              onRatingUpdate: (value) {},
            ),
            const Divider(thickness: 1, height: 50),
            TextFormField(
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Tell us how can we improve',
              ),
            ),
            const SizedBox(height: 50),
            Center(
                child: CustomButton(
              text: 'Submit',
              onPressed: () {
                Alert(
                    context: context,
                    title: 'Thank You',
                    desc: 'Your feedback has been successfully submitted',
                    type: AlertType.success,
                    closeIcon: const Icon(Icons.clear),
                    style: const AlertStyle(
                        animationType: AnimationType.shrink, alertElevation: 2),
                    buttons: [
                      DialogButton(
                          child: const Text('Back'),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ]).show();
              },
            )),
          ],
        ),
      ),
    ));
  }
}
