# 🛠️ Servio — On-Demand Home Services Booking App (Flutter)

A modern, pixel-perfect, and high-performance **On-Demand Home Services Booking Application** built with **Flutter** and **GetX**. Faithfully crafted from the [Figma Design Specification](https://www.figma.com/design/kA87sOxtTbmoM3WjagpaaG/FE-Test?node-id=0-1&t=rn43oGc3Usl8XHfm-1) as part of the Flutter Developer Technical Assessment.

---

## 🎨 Figma Design Reference
- **Figma Design File**: [Open Flutter Developer Test Design](https://www.figma.com/design/kA87sOxtTbmoM3WjagpaaG/FE-Test?node-id=0-1&t=rn43oGc3Usl8XHfm-1)

---

## 📱 App Screens & Features Overview

##### 👉 App Screen Shots #####
<img width="150" height="300" alt="1" src="https://github.com/user-attachments/assets/748ec2c5-e50f-43a9-b9c2-b501d35f9a44" />
<img width="150" height="300" alt="2" src="https://github.com/user-attachments/assets/aa502557-a4ab-4c09-8be1-44ae623c1432" />
<img width="150" height="300" alt="3" src="https://github.com/user-attachments/assets/3bc6f809-777b-4d91-aeb9-a7a82995646c" />
<img width="150" height="300" alt="5" src="https://github.com/user-attachments/assets/86e8a3b1-8325-4e3a-ab59-47c8ec91008c" />
<img width="150" height="300" alt="4" src="https://github.com/user-attachments/assets/5bdb6da1-2497-4b8f-a7f0-8892053725d5" />

---


## 📱 APK Download

### 👉 [Download Servio Android APK][(https://drive.google.com/file/d/your-apk-link/view?usp=sharing)](https://drive.google.com/file/d/1eY2N06QGoPGi59jghDAxH6yy7owZ4msQ/view?usp=sharing)

> You can download and install the standalone release APK directly on any Android device (Android 5.0+ / API 21+).

---

## 🧱 Architecture Overview

The app follows a clean, modular, and scalable architecture:

```
lib/
├── bottom_navbar/           # Animated bottom navigation bar widget
├── controllers/             # GetX Controllers (HomeController, CategoryController)
├── data/                    # Centralized mock datasets & provider repository
├── models/                  # Data models (ProviderModel, ServiceCategory)
├── routes/                  # Centralized declarative GetX routing & page bindings
├── Screens/                 # Modular UI screens & widgets
│   ├── category/            # Category screen & provider list widgets
│   ├── home/                # Home screen, header & category grid widgets
│   └── provider_profile/    # Detailed provider profile & section widgets
└── utils/
    └── constants/           # Central design tokens (FkColors, FkSizes, FkImages)
```

---

## 🔹 Architectural Choices & Justification

| Choice | Reason |
| :--- | :--- |
| **GetX** | Lightweight, reactive state management, simple dependency injection, and clean declarative routing without boilerplate. |
| **Modular Widgets** | Every screen is broken down into small, focused, and testable widget components inside dedicated `widgets/` directories. |
| **Central Design Tokens** | `FkColors` and `FkSizes` unify the entire app's palette, radii, and responsive layout scalers from a single source of truth. |
| **Adaptive Layout System** | `FkSizes.w()`, `FkSizes.h()`, and `FkSizes.r()` ensure zero pixel overflow across varied screen sizes and densities. |
| **Reactive State (Rx)** | Instant bookmark state synchronization between Home, Category, and Profile screens without full widget rebuilds. |

---

## 📦 Packages Used

| Package | Purpose |
| :--- | :--- |
| `get` | Reactive state management & declarative routing |
| `google_fonts` | Modern typography (Poppins) matching Figma specs |
| `iconsax` | Clean outline and filled vector icons |
| `flutter_animate` | Fluid micro-interactions and entrance animations |
| `animated_bottom_navigation_bar` | Smooth animated bottom navigation bar |
| `cached_network_image` | High-performance image caching with shimmer placeholders |
| `flutter_launcher_icons` | Multi-platform app launcher icon generator |

---

## ⚙️ Setup & Run Instructions

### 1️⃣ Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version `>=3.3.0`)
- [Dart SDK](https://dart.dev/get-dart) (version `>=3.0.0`)
- Android Studio / VS Code with Flutter extension
- Android Device / Emulator or iOS Simulator

### 2️⃣ Clone Repository
```bash
git clone https://github.com/FardeenKhaan/Servio.git
cd servio
```

### 3️⃣ Install Dependencies
```bash
flutter pub get
```

### 4️⃣ Generate App Launcher Icons (Optional)
```bash
dart run flutter_launcher_icons
```

### 5️⃣ Run the Application
```bash
flutter run
```

---

## 📦 Building Standalone Release APK

To build the optimized release APK for testing on an Android device:

```bash
flutter build apk --release
```

The output file will be generated at:
```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧪 Code Quality & Verification

The codebase has been verified against standard Flutter lints:
```bash
flutter analyze
# Output: No issues found! (0 errors, 0 warnings)
```

---

## 👨‍💻 Author

- **Name**: Fardeen Khan
- **Role**: Flutter Developer

---

## 📞 Contact Me

Looking to collaborate or connect? Let's get in touch:
- **Email**: [fardeenkhaan70@gmail.com](mailto:fardeenkhaan70@gmail.com)
- **LinkedIn**: [https://linkedin.com/in/fardeenkhan51](https://linkedin.com/in/fardeenkhan51)
- **Twitter / X**: [https://x.com/KhaanFardeen1](https://x.com/KhaanFardeen1)
