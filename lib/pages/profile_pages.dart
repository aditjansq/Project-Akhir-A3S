import 'package:flutter/material.dart';  
import 'package:provider/provider.dart'; // Import provider  
import 'favorites.dart'; // Import your FavoriteCatsProvider  
import 'package:shared_preferences/shared_preferences.dart';  
  
class ProfilePage extends StatefulWidget {  
  const ProfilePage({super.key});  
  
  @override  
  State<StatefulWidget> createState() => _ProfileScreenState();  
}  
  
class _ProfileScreenState extends State<ProfilePage> {  
  bool isSignedIn = true; // Awalnya diatur menjadi true agar tombol 'Keluar' muncul  
  String fullName = '-';  
  String userName = '-';  
  String email = '-';  
  int favoriteCatCount = 0;  
  
  final TextEditingController _fullNameController = TextEditingController();  
  final TextEditingController _emailController = TextEditingController();  
  
  @override  
  void initState() {  
    super.initState();  
    _loadProfileData();  
  }  
  
  Future<void> _loadProfileData() async {  
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    setState(() {  
      fullName = prefs.getString('fullName') ?? '-';  
      email = prefs.getString('email') ?? '-';  
      userName = email.split('@')[0];  
      _fullNameController.text = fullName;  
      _emailController.text = email;  
    });  
  }  
  
