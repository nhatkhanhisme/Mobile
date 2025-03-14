import 'package:lacquer/features/auth/bloc/auth_bloc.dart';
import 'package:lacquer/features/auth/bloc/auth_event.dart';
import 'package:lacquer/features/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lacquer/config/theme.dart';
import '../../../widgets/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final initialLoginWidget = Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: SizedBox(
                      width: 330.0,
                      height: 190.0,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: TextFormField(
                              focusNode: focusNodeEmail,
                              controller: loginEmailController,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  FontAwesomeIcons.envelope,
                                  color: Colors.black,
                                  size: 22.0,
                                ),
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 17.0,
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                focusNodePassword.requestFocus();
                              },
                              validator: (value) {
                                if (value!.isEmpty) { 
                                  return 'Email cannot be empty';
                                } else if (!value.contains('@')) {
                                  return 'Invalid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            width: 250.0,
                            height: 1.0,
                            color: Colors.grey[400],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 25.0,
                              right: 25.0,
                            ),
                            child: TextFormField(
                              focusNode: focusNodePassword,
                              controller: loginPasswordController,
                              obscureText: _obscureTextPassword,
                              style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: const Icon(
                                  FontAwesomeIcons.lock,
                                  size: 22.0,
                                  color: Colors.black,
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold',
                                  fontSize: 17.0,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: _toggleLogin,
                                  child: Icon(
                                    _obscureTextPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 15.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              onFieldSubmitted: (_) {
                                _toggleSignInButton(context);
                              },
                              textInputAction: TextInputAction.go,
                              validator: (value){
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              }
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 180.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: CustomTheme.secondaryColor,
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: CustomTheme.loginGradientEnd,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 42.0,
                        ),
                        child: Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold',
                          ),
                        ),
                      ),
                      onPressed:() {
                        _toggleSignInButton(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Your Password?',
                    style: TextStyle(
                      color: CustomTheme.primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'WorkSansMedium',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[Colors.white10, Colors.white],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'WorkSansMedium',
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[Colors.white, Colors.white10],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: <double>[0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      width: 100.0,
                      height: 1.0,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: _buildGoogleButton(),
                  ),
                ],
              ),
            ],
          );
          final inLoginProgress = Center(
            child: const CircularProgressIndicator(),
          );
          inLoginFailure(message) => Center(
            child: Text('Login failed: $message'),
          );
          inLoginSuccess(userId, username) => Center(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome, $username!",
                      style: GoogleFonts.lora(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your UserID: $userId",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            )
          );
          return (switch(state){
            AuthInitial() => initialLoginWidget,
            AuthLoginInProgress() => inLoginProgress,
            AuthLoginFailure() => inLoginFailure(state.message),
            AuthLoginSuccess() => inLoginSuccess(state.userId, state.username),
          });
        }
      ),
    );
  }

  Widget _buildGoogleButton() {
    return GestureDetector(
      onTap: _onGoogleButtonTapUp,
      onTapDown: (_) => _onGoogleButtonTapDown(),
      onTapCancel: () => _onGoogleButtonTapUp(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 50,
          right: 50,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(15),
          color: _googleButtonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
              width: 20,
            ),
            const SizedBox(width: 20),
            const Text(
              'Sign in with Google',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _googleButtonColor = Colors.white;

  void _onGoogleButtonTapDown() {
    setState(() {
      _googleButtonColor = Colors.grey[300]!;
    });
  }

  void _onGoogleButtonTapUp() {
    setState(() {
      _googleButtonColor = Colors.white;
    });
    CustomSnackBar(context, const Text('Google button pressed'));
  }

  void _toggleSignInButton(BuildContext context) {
    CustomSnackBar(context, const Text('Login button pressed'));
    context.read<AuthBloc>().add(
      AuthEventLogin(
        email: loginEmailController.text, 
        password: loginPasswordController.text
      )
    );
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}
