import 'widgets/profile_qr_view/custom_barcode_widget.dart';
import 'package:flutter/material.dart';

class ProfileQrView extends StatelessWidget {
  const ProfileQrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode'),
      ),
      body: const SafeArea(child: CustomBarcodeWidget()),
    );
  }
}
