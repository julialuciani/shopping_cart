import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderPhotos extends StatefulWidget {
  List<String> images;
  SliderPhotos({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<SliderPhotos> createState() => _SliderPhotosState();
}

class _SliderPhotosState extends State<SliderPhotos> {
  int? sliding = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        onPageChanged: (value) {
          sliding = value;
          setState(() {});
        },
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          return Stack(children: [
            SizedBox(
              width: double.maxFinite,
              child: _showImage(widget.images[sliding!]),
              // child: Image.asset(
              //   widget.images[sliding!],
              //   fit: BoxFit.cover,
              // ),
            ),
            Positioned(
              bottom: 20,
              right: 120,
              child: CupertinoSlidingSegmentedControl(
                children: {
                  0: CircleAvatar(
                    radius: changeColorIfSelected(sliding!, 0) ? 5 : 3,
                    backgroundColor: changeColorIfSelected(sliding!, 0)
                        ? Colors.amber
                        : Colors.white,
                  ),
                  1: CircleAvatar(
                    radius: changeColorIfSelected(sliding!, 1) ? 5 : 3,
                    backgroundColor: changeColorIfSelected(sliding!, 1)
                        ? Colors.amber
                        : Colors.white,
                  ),
                  2: CircleAvatar(
                    radius: changeColorIfSelected(sliding!, 2) ? 5 : 3,
                    backgroundColor: changeColorIfSelected(sliding!, 2)
                        ? Colors.amber
                        : Colors.white,
                  ),
                  3: CircleAvatar(
                    radius: changeColorIfSelected(sliding!, 3) ? 5 : 3,
                    backgroundColor: changeColorIfSelected(sliding!, 3)
                        ? Colors.amber
                        : Colors.white,
                  ),
                  4: CircleAvatar(
                    radius: changeColorIfSelected(sliding!, 4) ? 5 : 3,
                    backgroundColor: changeColorIfSelected(sliding!, 4)
                        ? Colors.amber
                        : Colors.white,
                  ),
                },
                backgroundColor: Colors.white.withOpacity(0),
                thumbColor: Colors.white.withOpacity(0),
                groupValue: sliding,
                onValueChanged: (index) {
                  setState(() {
                    sliding = index;
                  });
                },
              ),
            ),
          ]);
        },
      ),
    );
  }
}

bool changeColorIfSelected(int sliding, int newValue) {
  if (sliding == newValue) {
    return true;
  } else {
    return false;
  }
}

Widget _showImage(String image) {
  final uri = Uri.parse(image);
  if (uri.toString().contains('http')) {
    return Image.network(
      uri.toString(),
      fit: BoxFit.cover,
    );
  } else {
    return Image.asset(
      uri.toString(),
      fit: BoxFit.cover,
    );
  }
}
