# Project: Hungry Food (Mobile App)

HUNGRY FOOD เป็นแอปมือถือที่ช่วยให้ผู้ใช้สามารถเลือกดูเมนูอาหารตามหมวดหมู่ หรือค้นหาวัตถุดิบยอดนิยมเพื่อดูเมนูที่เกี่ยวข้อง พร้อมฟีเจอร์เพิ่มของโปรด เพิ่มสินค้าในตะกร้า และระบบล็อกอินผ่าน Firebase เหมาะสำหรับคนที่กำลังมองหาแรงบันดาลใจในการทำอาหารหรือสั่งอาหารแบบสะดวกสบาย

# Features

- ✅ รายการอาหารแยกหมวดหมู่
- ❤️ เพิ่มรายการโปรด
- 🛒 เพิ่มของลงตะกร้า
- 🔒 ระบบล็อกอิน
- 🔍 ค้นหาวัสถุดิบ

# Technologies Used

- Flutter
- Firebase (Auth, Firestore)
- Provider (State Management)
- Node.js (ver. 18, 20, 22)

# Data Structures

```bash
lib/
├── main.dart
├── login.dart
├── providers/
│   ├── user_provider.dart
│   └── ...
├── menu/
├── popu_menu/
└── settingapp/
```

# Setup Instructions

```bash
npm i -g firebase-tools
dart pub global activate flutterfire_cli
```

```bash
git clone https://github.com/Thizler/hungryfood_project.git
cd your-project
flutter pub get
flutter run
```

Dev by Kunanon, Aekkapop, Patcharapon
