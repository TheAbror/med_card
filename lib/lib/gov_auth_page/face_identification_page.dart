import 'package:flutter/material.dart';
import 'package:med_card/gen/assets.gen.dart';

class FaceIdentificationPage extends StatelessWidget {
  const FaceIdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Assets.icons.figmaIcons.faceId.image(),
    );
  }
}
