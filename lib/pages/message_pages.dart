import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagePage(),
    );
  }
}

class MessagePage extends StatelessWidget {
  // Data kucing dan pesan adopsi
  final List<Map<String, String>> chatHistory = [
    {
      'catName': 'Snowy',
      'lastMessage': 'I’m interested in adopting Snowy. Can I visit?',
      'time': '10:30 AM',
      'image':
          'https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg',
    },
    {
      'catName': 'Bella',
      'lastMessage': 'Can I know more about Bella’s behavior?',
      'time': 'Yesterday',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIT_WmXHe494_TuL5e6D19V6ahto2XZsLo2w&s',
    },
    {
      'catName': 'Whiskers',
      'lastMessage': 'Is Whiskers still available for adoption?',
      'time': 'Monday',
      'image':
          'https://res.cloudinary.com/dk0z4ums3/image/upload/v1729113851/attached_image/kucing-himalaya-kenali-keunikan-dan-cara-merawatnya.jpg',
    },
    {
      'catName': 'Boo',
      'lastMessage': 'What is Boo’s favorite food?',
      'time': 'Last week',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRswM-oB_0gtuJEDBNUqyAofuyzMtsxJNeaRA&s',
    },
  ];

  MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adoption Chat History'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: chatHistory.isEmpty
          ? Center(
              child: Text(
                'No chats yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(chat['image']!),
                    ),
                    title: Text(
                      chat['catName'] ?? 'Unknown',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      chat['lastMessage'] ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      chat['time'] ?? 'Now',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      // Aksi ketika ListTile ditekan
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Chat with ${chat['catName']}'),
                          content: Text(chat['lastMessage'] ?? 'No message'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
