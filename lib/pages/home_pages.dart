import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'favorites.dart'; // Import your FavoriteCatsProvider
import 'cat_detail_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  final List<Map<String, dynamic>> allCats = [
    {
      "name": "Snowy",
      "age": "1 year",
      "description": "A playful and friendly cat. Loves cuddles.",
      "image":
          "https://res.cloudinary.com/dk0z4ums3/image/upload/v1661753020/attached_image/inilah-cara-merawat-anak-kucing-yang-tepat.jpg",
      "isFavorite": false,
      "breed": "Persian",
      "gender": "Female",
    },
    {
      "name": "Bella",
      "age": "2 years",
      "description": "A calm and gentle companion. Perfect for families.",
      "image":
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIT_WmXHe494_TuL5e6D19V6ahto2XZsLo2w&s',
      "isFavorite": false,
      "breed": "Siamese",
      "gender": "Male",
    },
    {
      "name": "Whiskers",
      "age": "3 years",
      "description": "Active and curious. Loves exploring new places.",
      "image":
          "https://res.cloudinary.com/dk0z4ums3/image/upload/v1729113851/attached_image/kucing-himalaya-kenali-keunikan-dan-cara-merawatnya.jpg",
      "isFavorite": false,
      "breed": "Himalaya",
      "gender": "Female",
    },
    {
      "name": "Boo",
      "age": "4 years",
      "description": "A calm and curious. Love sleep.",
      "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRswM-oB_0gtuJEDBNUqyAofuyzMtsxJNeaRA&s',
      "isFavorite": false,
      "breed": "Bengal",
      "gender": "Male",
    },
    {
      "name": "Cone",
      "age": "1 years",
      "description": "A calm, shy and active. Loves play in yard .",
      "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLxx5ygEaoJ_453WOQPlhsvhZU9OhXiXlntg&s',
      "isFavorite": false,
      "breed": "Maine Coon",
      "gender": "Male",
    },
    {
       "name": "Soko",
      "age": "3 years",
      "description": "A calm and active. Loves exploring new places.",
      "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7fctQ3Y1230x152_dySZLs0MUF_6a7MvReA&s',
      "isFavorite": false,
      "breed": "Persian",
      "gender": "Male",
    },
    {
      "name": "Mochi",
      "age": "2 years",
      "description": "A calm and Strong. Loves get snack.",
      "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm4qHHR8_MhdU-CrGN39ozRGYSl-nzABPcFg&s',
      "isFavorite": false,
      "breed": "Siamese",
      "gender": "Female",
    }
    
  ];

  List<Map<String, dynamic>> filteredCats = [];
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Persian",
    "Siamese",
    "Bengal",
    "Male",
    "Female"
  ];

  @override
  void initState() {
    super.initState();
    filteredCats = allCats;
  }

  void filterByCategory(String category) {
    if (category == "All") {
      setState(() {
        filteredCats = allCats;
      });
    } else {
      setState(() {
        filteredCats = allCats.where((cat) {
          return cat['breed'] == category || cat['gender'] == category;
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "🐾 ",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "Find Your Best Friend!",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Stack(
                children: [
                  Icon(Icons.notifications_none, color: Colors.grey, size: 28),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "3",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Find here...",
                filled: true,
                fillColor: Colors.grey[300],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {
                setState(() {
                  filteredCats = allCats.where((cat) {
                    return cat['name']
                            .toLowerCase()
                            .contains(value.toLowerCase()) ||
                        cat['description']
                            .toLowerCase()
                            .contains(value.toLowerCase());
                  }).toList();
                });
              },
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      filterByCategory(category);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedCategory == category
                            ? Colors.lightBlueAccent
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.pets,
                            color: selectedCategory == category
                                ? Colors.white
                                : Colors.grey[700],
                          ),
                          SizedBox(width: 8),
                          Text(
                            category,
                            style: TextStyle(
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: filteredCats.isEmpty
                  ? Center(
                      child: Text(
                        "No cats found.",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredCats.length,
                      itemBuilder: (context, index) {
                        final cat = filteredCats[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CatDetailPage(
                                  cat: cat,
                                  onFavoriteChanged: (isFavorite) {
                                    setState(() {
                                      cat['isFavorite'] = isFavorite; // Update the cat's favorite status
                                    });
                                  },
                                  otherCats: allCats.where((c) => c != cat).toList(), // Pass other cats except the selected one
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    cat['image'],
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cat['name'],
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        cat['age'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        cat['description'],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    cat['isFavorite']
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: cat['isFavorite']
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  onPressed: () { //fungsi untuk tambahi favorite
                                    final favoriteCatsProvider =
                                        Provider.of<FavoriteCatsProvider>(
                                            context,
                                            listen: false);
                                    if (cat['isFavorite']) {
                                      favoriteCatsProvider.removeFromFavorites(
                                          cat['name']);
                                      Fluttertoast.showToast(
                                          msg: "Removed from Favorites");
                                    } else {
                                      favoriteCatsProvider.addToFavorites(cat);
                                      Fluttertoast.showToast(
                                          msg: "Added to Favorites");
                                    }

                                    setState(() {
                                      cat['isFavorite'] =
                                          !cat['isFavorite'];
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
