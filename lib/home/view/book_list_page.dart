import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Tambahkan untuk membuka URL

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final TextEditingController _searchController = TextEditingController();

  // Daftar buku dengan URL dan lokasi rak
  final List<Map<String, String>> _allBooks = [
    {
      "title": "Andy's Corner",
      "url": "https://www.perpusnas.go.id/koleksi-umum?keyword=Andy's%20Corner",
      "location": "Rak 000 Lt.2"
    },
    {
      "title": "Dinamika Gerakan koperasi Indonesia",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Dinamika%20Gerakan%20koperasi%20Indonesia",
      "location": "Rak 000 Lt.2"
    },
    {
      "title": "Inovasi Pelayanan Publik Tahun 2021",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Inovasi%20Pelayanan%20Publik%20Tahun%202021",
      "location": "Rak 000 Lt.2"
    },
    {
      "title": "Reformasi Birokrasi",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Reformasi%20Birokrasi",
      "location": "Rak 100 Lt.2"
    },
    {
      "title": "Komunikasi Berkemajuan",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Komunikasi%20Berkemajuan",
      "location": "Rak 100 Lt.2"
    },
    {
      "title": "Komunikasi, Religi",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Komunikasi%20Religi",
      "location": "Rak 100 Lt.2"
    },
    {
      "title": "Rahasia Inovasi Steve Jobs",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Rahasia%20Inovasi%20Steve%20Jobs",
      "location": "Rak 200 Lt.2"
    },
    {
      "title": "Ramadan Karim",
      "url": "https://www.perpusnas.go.id/koleksi-umum?keyword=Ramadan%20Karim",
      "location": "Rak 200 Lt.2"
    },
    {
      "title": "Meraih Keajaiban Rezeki",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Meraih%20Keajaiban%20Rezeki",
      "location": "Rak 200 Lt.2"
    },
    {
      "title": "Jangan Berputus Asa",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Jangan%20Berputus%20Asa",
      "location": "Rak 300 Lt.2"
    },
    {
      "title": "50 Misteri Dunia",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=50%20Misteri%20Dunia",
      "location": "Rak 300 Lt.2"
    },
    {
      "title": "300 KM Menuju Jahannam",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=300%20KM%20Menuju%20Jahannam",
      "location": "Rak 300 Lt.2"
    },
    {
      "title": "INTISARI RIYADHUS SHALIHIN",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=INTISARI%20RIYADHUS%20SHALIHIN",
      "location": "Rak 400 Lt.2"
    },
    {
      "title": "Nanti Kita Sambat Tentang Hari ini",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=Nanti%20Kita%20Sambat%20Tentang%20Hari%20ini",
      "location": "Rak 400 Lt.2"
    },
    {
      "title": "MIMAR WITOE LAR STILL MORE",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=MIMAR%20WITOE%20LAR%20STILL%20MORE",
      "location": "Rak 400 Lt.2"
    },
    {
      "title": "FUNDAMENTALS OF ENGLISH GRAMMAR",
      "url":
          "https://www.perpusnas.go.id/koleksi-umum?keyword=FUNDAMENTALS%20OF%20ENGLISH%20GRAMMAR",
      "location": "Rak 400 Lt.2"
    },
  ];

  List<Map<String, String>> _filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _filteredBooks = _allBooks; // Inisialisasi daftar buku
  }

  void _filterBooks(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredBooks = _allBooks;
      } else {
        _filteredBooks = _allBooks
            .where((book) =>
                book["title"]!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Cari Buku',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) => _filterBooks(query),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredBooks.isEmpty
                  ? const Center(child: Text('Tidak ada buku yang ditemukan.'))
                  : ListView.builder(
                      itemCount: _filteredBooks.length,
                      itemBuilder: (context, index) {
                        final book = _filteredBooks[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(book["title"]!),
                            subtitle: Text(book["location"]!),
                            leading: const Icon(Icons.book),
                            trailing: ElevatedButton(
                              onPressed: () => _launchUrl(book["url"]!),
                              child: const Text('Lihat Online'),
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
