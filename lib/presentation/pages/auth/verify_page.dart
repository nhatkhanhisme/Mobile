import 'package:flutter/material.dart';
import 'package:lacquer/config/theme.dart';

class Verify extends StatelessWidget {
  const Verify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerifyEmailScreen(),
    );
  }
}

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  VerifyEmailScreenState createState() => VerifyEmailScreenState();
}

class VerifyEmailScreenState extends State<VerifyEmailScreen> {
  int _seconds = 30;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          if (_seconds > 0) {
            _seconds--;
            _startCountdown();
          } else {
            _canResend = true;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              CustomTheme.loginGradientStart,
              CustomTheme.loginGradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/app_mascot.png', width: 100),
                SizedBox(height: 20),
                Text(
                  'Verify Your Email',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.lightbeige,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We\'ve sent a verification link to your email. Click the link to verify.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: CustomTheme.lightbeige),
                ),
                SizedBox(height: 20),
                Text(
                  _canResend
                      ? 'Resend Code'
                      : 'Resend code in $_seconds seconds',
                  style: TextStyle(
                    fontSize: 16,
                    color: _canResend ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
