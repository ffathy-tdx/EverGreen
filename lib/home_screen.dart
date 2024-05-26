import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'selected_images_screen.dart';
import 'scanned_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedImages = [];
  List<String> scannedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFCCEECC),
        elevation: 0,
        leading: Icon(Icons.eco, color: Colors.green[800]),
        actions: [
          Icon(Icons.notifications_none, color: Colors.green[800]),
          Icon(Icons.settings, color: Colors.green[800]),
        ],
      ),
      backgroundColor: Color(0xFFCCEECC),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crops',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: _buildScanButton(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: [
                  _buildGridItem('Apple Leaves', 'assets/apple_leaves.jpg'),
                  _buildGridItem('Oranges Leaves', 'assets/orange_leaves.jpg'),
                  _buildGridItem('Cherry Leaves', 'assets/cherry_leaves.jpg'),
                  _buildGridItem('Lemon Leaves', 'assets/lemon_leaves.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFCCEECC),
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.green[800],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(Icons.camera_alt, color: Colors.green[800]),
                onPressed: () {
                  _takePicture(ImageSource.camera);
                },
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.bar_chart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        //SelectedImagesScreen(images: selectedImages),
                        SelectedImagesScreen(images: scannedImages),

                  ),
                );
              },
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScannedImagesScreen(images: scannedImages),
                  ),
                );
              },
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    return ElevatedButton(
      onPressed: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);

        if (image != null) {
          setState(() {
            scannedImages.add(image.path);
          });
          print('Image path: ${image.path}');
        } else {
          print('No image selected.');
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.green[800],
        backgroundColor: Colors.green[100],
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text('Scan Now', style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildGridItem(String title, String imagePath) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(12.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _takePicture(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      setState(() {
        //selectedImages.add(image.path);
        scannedImages.add(image.path);
      });
      print('Image path: ${image.path}');
    } else {
      print('No image selected.');
    }
  }
}
