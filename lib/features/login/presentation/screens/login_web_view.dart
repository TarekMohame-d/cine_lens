import 'package:cine_rank/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/helpers/extensions.dart';
import '../widgets/web_view_login_button.dart';

class LoginWebView extends StatefulWidget {
  const LoginWebView({super.key});

  @override
  State<LoginWebView> createState() => _LoginWebViewState();
}

class _LoginWebViewState extends State<LoginWebView> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          Row(
            children: [
              _buildNavigationButton(
                icon: Icons.arrow_back_ios_new_outlined,
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    await controller.goBack();
                  } else {
                    _showSnackbar(messenger, 'No back history item');
                  }
                },
              ),
              _buildNavigationButton(
                icon: Icons.arrow_forward_ios_outlined,
                onPressed: () async {
                  if (await controller.canGoForward()) {
                    await controller.goForward();
                  } else {
                    _showSnackbar(messenger, 'No forward history item');
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () async => await controller.reload(),
              ),
            ],
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<LoginCubit>().createRequestToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final requestToken = snapshot.data?.requestToken;
          if (requestToken != null) {
            controller
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(
                Uri.parse(
                    'https://www.themoviedb.org/authenticate/$requestToken'),
              );
            return SafeArea(
              child: Column(
                children: [
                  Expanded(child: WebViewWidget(controller: controller)),
                  WebViewLoginButton(requestToken: requestToken),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  IconButton _buildNavigationButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
    );
  }

  void _showSnackbar(ScaffoldMessengerState messenger, String message) {
    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
      ),
    );
  }
}
