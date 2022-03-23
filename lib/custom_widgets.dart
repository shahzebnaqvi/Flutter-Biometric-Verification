import 'package:fingerprintbiometric/verfiy_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/local_auth_api.dart';

Widget buildText(String text, bool checked) => Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          checked
              ? const Icon(Icons.check, color: Colors.green, size: 24)
              : const Icon(Icons.close, color: Colors.red, size: 24),
          const SizedBox(width: 3),
          Text(text,
              style: TextStyle(
                  fontSize: 15, color: Colors.black.withOpacity(0.6))),
        ],
      ),
    );
Widget authenticateButton(context) {
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
    width: MediaQuery.of(context).size.width * 0.4,
    child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          minimumSize: const Size.fromHeight(40),
        ),
        icon: const Icon(
          Icons.fingerprint,
          size: 26,
          color: Color(0xFF009C10),
        ),
        label: const Text(
          "Verify",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF009C10),
          ),
        ),
        onPressed: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            Get.offAll(() => const FingerPrintVerify());
          }
        }),
  );
}
