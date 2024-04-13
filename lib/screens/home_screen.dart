import 'package:flutter/material.dart';
import 'package:my_app/screens/jadwal_screen.dart';
import 'package:my_app/screens/news_screen.dart';

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LensLend'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            setState(() {
              isMenuOpen = !isMenuOpen;
            });
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search action
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade50, Colors.white],
              ),
            ),
            child: buildMainContent(),
          ),
          buildDrawer(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildNavBarItem(Icons.home, "Home", HomePage()),
              buildNavBarItem(Icons.person, "Profile", ProfilePage()),
              buildNavBarItem(Icons.settings, "Settings", SettingsPage()),
              buildNavBarItem(Icons.search, "Search", SearchPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMainContent() {
    return ListView(
      children: [
        buildListItem("Sewa Kamera", "Bisa menyewa kamera jenis apapun yang ada di list", Icons.camera_alt, "assets/images/cam.png", context, CameraPage()),
        buildListItem("Sewa Lensa", "Bisa menyewa lensa jenis apapun yang ada di list", Icons.photo_camera, "assets/images/lensa.png", context, LensPage()),
        buildListItem("Sewa Gimbal Stabilizer", "Bisa menyewa gimbal stabilizer jenis apapun yang ada di list", Icons.videocam, "assets/images/gimbal.png", context, GimbalPage()),
        buildListItem("Sewa Drone", "Bisa menyewa drone jenis apapun yang ada di list", Icons.airplanemode_active, "assets/images/drone.png", context, DronePage()),
      ],
    );
  }

  Widget buildDrawer() {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      top: 0,
      bottom: 0,
      left: isMenuOpen ? 0 : -MediaQuery.of(context).size.width * 0.6,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                buildMenuItem(Icons.calendar_month, "Latihan API", NewsScreen()),
                buildMenuItem(Icons.settings_accessibility, "Latihan CRUD SQLite", JadwalScreen()),
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15),
                color: Colors.blue,
                child: Text(
                  'Close Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String label, Widget page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
      onTap: () {
        setState(() {
          isMenuOpen = !isMenuOpen;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }

  Widget buildListItem(String title, String subtitle, IconData icon, String imagePath, BuildContext context, Widget page) {
    return GestureDetector(
      onTap: () {
        // Handle tap on item
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, Widget page) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      tooltip: label,
      color: Colors.blue,
    );
  }
}

// Second Screen Pages
class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: List.generate(9, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // Handle tap on item
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Detail Sewa'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Kamera Mirrorless',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Kamera Mirrorless Cocok Untuk Berpegian Karena Mudah Untuk dibawa',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Harga: Rp. 100.000',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Total Sewa:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp. 100.000',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Handle pemesanan
                            Navigator.of(context).pop(); 
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PemesananPage()), 
                            );
                          },
                          child: Text('Pesan'), 
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/kameragambar.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kamera Mirrorless',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp. 100.000',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PemesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pemesanan'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Daftar Barang Dipesan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // List of ordered items
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Kamera Mirrorless'),
                  subtitle: Text('Rp. 100.000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete item
                    },
                  ),
                ),
                // Add more ListTile for other ordered items if needed
              ],
            ),
          ),
          Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. 100.000',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
class LensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lens Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, 
        padding: EdgeInsets.all(16), 
        mainAxisSpacing: 16, 
        crossAxisSpacing: 16, 
        children: List.generate(9, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Detail Sewa'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Lensa Kit Sony 16-50mm', 
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Lensa Kit Untuk Kamera Sony', 
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Harga: Rp. 100.000', 
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Total Sewa:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp. 100.000', 
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Handle pemesanan
                            Navigator.of(context).pop(); 
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HalamanPemesananLensa()), 
                            );
                          },
                          child: Text('Pesan'), 
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200, 
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), 
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), 
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/sewalensa.jpg', 
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lensa Kit Sony 16-50mm', 
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp. 100.000', 
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HalamanPemesananLensa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pemesanan Lensa'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Daftar Barang Dipesan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // List of ordered items
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Lensa Kit Sony 16-50mm'),
                  subtitle: Text('Rp. 100.000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete item
                    },
                  ),
                ),
                // Add more ListTile for other ordered items if needed
              ],
            ),
          ),
          Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. 100.000',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
class GimbalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gimbal Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Set to 2 columns
        padding: EdgeInsets.all(16), // Add padding around the grid
        mainAxisSpacing: 16, // Add vertical spacing between items
        crossAxisSpacing: 16, // Add horizontal spacing between items
        children: List.generate(9, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // Handle tap on item
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Detail Sewa'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Gimbal Stabilizer', // Replace with item name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Gimbal Stabilizer Kamera', // Replace with item description
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Harga: Rp. 100.000', // Replace with item price
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Total Sewa:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp. 100.000', // Replace with total price
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Handle pemesanan
                            Navigator.of(context).pop(); // Tutup dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HalamanPemesananGimbal()), // Ganti HalamanPemesananGimbal dengan halaman pemesanan yang sesuai
                            );
                          },
                          child: Text('Pesan'), // Ganti teks tombol jika perlu
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200, // Adjust the color for a more elegant look
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Add shadow for depth effect
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Offset of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/sewagimbal.jpg', // Replace with your image path
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gimbal Stabilizer', // Replace with item name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp. 100.000', // Replace with item price
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HalamanPemesananGimbal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pemesanan Gimbal'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Daftar Barang Dipesan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // List of ordered items
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('Gimbal Stabilizer'),
                  subtitle: Text('Rp. 100.000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete item
                    },
                  ),
                ),
                // Add more ListTile for other ordered items if needed
              ],
            ),
          ),
          Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. 100.000',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
class DronePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drone Page'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Set to 2 columns
        padding: EdgeInsets.all(16), // Add padding around the grid
        mainAxisSpacing: 16, // Add vertical spacing between items
        crossAxisSpacing: 16, // Add horizontal spacing between items
        children: List.generate(9, (index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                // Handle tap on item
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Detail Sewa'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'DJI Avata', // Replace with item name
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Drone FPV DJI Avata.', // Replace with item description
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Harga: Rp. 100.000', // Replace with item price
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Total Sewa:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Rp. 100.000', // Replace with total price
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            // Handle pemesanan
                            Navigator.of(context).pop(); // Tutup dialog
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HalamanPemesananDrone()), // Ganti HalamanPemesananDrone dengan halaman pemesanan yang sesuai
                            );
                          },
                          child: Text('Pesan'), // Ganti teks tombol jika perlu
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade200, // Adjust the color for a more elegant look
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Add shadow for depth effect
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Offset of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          'assets/images/sewadrone.jpg', // Replace with your image path
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DJI Avata', // Replace with item name
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp. 100.000', // Replace with item price
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HalamanPemesananDrone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pemesanan Drone'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Daftar Barang Dipesan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // List of ordered items
                ListTile(
                  leading: Icon(Icons.camera),
                  title: Text('DJI Avata'),
                  subtitle: Text('Rp. 100.000'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // Handle delete item
                    },
                  ),
                ),
                // Add more ListTile for other ordered items if needed
              ],
            ),
          ),
          Divider(height: 1, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. 100.000',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle checkout
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text(
                  'Checkout',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Variabel untuk menyimpan path gambar profil
  String _profileImagePath = 'assets/images/fotowahyu.jpg'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              // Ganti gambar profil langsung ke asset image
              setState(() {
                _profileImagePath = 'assets/images/fotowahyu.jpg';
              });
            },
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(_profileImagePath),
              ),
            ),
          ),
          SizedBox(height: 20),
          buildProfileItem(Icons.person, 'Wahyu Palguna', 'Wahyu Palguna'),
          buildProfileItem(Icons.school, 'Pendidikan', 'Universitas Pendidikan Ganesha'),
          buildProfileItem(Icons.location_on, 'Lokasi', 'Singaraja,Bali'),
        ],
      ),
    );
  }

  Widget buildProfileItem(IconData icon, String title, String content) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(content),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey.shade100,
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          buildSettingItem(Icons.person, 'Account', () {
            // Handle account settings
          }),
          buildSettingItem(Icons.notifications, 'Notifications', () {
            // Handle notification settings
          }),
          buildSettingItem(Icons.security, 'Security', () {
            // Handle security settings
          }),
          buildSettingItem(Icons.language, 'Language & Region', () {
            // Handle language and region settings
          }),
          buildSettingItem(Icons.backup, 'Backup & Restore', () {
            // Handle backup and restore settings
          }),
          buildSettingItem(Icons.help, 'Help & Feedback', () {
            // Handle help and feedback
          }),
          buildSettingItem(Icons.info, 'About', () {
            // Handle about settings
          }),
        ],
      ),
    );
  }

  Widget buildSettingItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      tileColor: Colors.grey.shade100,
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: ListView.builder(
        itemCount: 10, // Jumlah item pencarian
        itemBuilder: (context, index) {
          return buildSearchItem(index);
        },
      ),
    );
  }

  Widget buildSearchItem(int index) {
    return Card(
      elevation: 4, 
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16), 
        title: Text(
          'Search Result $index', 
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Description of search result $index', 
        ),
        leading: Icon(Icons.search),
        onTap: () {
          
        },
      ),
    );
  }
}
