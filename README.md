# 🤖 ChatGPT Flutter Uygulaması

OpenAI'nin ChatGPT API'sini kullanarak Flutter ile geliştirilmiş, gerçek zamanlı yapay zeka sohbet uygulaması. Kullanıcılar metin tabanlı sorular sorabilir ve yapay zekadan anlık yanıtlar alabilir.

![ChatGPT Flutter Demo](https://user-images.githubusercontent.com/102540491/213888042-9bc88be8-f9fb-43b5-a768-6f8dbda65e11.png)

---

## ✨ Özellikler

- **Gerçek Zamanlı Sohbet:** OpenAI API ile stream tabanlı anlık mesajlaşma
- **Modern Karanlık Tema:** ChatGPT benzeri koyu renk paleti (#343541, #444654)
- **Yazıyor Animasyonu:** Bot yanıt verirken üç nokta animasyonu
- **Çoklu Platform Desteği:** Android, iOS, Web, Windows, macOS ve Linux
- **Kullanıcı Dostu Arayüz:** Kolay mesaj gönderme ve sohbet geçmişi görüntüleme

---

## 🛠️ Kullanılan Teknolojiler

| Kategori | Teknoloji |
|----------|-----------|
| **Framework** | Flutter (Dart) |
| **API Entegrasyonu** | chat_gpt_sdk (OpenAI API) |
| **HTTP İstekleri** | http ^0.13.5 |
| **UI Kütüphanesi** | velocity_x ^3.6.0 |
| **İkonlar** | cupertino_icons ^1.0.2 |

---

## 📦 Kurulum

### Gereksinimler
- Flutter SDK (>=2.18.6 <3.0.0)
- Dart SDK
- OpenAI API Anahtarı

### Adımlar

1. **Projeyi klonlayın:**
   ```bash
   git clone https://github.com/kullanici/ChatGPT_with_Flutter.git
   cd ChatGPT_with_Flutter
   ```

2. **Bağımlılıkları yükleyin:**
   ```bash
   flutter pub get
   ```

3. **API Anahtarını yapılandırın:**
   
   `lib/constant.dart` dosyasını açın ve OpenAI API anahtarınızı ekleyin:
   ```dart
   const apiSecretKey = "YOUR_OPENAI_API_KEY";
   ```

4. **Uygulamayı çalıştırın:**
   ```bash
   flutter run
   ```

---

## 📱 Platform Özel Komutlar

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome

# Windows
flutter run -d windows
```

---

## 📁 Proje Yapısı

```
lib/
├── main.dart          # Uygulama giriş noktası
├── chat_screen.dart   # Ana sohbet ekranı ve API iletişimi
├── chatmessage.dart   # Mesaj widget'ı
├── constant.dart      # API anahtarı ve sabitler
└── threedots.dart     # Yazıyor animasyonu
```

---

## 📝 Lisans

Bu proje eğitim ve kişisel kullanım amaçlıdır.

---

## 👨‍💻 Geliştirici

Portföy projesi olarak geliştirilmiştir.
