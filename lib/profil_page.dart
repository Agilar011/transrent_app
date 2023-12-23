import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Container 1: Header
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'My Account',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Container 2: User Info
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nama Pengguna',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Noto Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Container 3: User Details
            buildDetailsContainer(),
          ],
        ),
      ),

      // Container 4: Edit Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tambahkan fungsi yang sesuai untuk tombol Edit
          print('Edit button tapped!');
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.edit),
      ),

      // Container 5: Navigation
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavButton(
              icon: Icons.home,
              label: 'Home',
              isActive: false,
              onTap: () {
                // Tambahkan fungsi yang sesuai untuk tombol Home
                print('Home button tapped!');
              },
            ),
            buildNavButton(
              icon: Icons.location_on,
              label: 'Vehicle',
              isActive: false,
              onTap: () {
                // Tambahkan fungsi yang sesuai untuk tombol Vehicle
                print('Vehicle button tapped!');
              },
            ),
            buildNavButton(
              icon: Icons.assignment,
              label: 'Transaction',
              isActive: false,
              onTap: () {
                // Tambahkan fungsi yang sesuai untuk tombol Transaction
                print('Transaction button tapped!');
              },
            ),
            buildNavButton(
              icon: Icons.account_circle,
              label: 'Account',
              isActive: true,
              onTap: () {
                // Tambahkan fungsi yang sesuai untuk tombol Account
                print('Account button tapped!');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to build Container 3: User Details
  Widget buildDetailsContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          buildDetailRow(icon: Icons.contact_phone, text: 'Nama Lengkap'),
          buildDetailRow(icon: Icons.email, text: 'kamu@gmail.com'),
          buildDetailRow(icon: Icons.call, text: '08569871****'),
        ],
      ),
    );
  }

  // Function to build a row for user details
  Widget buildDetailRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 24,
          ),
          const SizedBox(width: 10),
          const VerticalDivider(
            color: Colors.grey,
            width: 1,
          ), // Tambahkan garis vertikal di sini
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a navigation button
  Widget buildNavButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.red : Colors.grey,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.red : Colors.grey,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
