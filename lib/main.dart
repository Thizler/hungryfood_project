import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // นำเข้าไฟล์การตั้งค่าที่สร้างขึ้น
import 'package:project1_test/cart_page.dart';
import 'package:project1_test/favorite_page.dart';
import 'menu/rice.dart';
import 'menu/burger.dart';
import 'menu/pasta.dart';
import 'menu/noodle.dart';
import 'popu_menu/chicken.dart';
import 'popu_menu/shrimp.dart';
import 'popu_menu/tomato.dart';
import 'popu_menu/baegu.dart';
import 'popu_menu/mayong.dart';
import 'popu_menu/pakgad.dart';
import 'popu_menu/phoenix.dart';
import 'popu_menu/gati.dart';
import 'settingapp/settingapp.dart';
import 'package:provider/provider.dart';
import 'package:project1_test/providers/cart_provider.dart';
import 'package:project1_test/providers/favorite_provider.dart';
import 'package:project1_test/providers/user_provider.dart'; // เพิ่มบรรทัดนี้
import 'login.dart'; // เพิ่มบรรทัดนี้

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()), // เพิ่มบรรทัดนี้
      ],
      child: MyApp(),
    ),
  );
}

void initProviders(BuildContext context, String userId) {
  final cartProvider = Provider.of<CartProvider>(context, listen: false);
  final favoriteProvider =
      Provider.of<FavoriteProvider>(context, listen: false);

  cartProvider.setUser(userId);
  favoriteProvider.setUser(userId);

  print("✅ Providers initialized for user: $userId");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return FutureBuilder(
      future: userProvider.initUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
}else if (snapshot.connectionState == ConnectionState.done) {
  if (snapshot.hasError) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('เกิดข้อผิดพลาด: ${snapshot.error}'),
        ),
      ),
    );
  } else {
    final username = userProvider.username;
    if (username != null) {
      initProviders(context, username);
    }

    return MaterialApp(
      title: 'HUNGRY FOOD',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.themeMode,
      home: username != null ? MyHomePage() : LoginPage(),
    );
  }
}
 else {
          return MaterialApp(
            home: Scaffold(
              body: Center(child: Text('เกิดข้อผิดพลาดในการโหลดแอป')),
            ),
          );
        }
      },
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _searchQuery = ""; // ตัวแปรเก็บข้อความค้นหา

  void _onItemTapped(int index) {
    if (index == 2) {
      // เปิดหน้า Cart
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage()),
      );
    } else if (index == 1) {
      // เปิดหน้า Favorite
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FavoritePage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _onButtonPressed(BuildContext context, String foodName) {
    if (foodName == 'Rice') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RicePage()));
    } else if (foodName == 'Burger') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BurgerPage()));
    } else if (foodName == 'Pasta') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PastaPage()));
    } else if (foodName == 'Noodle') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NoodlePage()));
    }
  }

  void _onIngredientPressed(BuildContext context, String ingredientName) {
    if (ingredientName == 'น่องไก่') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChickenPage()));
    } else if (ingredientName == 'กุ้งแชบ๊วย') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ShrimpPage()));
    } else if (ingredientName == 'มะเขือเทศเชอร์รี่') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TomatoPage()));
    } else if (ingredientName == 'ผักเหลียง') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BaeguPage()));
    } else if (ingredientName == 'มะยงชิด') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MayongPage()));
    } else if (ingredientName == 'ผักกาดหอม') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PakgadPage()));
    } else if (ingredientName == 'ปลาอินทรี') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PhoenixPage()));
    } else if (ingredientName == 'กะทิ') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GatiPage()));
    }
  }

  void _onSettingsPressed(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingApp()));
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase(); // อัปเดตข้อความค้นหา
    });
  }

  List<Map<String, dynamic>> foodList = [
    {'name': 'Rice', 'icon': Icons.rice_bowl},
    {'name': 'Burger', 'icon': Icons.fastfood},
    {'name': 'Pasta', 'icon': Icons.restaurant},
    {'name': 'Noodle', 'icon': Icons.ramen_dining},
  ];

  List<Map<String, dynamic>> popularIngredients = [
    {'name': 'น่องไก่', 'image': 'assets/popu_menu/chicken.jpg'},
    {'name': 'กุ้งแชบ๊วย', 'image': 'assets/popu_menu/shrimp.jpg'},
    {'name': 'มะเขือเทศเชอร์รี่', 'image': 'assets/popu_menu/tomato.jpg'},
    {'name': 'ผักเหลียง', 'image': 'assets/popu_menu/baegu.jpg'},
    {'name': 'มะยงชิด', 'image': 'assets/popu_menu/mayong.jpg'},
    {'name': 'ผักกาดหอม', 'image': 'assets/popu_menu/pakgad.jpg'},
    {'name': 'ปลาอินทรี', 'image': 'assets/popu_menu/phoenix.webp'},
    {'name': 'กะทิ', 'image': 'assets/popu_menu/gati.webp'},
  ];

  List<Map<String, dynamic>> _filterFoodList() {
    return foodList
        .where((food) => food['name'].toLowerCase().contains(_searchQuery))
        .toList();
  }

  List<Map<String, dynamic>> _filterIngredients() {
    return popularIngredients
        .where((ingredient) =>
            ingredient['name'].toLowerCase().contains(_searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredFoodList = _filterFoodList();
    List<Map<String, dynamic>> filteredIngredients = _filterIngredients();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HUNGRY FOOD',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFF9D9D),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _onSettingsPressed(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Color(0xFFffffff),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onChanged:
                            _onSearchChanged, // เรียกฟังก์ชันเมื่อข้อความเปลี่ยน
                        decoration: InputDecoration(
                          hintText: 'พิมพ์ชื่อวัตถุดิบ...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return IndexedStack(
                        index: _selectedIndex,
                        children: [
                          ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Trending Ingredients ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "อัปเดตเมื่อ 03:54",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: filteredIngredients.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () => _onIngredientPressed(context,
                                          filteredIngredients[index]['name']),
                                      child: Container(
                                        width: 150,
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(10)),
                                              child: Image.asset(
                                                filteredIngredients[index]
                                                    ['image'],
                                                width: 150,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                filteredIngredients[index]
                                                    ['name'],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Choose Your Dish",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 10),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.0,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: filteredFoodList.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => _onButtonPressed(context,
                                        filteredFoodList[index]['name']),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF9D9D),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      margin: EdgeInsets.all(4),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              filteredFoodList[index]['icon'],
                                              color: Colors.white,
                                              size: 40,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              filteredFoodList[index]['name'],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "This is your favorite list!",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // ใช้ฟังก์ชัน _onItemTapped
        backgroundColor: Color(0xFFFF9D9D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'FAVORITE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'CART', // เพิ่ม label สำหรับ Cart
          ),
        ],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
