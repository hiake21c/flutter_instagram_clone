import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchTextBar(),
            const SearchGrid(),
          ],
        ),
      ),
    );
  }
}


class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
            contentPadding: const EdgeInsets.all(0),
            filled: true,
            fillColor: Colors.grey.shade200,
          ),
        ),
      ),
    );
  }
}

final gridItems = [
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
  const GridData(imageUrl: 'https://picsum.photos/seed/picsum/80/80'),
];

class GridData{
  final String imageUrl;

  const GridData({
    required this.imageUrl,
  });
}

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});



  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: gridItems.length,
      itemBuilder: (context, index) => GridItem(gridData: gridItems[index]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing:4,
        mainAxisSpacing: 4,
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final GridData gridData;
  const GridItem({required this.gridData ,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade300,
      ),
      width: 80,
      height: 80,
      child: Image.network(
        gridData.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}



