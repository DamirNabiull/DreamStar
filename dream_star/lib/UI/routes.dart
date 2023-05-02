import 'package:dream_star/UI/Shared/WithBottomBar/bottom_bar_wrapper.dart';
import 'package:dream_star/UI/Shared/pages/init_page.dart';

final namedRoutes = {
  '/': (context) => const InitPage(),
  '/main': (context) => const BottomBarWrapper(),
};