  Future<void> _saveProfileData() async {  
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    await prefs.setString('fullName', _fullNameController.text);  
    await prefs.setString('email', _emailController.text);  
    setState(() {  
      fullName = _fullNameController.text;  
      email = _emailController.text;  
      userName = email.split('@')[0];  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    // Access the FavoriteCatsProvider to get the count of favorite cats  
    final favoriteCatsProvider = Provider.of<FavoriteCatsProvider>(context);  
    favoriteCatCount = favoriteCatsProvider.favoriteCats.length;  
  
    return Scaffold(  
      appBar: AppBar(  
        title: const Text('Profile'),  
      ),  
      body: Stack(  
        children: [  
          Container(  
            height: 200,  
            width: double.infinity,  
            color: Colors.cyan[400],  
          ),  
          Padding(  
            padding: const EdgeInsets.only(top: 150, left: 16, right: 16),  
            child: SingleChildScrollView(  
              child: Column(  
                children: [  
                  Align(  
                    alignment: Alignment.topCenter,  
                    child: Stack(  
                      alignment: Alignment.bottomRight,  
                      children: [  
                        Container(  
                          decoration: BoxDecoration(  
                              border: Border.all(  
                                color: Colors.orange,  
                                width: 2,  
                              ),  
                              shape: BoxShape.circle),  
                          child: const CircleAvatar(  
                            radius: 50,  
                            backgroundImage:  
                            AssetImage('assets/images/catProfile.png'),  
                          ),  
                        ),  
                        if (isSignedIn)  
                          IconButton(  
                              onPressed: () {  
                                // Implement camera functionality if needed  
                              },  
                              icon: Icon(  
                                Icons.camera_alt,  
                                color: Colors.deepPurple[50],  
                              ))  
                      ],  
                    ),  
                  ),  
                  const SizedBox(height: 20),  
                  Divider(color: Colors.deepPurple[100]),  
                  const SizedBox(height: 4),  
                  Row(  
                    children: [  
                      SizedBox(  
                        width: MediaQuery.of(context).size.width / 3,  
                        child: const Row(  
                          children: [  
                            Icon(Icons.lock, color: Colors.amber),  
                            SizedBox(width: 8),  
                            Text(  
                              'Pengguna',  
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),  
                            ),  
                          ],  
                        ),  
                      ),  
                      Expanded(  
                        child: Text(  
                          ': $userName',  
                          style: const TextStyle(fontSize: 14),  
                        ),  
                      ),  
                      if (isSignedIn)  
                        IconButton(  
                          onPressed: () {  
                            _showEditDialog(context, 'Username', userName, false);  
                          },  
                          icon: const Icon(Icons.edit),  
                        ),  
                    ],  
                  ),  
                  const SizedBox(height: 4),  
                  Divider(color: Colors.deepPurple[100]),  
                  const SizedBox(height: 4),  
                  Row(  
                    children: [  
                      SizedBox(  
                        width: MediaQuery.of(context).size.width / 3,  
                        child: const Row(  
                          children: [  
                            Icon(Icons.person, color: Colors.blue),  
                            SizedBox(width: 8),  
                            Text(  
                              'Nama',  
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),  
                            ),  
                          ],  
                        ),  
                      ),  
                      Expanded(  
                        child: Text(  
                          ': $fullName',  
                          style: const TextStyle(fontSize: 14),  
                        ),  
                      ),  
                      if (isSignedIn)  
                        IconButton(  
                          onPressed: () {  
                            _showEditDialog(context, 'Nama', fullName, true);  
                          },  
                          icon: const Icon(Icons.edit),  
                        ),  
                    ],  
                  ),  
                  const SizedBox(height: 4),  
                  Divider(color: Colors.deepPurple[100]),  
                  const SizedBox(height: 4),  
                  Row(  
                    children: [  
                      SizedBox(  
                        width: MediaQuery.of(context).size.width / 3,  
                        child: const Row(  
                          children: [  
                            Icon(Icons.email, color: Colors.black),  
                            SizedBox(width: 8),  
                            Text(  
                              'Email',  
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),  
                            ),  
                          ],  
                        ),  
                      ),  
                      Expanded(  
                        child: Text(  
                          ': $email',  
                          style: const TextStyle(fontSize: 14),  
                        ),  
                      ),  
                      if (isSignedIn)  
                        IconButton(  
                          onPressed: () {  
                            _showEditDialog(context, 'Email', email, false);  
                          },  
                          icon: const Icon(Icons.edit),  
                        ),  
                    ],  
                  ),  
                  const SizedBox(height: 4),  
                  Divider(color: Colors.deepPurple[100]),  
                  const SizedBox(height: 4),  
                  Row(  
                    children: [  
                      SizedBox(  
                        width: MediaQuery.of(context).size.width / 3,  
                        child: const Row(  
                          children: [  
                            Icon(Icons.favorite, color: Colors.red),  
                            SizedBox(width: 8),  
                            Text(  
                              'Favorit',  
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),  
                            ),  
                          ],  
                        ),  
                      ),  
                      Expanded(  
                        child: Text(  
                          ': $favoriteCatCount',  
                          style: const TextStyle(fontSize: 14),  
                        ),  
                      ),  
                    ],  
                  ),  
                  const SizedBox(height: 4),  
                  Divider(color: Colors.deepPurple[100]),  
                  const SizedBox(height: 20),  
                  isSignedIn  
                      ? TextButton(  
                          onPressed: () => signOut(context),  
                          style: TextButton.styleFrom(  
                            backgroundColor: Colors.red,  
                            foregroundColor: Colors.white,  
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                            shape: RoundedRectangleBorder(  
                              borderRadius: BorderRadius.circular(8),  
                            ),  
                          ),  
                          child: Text('Keluar'))  
                      : TextButton(  
                          onPressed: signIn,  
                          style: TextButton.styleFrom(  
                            backgroundColor: Colors.blue,  
                            foregroundColor: Colors.white,  
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
                            shape: RoundedRectangleBorder(  
                              borderRadius: BorderRadius.circular(8),  
                            ),  
                          ),  
                          child: const Text('Masuk'))  
                ],  
              ),  
            ),  
          ),  
        ],  
      ),  
    );  
  }  
  
  void _showEditDialog(BuildContext context, String title, String initialValue, bool isFullName) {  
    final TextEditingController _controller = TextEditingController(text: initialValue);  
  
    showDialog(  
      context: context,  
      builder: (BuildContext context) {  
        return AlertDialog(  
          title: Text('Edit $title'),  
          content: TextField(  
            controller: _controller,  
            decoration: InputDecoration(  
              labelText: title,  
            ),  
          ),  
          actions: <Widget>[  
            TextButton(  
              child: const Text('Batal'),  
              onPressed: () {  
                Navigator.of(context).pop();  
              },  
            ),  
            TextButton(  
              child: const Text('Simpan'),  
              onPressed: () {  
                if (isFullName) {  
                  _fullNameController.text = _controller.text;  
                } else {  
                  _emailController.text = _controller.text;  
                  userName = _controller.text.split('@')[0];  
                }  
                _saveProfileData();  
                Navigator.of(context).pop();  
              },  
            ),  
          ],  
        );  
      },  
    );  
  }  
  
  void signIn() {  
    setState(() {  
      isSignedIn = true;  
    });  
  }  
  
  void signOut(BuildContext context) {  
    setState(() {  
      isSignedIn = false;  
    });  
    Navigator.pushReplacementNamed(context, '/');  
  }  
}  
