import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Container 1
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Center(
                child: Container(
                  width: 200,
                  child: Image.asset('../assets/images/sign.png'),
                ),
              ),
            ),

            // Container 2
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Daftar akun',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Silahkan lengkapi data berikut',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  buildTextFieldWithIcon(Icons.person, 'Nama Lengkap'),
                  buildTextFieldWithIcon(Icons.email, 'email@anda.id'),
                  buildTextFieldWithIcon(Icons.phone, '081********'),
                  buildTextFieldWithIcon(Icons.lock, 'Password'),
                ],
              ),
            ),

            // Container 3
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for sign in button
                  // Navigator.pushNamed(context, '/signin'); // Example navigation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: const Text(
                  'Submit ->',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Container 4
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                'Copyright ©2023 All rights reserved | Transrent.id',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldWithIcon(IconData icon, String hintText) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF37474F)),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Color(0xFF37474F),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
