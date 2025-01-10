import 'package:flutter/material.dart';
import 'package:hello_world/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return DetailMobilePage(place: place);
        } else {
          return DetailDesktopPage(place: place);
        }
      },
    );
  }

  TextStyle informationStyle() {
    return const TextStyle(fontSize: 8);
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(place.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const FavoriteButton()
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: Text(
                place.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.calendar_today_rounded),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        place.openDays,
                        style: informationStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.access_time),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        place.openTime,
                        style: informationStyle(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Rp. 25.000',
                        style: informationStyle(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle informationStyle() {
    return const TextStyle(fontSize: 8);
  }
}

class DetailDesktopPage extends StatefulWidget {
  final TourismPlace place;
  const DetailDesktopPage({super.key, required this.place});

  @override
  State<DetailDesktopPage> createState() => _DetailDesktopPageState();
}

class _DetailDesktopPageState extends State<DetailDesktopPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Wisata Bandung',
              style: TextStyle(
                fontFamily: 'Oxygen',
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(widget.place.imageAsset),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Scrollbar(
                        controller: _scrollController,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListView(
                              controller: _scrollController,
                              scrollDirection: Axis.horizontal,
                              children: widget.place.imageUrls.map(
                                (url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                },
                              ).toList()),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                  child: Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            child: Text(
                              widget.place.name,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 30, fontFamily: 'Oxygen'),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.place.openDays,
                                    style: informationStyle(),
                                  ),
                                ],
                              ),
                              const FavoriteButton()
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.access_time),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.openTime,
                                style: informationStyle(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.monetization_on),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.place.ticketPrice,
                                style: informationStyle(),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              widget.place.description,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontFamily: 'Oxygen', fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  TextStyle informationStyle() {
    return const TextStyle(fontSize: 8);
  }
}
// class DetailScreen extends StatelessWidget {
//   final TourismPlace place;
//   const DetailScreen({super.key, required this.place});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Stack(
//               children: [
//                 Image.asset(place.imageAsset),
//                 SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           child: IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: const Icon(
//                               Icons.arrow_back,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         const FavoriteButton()
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 16),
//               alignment: Alignment.center,
//               child: Text(
//                 place.name,
//                 style: const TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Column(
//                     children: [
//                       const Icon(Icons.calendar_today_rounded),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         place.openDays,
//                         style: informationStyle(),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       const Icon(Icons.access_time),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         place.openTime,
//                         style: informationStyle(),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     children: [
//                       const Icon(Icons.monetization_on_outlined),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         'Rp. 25.000',
//                         style: informationStyle(),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(
//                 vertical: 10,
//                 horizontal: 10,
//               ),
//               child: Text(
//                 place.description,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(
//               height: 250,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: place.imageUrls.map((url) {
//                   return Padding(
//                     padding: const EdgeInsets.all(4),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.network(url),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   TextStyle informationStyle() {
//     return const TextStyle(fontSize: 8);
//   }
// }

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
