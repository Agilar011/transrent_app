import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container 1: Header
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Transaksi',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Container 2: Recent History
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                Text(
                  'Recent history',
                  style: TextStyle(
                    color: Color(0xFF8C8C8C),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: 0.40,
                  ),
                ),
                SizedBox(height: 10),

                // Example Group Container (Replace with your dynamic data)
                buildHistoryGroup(
                  imageUrl:
                      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/06/07/Honda-BeAT-Sporty-2023-4025834754.jpg',
                  amount: 'Rp 30.000',
                  status: 'Sedang dilakukan',
                  title: 'Beat 2023',
                ),
                // Add more groups based on your data
                // ... (Add more group containers based on your data)
              ],
            ),
          ),

          // Container 3: Navigation
          Container(
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavButton(
                  icon: Icons.home,
                  label: 'Home',
                  isActive: false,
                  onTap: () {
                    // Tambahkan fungsi yang sesuai untuk tombol Account
                    print('Account button tapped!');
                  },
                ),
                buildNavButton(
                  icon: Icons.location_on,
                  label: 'Vehicle',
                  isActive: false,
                  onTap: () {
                    // Tambahkan fungsi yang sesuai untuk tombol Account
                    print('Account button tapped!');
                  },
                ),
                buildNavButton(
                  icon: Icons.assignment,
                  label: 'Transaction',
                  isActive: true,
                  onTap: () {
                    // Tambahkan fungsi yang sesuai untuk tombol Account
                    print('Account button tapped!');
                  },
                ),
                buildNavButton(
                  icon: Icons.account_circle,
                  label: 'Account',
                  isActive: false,
                  onTap: () {
                    // Tambahkan fungsi yang sesuai untuk tombol Account
                    print('Account button tapped!');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build a history group container
  Widget buildHistoryGroup(
      {String? imageUrl, String? amount, String? status, String? title}) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 66,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                    color: Color(0xFFA51111),
                    fontSize: 20,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.40,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  status!,
                  style: TextStyle(
                    color: Color(0xFFDF6F1D),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.40,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w500,
              letterSpacing: 0.40,
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
    required VoidCallback onTap, // Tambahkan parameter callback onTap
  }) {
    return GestureDetector(
      onTap: onTap, // Setel onTap ke callback yang diberikan
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
