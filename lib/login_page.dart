import 'package:flutter/material.dart';
import 'landing_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage()),
            );
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Container 1
          Transform.translate(
            offset: Offset(0, -40),
            child: Center(
              child: Container(
                width: 300,
                child: Image.asset('../assets/images/login.png'),
              ),
            ),
          ),

          // Container 2
          Transform.translate(
            offset: Offset(0, -40),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Login ke akun anda',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masukkan email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.email, color: Color(0xFF37474F)),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'email@anda.id',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xFF37474F),
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masukkan password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.lock, color: Color(0xFF37474F)),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xFF37474F),
                                fontFamily: 'Poppins',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Container 3
          Transform.translate(
            offset: Offset(0, -40),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality for login button
                  // Navigator.pushNamed(context, '/login'); // Example navigation
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // Container 4
          Transform.translate(
            offset: Offset(0, -1),
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Text(
                'Copyright ©2023 All rights reserved | Transrent.id',
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
