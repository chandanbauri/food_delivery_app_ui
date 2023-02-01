import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

// Colors

const Color appThemeColor = Color.fromARGB(
  1,
  242,
  247,
  253,
);
const Color primaryTextColor = Color.fromARGB(255, 91, 95, 221);
const Color hilightedTextColor = Color.fromARGB(255, 255, 126, 100);
const Color secondaryColor = Color.fromARGB(134, 26, 30, 150);
const Color iconColor = Color.fromARGB(255, 169, 174, 229);
const Color iconBackGroundColor = Color(0xFFFFFFFF);

MaterialColor appThemeMaterialColor = MaterialColor(
  appThemeColor.value,
  <int, Color>{
    50: appThemeColor.withOpacity(0.1),
    100: appThemeColor.withOpacity(0.2),
    200: appThemeColor.withOpacity(0.3),
    300: appThemeColor.withOpacity(0.4),
    400: appThemeColor.withOpacity(0.5),
    500: appThemeColor.withOpacity(0.6),
    600: appThemeColor.withOpacity(0.7),
    700: appThemeColor.withOpacity(0.8),
    800: appThemeColor.withOpacity(0.9),
    900: appThemeColor.withOpacity(1.0),
  },
);

// Colors

// Constants

// Categories

class Category {
  String name;
  String id;

  Category(this.name, this.id);
}

List<Category> categories = [
  Category('All', 'all'),
  Category('Fruits', 'Fruits'),
  Category('Vegetables', 'Vegetables'),
  Category('Greens', 'Greens'),
  Category('Bakery', 'Bakery'),
];

List<String> imageList = [
  'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
  'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
  'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
  'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
];

// Constats

// Components

class AppBarIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const AppBarIconButton({
    required Key key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
            color: iconBackGroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(20, 0, 0, 0),
                  blurRadius: 10,
                  spreadRadius: 2.0,
                  offset: Offset(1.5, 1.5)),
            ]),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}

class CategoryElement extends StatelessWidget {
  final String categoryName;
  final String categoryId;
  final bool isActive;
  const CategoryElement({
    super.key,
    required this.categoryName,
    required this.categoryId,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: Text(
        categoryName,
        style: TextStyle(
            color: isActive ? hilightedTextColor : primaryTextColor,
            fontSize: 24),
      ),
    );
  }
}

// Components

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: appThemeMaterialColor)
                  .copyWith(
        background: appThemeColor,
      )),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          color: appThemeColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AppBarIconButton(
                      key: const Key('Drawer Menu'),
                      icon: Icons.menu,
                      onTap: () {
                        print('You Tapped Mee !');
                      },
                    ),
                    AppBarIconButton(
                      key: const Key('Drawer Search'),
                      icon: Icons.search,
                      onTap: () {
                        print('You Tapped Mee !');
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 30,
                  child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryElement(
                              categoryName: categories[index].name,
                              categoryId: categories[index].id,
                              isActive: index == 0 ? true : false,
                            );
                          })),
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: GridView.custom(
                        gridDelegate: SliverWovenGridDelegate.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          pattern: const [
                            WovenGridTile(1),
                            WovenGridTile(1),
                          ],
                        ),
                        childrenDelegate:
                            SliverChildBuilderDelegate((context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: Colors.transparent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: imageList[index < imageList.length
                                    ? index
                                    : imageList.length],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                          ;
                        })))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
