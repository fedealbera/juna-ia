import 'package:go_router/go_router.dart';
import 'package:churo_mobile/features/home/presentation/pages/home_page.dart';
import 'package:churo_mobile/features/webview/presentation/pages/webview_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) {
        final url = state.uri.queryParameters['url'] ?? '';
        final title = state.uri.queryParameters['title'] ?? '';
        return WebViewPage(url: url, title: title);
      },
    ),
  ],
);
