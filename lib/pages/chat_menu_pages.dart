import 'package:flutter/material.dart';  
  
class ChatMenuPage extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      appBar: AppBar(  
        title: Text(  
          'Chat Menu',  
          style: TextStyle(  
            color: Colors.white,  
            fontWeight: FontWeight.bold,  
          ),  
        ),  
        backgroundColor: Colors.teal, // Warna latar belakang AppBar  
        elevation: 0, // Hilangkan elevasi AppBar  
        actions: [  
          IconButton(  
            icon: Icon(Icons.search, color: Colors.white),  
            onPressed: () {  
              // Implement search functionality  
            },  
          ),  
        ],  
      ),  
      body: Column(  
        children: [  
          // Search Bar  
          Padding(  
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),  
            child: TextField(  
              decoration: InputDecoration(  
                hintText: 'Search chats...',  
                hintStyle: TextStyle(color: Colors.grey[400]),  
                filled: true,  
                fillColor: Colors.teal[50],  
                border: OutlineInputBorder(  
                  borderRadius: BorderRadius.circular(24),  
                  borderSide: BorderSide.none,  
                ),  
                prefixIcon: Icon(Icons.search, color: Colors.grey[400]),  
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),  
              ),  
            ),  
          ),  
          // Chat List  
          Expanded(  
            child: ListView(  
              children: [  
                // Contoh item chat 1  
                Card(  
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),  
                  elevation: 4,  
                  shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(16), // Sudut melengkung  
                  ),  
                  child: ListTile(  
                    contentPadding: const EdgeInsets.all(16), // Padding di dalam ListTile  
                    leading: CircleAvatar(  
                      backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Gambar kucing  
                      radius: 30,  
                    ),  
                    title: Text(  
                      'Cat 1',  
                      style: TextStyle(  
                        fontWeight: FontWeight.bold,  
                        fontSize: 18,  
                        color: Colors.black87,  
                      ),  
                    ),  
                    subtitle: Text(  
                      'Hello, how are you?',  
                      style: TextStyle(  
                        color: Colors.grey[600],  
                        fontSize: 14,  
                      ),  
                    ),  
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal), // Ikon panah  
                  ),  
                ),  
                // Contoh item chat 2  
                Card(  
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),  
                  elevation: 4,  
                  shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(16), // Sudut melengkung  
                  ),  
                  child: ListTile(  
                    contentPadding: const EdgeInsets.all(16), // Padding di dalam ListTile  
                    leading: CircleAvatar(  
                      backgroundImage: NetworkImage('https://placekitten.com/201/200'), // Gambar kucing  
                      radius: 30,  
                    ),  
                    title: Text(  
                      'Cat 2',  
                      style: TextStyle(  
                        fontWeight: FontWeight.bold,  
                        fontSize: 18,  
                        color: Colors.black87,  
                      ),  
                    ),  
                    subtitle: Text(  
                      'What are you doing?',  
                      style: TextStyle(  
                        color: Colors.grey[600],  
                        fontSize: 14,  
                      ),  
                    ),  
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal), // Ikon panah  
                  ),  
                ),  
                // Tambahkan lebih banyak item chat jika diperlukan  
              ],  
            ),  
          ),  
        ],  
      ),  
      floatingActionButton: FloatingActionButton(  
        onPressed: () {  
          // Implement new chat functionality  
        },  
        backgroundColor: Colors.teal,  
        child: Icon(Icons.message, color: Colors.white),  
      ),  
    );  
  }  
}  
