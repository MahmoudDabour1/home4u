import 'package:flutter/cupertino.dart';

class RenovateFixedPackagesBody extends StatelessWidget {
  const RenovateFixedPackagesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Fixed Packages',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          'Choose a package that suits your needs.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        CupertinoButton(
          onPressed: () {
            // Handle button press
          },
          color: CupertinoColors.activeBlue,
          child: const Text('Select Package'),
        ),
      ],
    );
  }
}
