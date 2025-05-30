import 'package:flutter/material.dart';

import '../models/image_model.dart';
import '../repo/image_repository.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function(String) onImageSelected;
  NetworkImagePickerBody({
    Key? key,
    required this.onImageSelected,
  }) : super(key: key);

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelfordImage>>(
        future: _imageRepo.getNetworkImages(),
        builder: (BuildContext context,
            AsyncSnapshot<List<PixelfordImage>> snapshot) {
          if (snapshot.hasData)
            return GridView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      onImageSelected(snapshot.data![index].urlFullSize);
                    },
                    child: Image.network(snapshot.data![index].urlFullSize));
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
              ),
            );
          //return Image.network(snapshot.data![0].urlFullSize);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
