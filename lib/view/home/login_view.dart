import 'package:flow/view/home/auth_providers.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Continue with',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                  onPressed: () => signInWithGitHub(),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/github_icon.png',
                        color: Colors.white,
                        width: 16,
                        height: 16,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text('Github'),
                      )
                    ],
                  )),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  onPressed: () => signInWithGoogle(),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/google_icon.png',
                        width: 16,
                        height: 16,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Text('Google'),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
