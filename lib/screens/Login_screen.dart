import 'package:facebookapp_clone/basic_app/homepage.dart';
import 'package:flutter/material.dart';

class LoginScreenState extends StatefulWidget {
  const LoginScreenState({super.key});

  @override
  State<LoginScreenState> createState() => _LoginScreenStateState();
}

class _LoginScreenStateState extends State<LoginScreenState> {
  final _emailCtrl = TextEditingController();
  final _passCtr = TextEditingController();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook,
                  size: 80, color: Colors.indigo), // Facebook Icon
              const SizedBox(height: 100),
              _buildEmailTextField(),
              const SizedBox(height: 10),
              _buildPasswordTextField(),
              _buildLoginButton(),
              _buildForgotPasswordButton(),
              const SizedBox(height: 200),
              _buildCreateAccountButton(),
              const SizedBox(height: 20), // Add spacing between buttons and logos
              _buildMetaLogos(), // Add the Meta logos section
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      controller: _emailCtrl,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Mobile number or email",
        hintStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      controller: _passCtr,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(
            _hidePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _hidePassword = !_hidePassword;
            });
          },
        ),
      ),
      obscureText: _hidePassword,
    );
  }

  Widget _buildLoginButton() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_emailCtrl.text == "admin@gmail.com" && _passCtr.text == "112233") {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomepageScreen(),
                ),
              );
            } else {
              _showErrorDialog();
            }
          },
          child: const Text("Log in"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.indigo,
      ),
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildCreateAccountButton() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.blue,
          side: const BorderSide(color: Colors.blue, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text("Create new account",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // Method to display an error dialog when login fails
  void _showErrorDialog() {
    // Calls the Flutter built-in function to show a dialog box
    showDialog(
      context:
          context, // Provides the current widget context to display the dialog

      // The builder creates the dialog UI
      builder: (BuildContext context) {
        return AlertDialog(
          // Creates an AlertDialog widget (standard popup dialog box)

          // Title of the dialog
          title: const Text(
            "Wrong Credentials", // The title text displayed at the top of the dialog
            style: TextStyle(
                fontWeight: FontWeight.bold), // Makes the title text bold
            textAlign: TextAlign.center, // Centers the title text
          ),

          // Content with controlled height and divider
          content: const SizedBox(
            height: 46, // Increased height to fit the divider
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Invalid username or password",
                  textAlign: TextAlign.center, // Center the content text
                ),
                SizedBox(height: 10), // Space between text and line
                Divider(
                  thickness: 1, // Thickness of the line
                  color: Colors.grey, // Grey color line
                ),
              ],
            ),
          ),

          // Aligns the action buttons at the bottom of the dialog
          actionsAlignment:
              MainAxisAlignment.center, // Centers the button horizontally

          // List of action buttons (can have multiple buttons)
          actions: [
            TextButton(
              // A simple text-based button
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog when pressed
              },
              child: const Text(
                "OK",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ), // The label of the button
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetaLogos() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/logo_meta.png", height: 30, width: 30),
          const Text(
              "​​​​​ ​Meta",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
