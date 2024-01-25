import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_portfolio_website/utils/colors.dart';

class PortfolioHomePage extends StatefulWidget {
  PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey widgetKey = GlobalKey();

  final LinearGradient gradient = const LinearGradient(
    colors: [AppColours.orange, AppColours.purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final LinearGradient orangeGradient = const LinearGradient(
    colors: [AppColours.orange, AppColours.orangeGradientSecondary],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  final LinearGradient blueGradient = const LinearGradient(
    colors: [AppColours.blueGradientLight, AppColours.blueGradientDark],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  void initState() {
    super.initState();
  }

  void getWidgetPosition() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColours.appBarblack,
        title: const Icon( 
          Icons.web,
          size: 80,
          color: Colors.white,
         ),
        actions: const [
          Text(
            'About',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 72),
          Text(
            'Projects',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 72),
          Text(
            'Experience',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 72),
          Text(
            'Contact',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 32),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 106, horizontal: 16),
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: AppColours.backgroundBlack),
          child: SizedBox(
            width: 810,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // <------------------  Intro Part ---------------------->
                ShaderMask(
                  shaderCallback: (rect) {
                    return gradient.createShader(rect);
                  },
                  child: const CircleAvatar(
                    radius: 100,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'I do code and',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'make content ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (rect) {
                        return gradient.createShader(rect);
                      },
                      child: const Text(
                        'about it',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                const Text(
                  '''I am a seasoned full-stack software engineer with over8 years of professional experience, specializing in backend development.My expertise lies in crafting robust and scalable SaaS-basedarchitectures on the Amazon AWS platform.''',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 56),

                // <------------------- About --------------------------- >
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Get In Touch',
                        style: TextStyle(
                          color: AppColours.backgroundBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        backgroundColor: AppColours.backgroundBlack,
                        side: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      child: const Text(
                        'Download CV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 56),

                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 44, vertical: 90),
                  width: 810,
                  decoration: BoxDecoration(
                    // color: AppColours.careysPink,
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: const AssetImage('assets/images/Saly-16.png'),
                      fit: BoxFit.contain,
                      opacity: size.width > 620
                          ? size.width / 620
                          : size.width / 1300,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Text(
                              'EXPERIENCE WITH',
                              style: TextStyle(
                                color: AppColours.secondartText,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 24,
                              children: List.generate(
                                10,
                                (index) => const Icon(
                                  Icons.abc,
                                  size: 44,
                                  color: AppColours.secondartText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(),
                      ),
                    ],
                  ),
                ),

                // const SizedBox(height: 88),

                ShaderMask(
                  shaderCallback: (rect) {
                    return orangeGradient.createShader(rect);
                  },
                  child: const Text(
                    'PROJECTS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 325,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: 4,
                    itemExtent: 300,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 280,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 1),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          // color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                          // image: const DecorationImage(
                          //   alignment: Alignment.center,
                          //   fit: BoxFit.cover,
                          //   opacity: 0.1,
                          //   image: AssetImage('assets/images/176825.jpg'),
                          // ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  child: Image.asset(
                                    'assets/images/Saly-12.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const ListTile(
                              tileColor: AppColours.appBarblack,
                              selectedTileColor: AppColours.appBarblack,
                              visualDensity: VisualDensity.compact,
                              title: Text(
                                'CLICK HERE TO VISIT',
                                style: TextStyle(
                                  color: AppColours.secondartText,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              subtitle: Text(
                                'CLICK HERE TO VISIT',
                                style: TextStyle(
                                  color: AppColours.secondartText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              trailing: Icon(
                                Icons.link,
                                color: AppColours.secondartText,
                                size: 16.0,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 88),

                ShaderMask(
                  shaderCallback: (rect) {
                    return blueGradient.createShader(rect);
                  },
                  child: const Text(
                    'EXPERIENCE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 56),

                SizedBox(
                  width: 810,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      return const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.logo_dev_rounded,
                                        size: 32,
                                        color: AppColours.secondartText,
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        'EXPERIENCE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21.76,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Nov 2019 - Present',
                                  style: TextStyle(
                                    color: AppColours.lightGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Text(
                              ''' As a Senior Software Engineer at Google, I played a pivotal role in developing innovative solutions for Google's core search algorithms. Collaborating with a dynamic team of engineers, I contributed to the enhancement of search accuracy and efficiency, optimizing user experiences for millions of users worldwide. ''',
                              style: TextStyle(
                                color: AppColours.lightGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 56),

                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 80, horizontal: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Connect Me Through',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(height: 32),
                      Text(
                        '''Seasoned Full Stack Software Engineer with over 8 years of hands-on experience in designing and implementing robust, scalable, and innovative web solutions. Adept at leveraging a comprehensive skill set encompassing front-end and back-end technologies ''',
                        style: TextStyle(
                          color: AppColours.secondartText,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        // softWrap: true,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 32),
                      Text(
                        'palsatyendra9984@gmail.com',
                        style: TextStyle(
                          color: AppColours.secondartText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Icon(
                            Icons.logout,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 24),
                          Icon(
                            Icons.logout,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 24),
                          Icon(
                            Icons.logout,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 24),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
