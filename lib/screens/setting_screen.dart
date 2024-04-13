import 'package:flutter/material.dart';
import 'package:my_app/components/asset_image_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  String _foto(){
    if(_counter % 2 == 0){
      return 'assets/images/icon_flutter.png';
    } else {
      return 'assets/images/flat_img.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile_icon.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wahyu Palguna',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'wahyu.id35@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                // Action ketika item Home di-tap
              },
            ),
            ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings),
              onTap: () {
                // Action ketika item Setting di-tap
              },
            ),
            ListTile(
              title: Text('Item 3'),
              onTap: () {
                // Action ketika item 3 di-tap
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: _counter % 2 == 0 ? Colors.red : Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AssetImageWidget(
                  imagePath: _foto(),
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('gambar merupakan sebuah'),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _increment,
                  icon: Icon(Icons.thumb_up),
                ),
                IconButton(
                  onPressed: _decrement,
                  icon: const Icon(Icons.thumb_down),
                ),
                Text('${_counter.toString()} likes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
