import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart ';
import 'package:transrent_app/profil_page.dart';
import 'package:transrent_app/product_page.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Container 1: Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: const Align(
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                const Text(
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
                const SizedBox(height: 10),

                // Example Group Container (Replace with your dynamic data)
                buildHistoryGroupButton(
                  imageUrl:
                      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/06/07/Honda-BeAT-Sporty-2023-4025834754.jpg',
                  amount: 'Rp 30.000',
                  status: 'Sedang dilakukan',
                  title: 'Beat 2023',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProduct(
                          imageUrl:
                              'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/06/07/Honda-BeAT-Sporty-2023-4025834754.jpg',
                          title: 'Beat 2023',
                          price: 'Rp 30.000',
                          description:
                              'Skutik 110cc dari honda yang keluar pada tahun 2023. Motor ini merupakan motor yang sesuai untuk medan perkotaan dengan pace yang cukup kencang. Motor ini juga memiliki fitur yang cukup lengkap untuk motor skutik.',
                        ),
                      ),
                    );
                  },
                ),
                // Add more groups based on your data
                // ... (Add more group containers based on your data)
              ],
            ),
          ),

          // Container 3: Navigation
          Container(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionPage()));
                  },
                ),
                buildNavButton(
                  icon: Icons.account_circle,
                  label: 'Account',
                  isActive: false,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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
  Widget buildHistoryGroupButton({
    required String imageUrl,
    required String amount,
    required String status,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
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
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title!,
                      style: const TextStyle(
                        color: Color(0xFFA51111),
                        fontSize: 20,
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.40,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      status!,
                      style: const TextStyle(
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
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Work Sans',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.40,
                ),
              ),
            ],
          ),
        ));
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
