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

List<Map<String, dynamic>> serverUi = [
  {"type": "Text", "title": "Hoş Geldiniz"},
  {"type": "TextField", "hint": "E-mail", "color": Colors.amber},
  {"type": "TextField", "hint": "Password", "color": Colors.red},
  {
    "type": "Button",
    "height": 50,
    "color": Colors.blue,
    "title": "Giriş Yap",
  },
];


Bu yapı uygulama içinde dinamik olarak UI’ya dönüştürülür.

🛠️ Dinamik UI Oluşturma Mantığı
List<Widget> ui = [];
for (var item in serverUi) {
  switch (item["type"]) {
    case "Text":
      ui.add(Text(item["title"]));
      break;

    case "TextField":
      ui.add(
        TextField(
          decoration: InputDecoration(
            hintText: item["hint"],
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: item["color"]),
            ),
          ),
        ),
      );
      break;

    case "Button":
      ui.add(
        SizedBox(
          height: item["height"] ?? 50,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: item["color"]),
            onPressed: () {},
            child: Text(item["title"]),
          ),
        ),
      );
      break;
  }
}
