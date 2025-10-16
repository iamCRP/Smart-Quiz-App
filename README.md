# Smart Quiz App

A Flutter-based mobile quiz app designed to provide engaging quizzes with Firebase backend support. It includes both **Admin and User functionalities**, allowing admins to manage quizzes and users to attempt them.

---

## 🏆 Features

### **🛠 Admin Features**
- ✏️ **CRUD Operations on Quizzes**: Create, Read, Update, Delete quizzes and questions.  
- 🗂 **Category Management**: Add, update, or remove quiz categories.  
- 👤 **User Management**: View registered users and track their progress.  
- 📊 **Dashboard**: Access overall statistics and quiz completion reports.  
- ☁️ **Firebase Integration**: Real-time updates for all admin activities.

### **👨‍🎓 User Features**
- 📝 **Take Quizzes**: Attempt quizzes across multiple categories.  
- 📈 **View Results**: Check your score immediately after completing a quiz.  
- 🎯 **Progress Tracking**: Track completed quizzes and see your performance.  
- 🔑 **User Authentication**: Register and login securely with email/password.  
- 📱 **Interactive UI**: Smooth and responsive design optimized for mobile devices.

### **⚡ Common Features**
- ☁️ **Firebase Firestore**: Store quiz questions, categories, and user data in real-time.  
- 📐 **Responsive UI**: Works on different Android device sizes.  
- 🧩 **Reusable Widgets**: Cards, buttons, and other UI elements built for modularity.  
- 🧭 **Easy Navigation**: Bottom navigation bar and intuitive screens.  
- 📶 **Offline Handling**: Basic offline support with cached data (if implemented).  

---

## 📸 Screenshots

 view **all screenshots in PDF**: [Screenshots.pdf](assets/Screenshots.pdf)

---

## ⚡ Installation & Setup

1. **Clone the repository**
```bash
git clone https://github.com/iamCRP/Smart-Quiz-App.git
cd Smart-Quiz-App

2. Install dependencies
- flutter pub get

3. Setup Firebase
- Create a Firebase project.
- Download google-services.json (Android) and GoogleService-Info.plist (iOS).
- Place them in:
android/app/ → google-services.json
ios/Runner/ → GoogleService-Info.plist
- Enable Firestore for storing quizzes, categories, and user info.

4. Run the app
- flutter run

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
