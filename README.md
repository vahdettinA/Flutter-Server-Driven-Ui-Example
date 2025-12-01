📱 Server Driven UI Example (Flutter)

Bu proje, Flutter ile server-driven UI mantığını basit ve anlaşılır bir şekilde göstermek için oluşturulmuştur.
Sunucu tarafından gönderilen yapılandırma verileri (JSON benzeri map yapıları), uygulama içerisinde dinamik widget’lara dönüştürülür. Böylece UI tamamen server tarafından kontrol edilebilir hale gelir.

🔥 Amaç

Flutter'da dinamik arayüz üretmenin mantığını göstermek

Server tarafından gelen verilere göre widget oluşturma

login, register, form gibi ekranların tamamen backend ile kontrol edilebilir olması

Bu proje bir temel örnek niteliğindedir. Gerçek projelerde UI bileşenleri çok daha kapsamlı, tema destekli, validasyonlu ve event yönlendirmeli hale getirilebilir.

🧩 Kullanılan Yapılar

Server tarafından gönderilebilecek örnek UI tanımı:
final List<Map<String, dynamic>> serverUi = [
  {
    "type": "column",
    "children": [
      {
        "type": "text",
        "value": "Welcome Back!",
        "style": {"fontSize": 28.0, "fontWeight": "bold"},
      },
      {
        "type": "text",
        "value": "Please login to continue",
        "style": {"fontSize": 16.0, "color": 0xFF888888},
      },
      {"type": "textfield", "hint": "Email"},
      {"type": "textfield", "hint": "Password", "obscure": true},
      {"type": "button", "title": "Login"},
      {"type": "button", "title": "Register", "isSecondary": true},
    ],
  },
];

