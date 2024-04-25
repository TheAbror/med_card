import 'widgets/confetii_card.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/share_certificate_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ConfettiCard(
            title: 'You\'re enrolled.',
            subTitle: 'You are enrolled, to begin click the "Start" button',
          ),
          ShareCetificateCard(
            title: 'Congratulations on getting your certificate!',
            subTitle: 'You completed this course on August 2, 2023',
            buttonTitle: 'Share certificate',
            onTap: () => Share.share('asdafds', subject: 'Check this out'),
          ),
        ],
      ),
    );
  }
}
