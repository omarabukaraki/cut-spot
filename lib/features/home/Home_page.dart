import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> iconServices = [
    'assets/images/salon.png',
    'assets/images/hair-comb.png',
    'assets/images/hair-iron.png',
    'assets/images/hair-treatment.png',
    'assets/images/hairdryer.png',
    'assets/images/facial.png',
    'assets/images/hair-cream.png',
    'assets/images/hair-dye.png',
  ];
  List<String> typeServices = [
    'Hair cut',
    'beard',
    'Creatine',
    'hair straight',
    'Hair dryer',
    'wax',
    'Skin mask',
    'hair dye',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Cut Spot',
            style: TextStyle(
                color: AppColor.kPrimary,
                fontWeight: FontWeight.bold,
                height: 1,
                fontSize: 18)),
        centerTitle: true,
        // backgroundColor: AppColor.kPrimary,
        automaticallyImplyLeading: false,
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(
            Icons.menu_rounded,
            size: 32,
            color: AppColor.kPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Image.asset(
              'assets/images/Logo (1).png',
              width: 32,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTextHome(),
              const DescriptionHomePage(),
              const HeaderTextHome(text: 'Services we provide'),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemCount: iconServices.length,
                  itemBuilder: (context, index) {
                    return CustomServicesComponent(
                      title: typeServices[index],
                      image: iconServices[index],
                    );
                  },
                ),
              ),
              const HeaderTextHome(text: 'Where do you want the service?'),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomServicesComponent(
                      image: 'assets/images/home.png',
                      title: 'At home',
                      width: MediaQuery.of(context).size.width / 2.3,
                    ),
                    CustomServicesComponent(
                      title: 'In the saloon',
                      image: 'assets/images/hair-salon.png',
                      width: MediaQuery.of(context).size.width / 2.3,
                    ),
                  ],
                ),
              ),
              const HeaderTextHome(text: 'Choose your barber'),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 8,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomServicesComponent(
                      image: 'assets/images/barber.png',
                      title: 'Omar',
                      width: 82,
                    );
                  },
                ),
              ),
              const CustomLRButton(
                isDark: true,
                buttonLabel: 'Next',
                paddingVertical: 24,
                paddingHorizontal: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomServicesComponent extends StatelessWidget {
  const CustomServicesComponent(
      {super.key, this.image, this.title, this.height, this.width});
  final String? image;
  final String? title;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.kFontGray, width: 0.5),
        color: AppColor.kWGray,
      ),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(image ?? 'assets/images/salon.png'),
            ),
          ),
          Text(
            title ?? 'Hair cu',
            style: const TextStyle(color: AppColor.kPrimary, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class DescriptionHomePage extends StatelessWidget {
  const DescriptionHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Text(
        'Choose the service you want',
        style: TextStyle(color: AppColor.kFontGray, height: 1, fontSize: 12),
      ),
    );
  }
}

class HeaderTextHome extends StatelessWidget {
  const HeaderTextHome({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(text ?? 'Welcome to Cut Spot Salon!',
          style: const TextStyle(
              color: AppColor.kPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 14)),
    );
  }
}
