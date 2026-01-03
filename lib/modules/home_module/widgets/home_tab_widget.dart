import 'package:flutter/material.dart';
import 'package:throw_app/core/constants/app_colors.dart';
//import 'package:throw_app/modules/delivery_request_module/view/delivery_request_page.dart';
import 'package:throw_app/modules/home_module/models/carousel_data_model.dart';
import 'package:throw_app/modules/home_module/models/grid_button_item_model.dart';
import 'package:throw_app/modules/home_module/widgets/grid_buttons.dart';
import 'package:throw_app/modules/home_module/widgets/home_tab_carousel.dart';

class HomeTabWidget extends StatefulWidget {
  const HomeTabWidget({super.key});

  @override
  State<HomeTabWidget> createState() => _HomeTabWidgetState();
}

class _HomeTabWidgetState extends State<HomeTabWidget> {
  final PageController _carouselController = PageController();
  final ValueNotifier<int> _currentCarouselPage = ValueNotifier<int>(0);

  static const List<CarouselDataModel> _carouselItems = [
    CarouselDataModel(
      image: 'assets/images/fast_and_reliable.webp',
      title: 'Fast & Reliable',
      subtitle: 'Your packages, delivered with care.',
    ),
    CarouselDataModel(
      image: 'assets/images/special_offers.webp',
      title: 'Special Offer',
      subtitle: 'Get 20% off your first delivery.',
    ),
    CarouselDataModel(
      image: 'assets/images/deliver_anything.webp',
      title: 'Deliver Anything',
      subtitle: 'From documents to large parcels.',
    ),
  ];

  late final List<GridButtonItemModel> _gridItems;

  @override
  void initState() {
    super.initState();
    _gridItems = [
      GridButtonItemModel(
        iconImageUrl: 'assets/icons/delivery-bike.png',
        title: 'Create Delivery Request',
        onTap: () {
         // Navigator.push(context, DeliveryRequestPage.route());
        },
      ),
      GridButtonItemModel(
        iconImageUrl: 'assets/icons/order-tracking.png',
        title: 'Track Package',
        onTap: () {},
      ),
    ];
    _carouselController.addListener(() {
      _currentCarouselPage.value = _carouselController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _carouselController.dispose();
    _currentCarouselPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isVerySmallScreen = mediaQuery.size.width < 400;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive dimensions
    final padding = isVerySmallScreen ? 12.0 : 16.0;
    final spacing = isVerySmallScreen ? 16.0 : 24.0;

    return Container(
      color: AppColors.getBackgroundColor(isDark),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Carousel
            ValueListenableBuilder(
              valueListenable: _currentCarouselPage,
              builder: (context, currentCarouselPage, child) {
                return HomeTabCarousel(
                  carouselController: _carouselController,
                  carouselItems: _carouselItems,
                  currentCarouselPage: currentCarouselPage,
                );
              },
            ),
            SizedBox(height: spacing),

            GridButtons(gridItems: _gridItems),
          ],
        ),
      ),
    );
  }
}
