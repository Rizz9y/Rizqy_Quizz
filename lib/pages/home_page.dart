import 'package:flutter/material.dart';
import 'gallery_page.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<String> fyiImages = [
      "https://cdn1-production-images-kly.akamaized.net/n9P5Lp66rMcsAWeV31i5l0uIQgs=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/5186751/original/096443500_1744617226-AP25103253402741.jpg",
      "https://cdn0-production-images-kly.akamaized.net/wVnY2tLQktCI2bcpE98JpDAAngE=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/5187016/original/075125100_1744640637-4754d267-d18e-4657-bcce-ae9a13a18cd2.jpeg",
      "https://cdn0-production-images-kly.akamaized.net/o9JkeJW7bLrC84dP_HzrVbZFs5s=/640x360/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/1083728/original/597469629a33d4f3ab57259db1d3c26748.jpg",
    ];

    final List<String> fyiTitles = [
      "Green Day Ubah Lirik Lagu",
      "Jakarta Sinfonietta Rayakan",
      "Ed Sheeran ngamen",
    ];

    final List<String> fyiDates = [
      "14-04-2025",
      "14-04-2025",
      "14-04-2025",
    ];

    final List<String> galleryImages = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaLGEoRcSC2MyKo9Hdm4ELor9Y2fZKipOp2uyOMRF3fhrPjUcTQGmeP2fgIqmkz3TiGgngvUwig1RjGczv9wmcUbt87ZuE1Lk4MRY1JqT3",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSlQRUTIW8Iastk0dGeVLuwLxoexAH281VTw&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkKrJtfluFwa9xyscv_5BEaPO-GamthZRVQA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_coOhKF5f0U3L_RaamYbL9-nxWlPMRE1_ag&s",
    ];

    final List<String> albumImages = [
      "https://i0.wp.com/www.noise11.com/wp/wp-content/uploads/2023/01/SZA-SOS.jpg?resize=400%2C400&ssl=1",
      "https://upload.wikimedia.org/wikipedia/id/2/2b/Bruno_Mars_-_24K_Magic_%28Official_Album_Cover%29.png",
      "https://m.media-amazon.com/images/I/41MygLcY8YL._SY445_SX342_.jpg",
    ];

    final List<String> albumTitles = [
      "SOS",
      "24k Magic",
      "Starboy",
    ];

    final List<String> albumDescriptions = [
      "Album studio kedua oleh penyanyi-penulis lagu asal Amerika Serikat SZA",
      "Album studio ketiga oleh penyanyi-penulis lagu asal Amerika Serikat Bruno Mars.",
      "Third studio album by the Canadian singer-songwriter the Weeknd, released on November 25, 2016, through XO and Republic Records.",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Muhammad Rizqy Tsaqifatul Adzkar"),
        actions: [
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (val) {
              final provider = context.read<ThemeProvider>();
              provider.toggleTheme(val);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/Rizqy.jpg",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // FYI Section
          Text("FYI", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: fyiImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: theme.cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          fyiImages[index],
                          height: 80,
                          width: 160,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fyiTitles[index],
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                fyiDates[index],
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // Gallery Section
          Text("Galeri", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(galleryImages.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GalleryPage(imageUrl: galleryImages[index]),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    galleryImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Disc / Album Section
          Text("Disc", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Column(
            children: List.generate(albumImages.length, (index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    albumImages[index],
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(albumTitles[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(albumDescriptions[index]),
              );
            }),
          ),

          const SizedBox(height: 24),

          // Bio Section
          Text("Bio", style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/Rizqy.jpg"),
            ),
            title: const Text("Muhammad Rizqy Tsaqifatul Adzkar"),
            subtitle: const Text("Stand high"),
          )
        ],
      ),
    );
  }
}
