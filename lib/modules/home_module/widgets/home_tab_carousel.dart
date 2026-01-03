import 'package:flutter/material.dart';
import 'package:throw_app/modules/home_module/models/carousel_data_model.dart';

class HomeTabCarousel extends StatelessWidget {
  const HomeTabCarousel({
    super.key,
    required this.carouselController,
    required this.carouselItems,
    required this.currentCarouselPage,
  });

  final PageController carouselController;
  final List<CarouselDataModel> carouselItems;
  final int currentCarouselPage;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Responsive dimensions
    final carouselHeight = isVerySmallScreen ? 120.0 : 160.0;
    final titleFontSize = isVerySmallScreen ? 14.0 : 18.0;
    final subtitleFontSize = isVerySmallScreen ? 12.0 : 14.0;
    final padding = isVerySmallScreen ? 12.0 : 16.0;

    return SizedBox(
      height: carouselHeight,
      child: Stack(
        children: [
          // PageView for carousel
          PageView.builder(
            controller: carouselController,
            itemCount: carouselItems.length,
            itemBuilder: (context, index) {
              final item = carouselItems[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(item.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyle(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          item.subtitle,
                          style: TextStyle(
                            fontSize: subtitleFontSize,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Page Indicators
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                carouselItems.length,
                (index) => Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentCarouselPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
