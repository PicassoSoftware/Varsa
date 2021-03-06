import 'package:FrontendBranchOffice/views/product_add.dart';
import 'package:FrontendBranchOffice/views/rezervation.dart';
import 'package:FrontendBranchOffice/views/seller_profile.dart';
import 'package:flutter/material.dart';
import 'programlayout.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("buton");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProgramLayout()),
            );
          },
          icon: const Icon(Icons.forward_sharp),
          backgroundColor: const Color(0xFF157575),
          label: const Text("Giris"),
        ),
      ],
    );
  }
}
