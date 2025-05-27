import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/models/banner_model/banner_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Banners extends StatefulWidget {
  const Banners({super.key, required this.banners});
  final List<BannerModel> banners;

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            height: 160.0,
            enableInfiniteScroll: false,
            padEnds: false,
            viewportFraction: 0.999,
          ),
          items: widget.banners.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 366,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        imageUrl: i.mediaUrls!.images![0].image!,
                        fit: BoxFit.cover,
                        errorWidget: (context, error, stackTrace) {
                          return Center(
                            child: Image.asset(
                              'assets/images/placeholder.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        widget.banners.isEmpty
            ? SizedBox.shrink()
            : AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: widget.banners.length,
                effect: WormEffect(
                  type: WormType.thin,
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Color(0xFFFC5005),
                  dotColor: const Color.fromARGB(255, 237, 237, 237),
                ),
              )
      ],
    );
  }
}
