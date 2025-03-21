import 'package:flutter/material.dart';
import 'package:lacquer/config/theme.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  VerifyEmailPageState createState() => VerifyEmailPageState();
}

class VerifyEmailPageState extends State<VerifyEmailPage> {
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
      appBar: AppBar(
        backgroundColor: CustomTheme.loginGradientStart,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {}, //onPressed của nút Back
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              CustomTheme.loginGradientStart,
              CustomTheme.loginGradientEnd,
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: <double>[0.0, 1.0],
            tileMode: TileMode.clamp,
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
                GestureDetector(
                  onTap:
                      _canResend
                          ? () {} //onPressed của Resent Code
                          : null,
                  child: Text(
                    _canResend
                        ? 'Resend Code'
                        : 'Resend code in $_seconds seconds',
                    style: TextStyle(
                      fontSize: 16,
                      color: _canResend ? Colors.black : Colors.grey,
                      decoration:
                          _canResend
                              ? TextDecoration.underline
                              : TextDecoration.none,
                    ),
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
