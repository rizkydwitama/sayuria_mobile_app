import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:sayuria/main.dart';
import 'package:sayuria/services/local_notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const OTPPage());
}

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OTPPageHome(),
    );
  }
}

class OTPPageHome extends StatefulWidget {
  const OTPPageHome({Key? key}) : super(key: key);

  @override
  State<OTPPageHome> createState() => _OTPPageHomeState();
}

class _OTPPageHomeState extends State<OTPPageHome> {
  int randomNumber = 10000;
  int resultOTP = 0;

  @override
  void initState() {
    random();
    super.initState();
  }

  void random() {
    setState(() {
      Random random = Random();
      randomNumber = random.nextInt(100000);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 40
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Satu langkah lagi untuk dapat belanja sayur kesukaanmu di aplikasi Sayuria.",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 52),
              Center(
                child: Image.asset(
                  "assets/images/otp_page_image.png",
                  width: 286,
                ),
              ),
              const SizedBox(height: 21),
              const SizedBox(
                width: 313,
                child: Text(
                  "Kami akan mengirimkan kode OTP melalui email berikut:",
                  style: TextStyle(
                    fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 21),
              const Text(
                "(user123@gmail.com)",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),
                textAlign: TextAlign.center,
              ),
             const SizedBox(height: 28),
              OtpTextField(
                numberOfFields: 5,
                showFieldAsBox: true,
                borderColor: Colors.lightGreen,
                onCodeChanged: (String code) {
                },
                onSubmit: (inputOTP){
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Kode OTP: $inputOTP'),
                        );
                      }
                  );
                }, // end onSubmit
              ),
              const SizedBox(height: 28),
              Text(
                "Kode OTP Anda adalah: $randomNumber",
                style: const TextStyle(
                  fontSize: 15
                ),
              ),
              const Spacer(),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextButton(
                  onPressed: () {
                    NotificationService()
                        .showNotification(title: 'Sample title', body: 'It works!');
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => const SayuriaApp())
                    );
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



