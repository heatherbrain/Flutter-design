import 'package:flutter/material.dart';
import 'package:from_design/components/navigation_menu.dart';
import 'package:from_design/widget/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formSigninKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  Future<void> _handleLogin() async {
    if (_formSigninKey.currentState!.validate()) {
      final response = await _authService.login(
        emailController.text,
        passwordController.text,
      );

          if (response['status']) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const NavigationMenu()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response['message'] ?? 'Login failed'),
                backgroundColor: const Color.fromARGB(255, 255, 17, 0),
              ),
            );
          }
        }
      }

    //   if (response['status']) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => Scaffold(
    //           appBar: AppBar(title: const Text('Home')),
    //           body: const Center(child: Text('Login Successful')),
    //         ),
    //       ),
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(response['message'] ?? 'Login failed'),
    //         backgroundColor: const Color.fromARGB(255, 255, 17, 0),
    //       ),
    //     );
    //   }
    // }
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(height: 10),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSigninKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: GoogleFonts.notoSans(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Login to your account',
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF979AA0),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        'Username or email',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF979AA0),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildEmailInput(),
                      const SizedBox(height: 20),
                      Text(
                        'Password',
                        style: GoogleFonts.notoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF979AA0),
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPasswordInput(),
                      const SizedBox(height: 18),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF74904),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.notoSans(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailInput() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF858C95)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: 'Email',
            hintStyle: GoogleFonts.notoSans(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: const Color(0xFF979AA0),
            ),
            border: InputBorder.none,
            suffixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.email_outlined, color: Color(0xFF979AA0)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildPasswordInput() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF858C95)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: passwordController,
          obscureText: true, 
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: GoogleFonts.notoSans(
              fontWeight: FontWeight.w300,
              color: const Color(0xFF979AA0),
            ),
            border: InputBorder.none,
            suffixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.lock_outlined, color: Color(0xFF979AA0)),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            return null;
          },
        ),
      ),
    );
  }
}
