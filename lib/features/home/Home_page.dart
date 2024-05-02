import 'package:cut_spot/core/utils/app_color.dart';
import 'package:cut_spot/features/auth/presentation/views/widget/login_register_widget/custom_lr_button.dart';
import 'package:flutter/material.dart';
import '../select_time/select_time_page.dart';
import 'widget/custom_services_component.dart';
import 'widget/description_home_page.dart';

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
                  physics: const NeverScrollableScrollPhysics(),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomServicesComponent(
                        image: 'assets/images/home.png',
                        title: 'At home',
                      ),
                    ),
                    Expanded(
                      child: CustomServicesComponent(
                        title: 'In the saloon',
                        image: 'assets/images/hair-salon.png',
                      ),
                    )
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
              CustomLRButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SelectTimePage();
                    },
                  ));
                },
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
