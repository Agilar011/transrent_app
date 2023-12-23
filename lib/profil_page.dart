import 'package:flutter/material.dart';
import 'package:transrent_app/transaction_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 0, 0),
        elevation: 0,
        title: const Text('My Account'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransactionPage()));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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

          // Expanded untuk memberikan ruang yang diperlukan
          const Expanded(
            child: const SingleChildScrollView(
              reverse: true, // Membuat konten muncul dari bawah ke atas
              child: Column(
                children: [
                  // ... (Tambahkan konten lainnya di sini)
                ],
              ),
            ),
          ),
        ],
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
}
