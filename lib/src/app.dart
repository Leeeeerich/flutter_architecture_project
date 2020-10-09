import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_project/src/model/constants/routes.dart';
import 'package:flutter_architecture_project/src/model/repository/repository.dart';
import 'package:flutter_architecture_project/src/model/web_api/client.dart';
import 'package:flutter_architecture_project/src/model/web_api/web_api.dart';
import 'package:flutter_architecture_project/src/model/web_api/web_api_impl.dart';
import 'package:flutter_architecture_project/src/ui/home/first_chat/first_chat_model.dart';
import 'package:flutter_architecture_project/src/ui/home/home_model.dart';
import 'package:flutter_architecture_project/src/ui/ui_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'model/repository/repository_impl.dart';
import 'ui/home/home_screen.dart';
import 'package:http_middleware/http_middleware.dart';

class App extends StatelessWidget {
  final FlutterI18nDelegate _flutterI18nDelegate;
  Repository _repository;
  WebApi _webApi;
  HttpWithMiddleware _client;

  App(this._flutterI18nDelegate) : super();

  @override
  Widget build(BuildContext ctx) {
    _prepare();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => HomeModel()),
        ChangeNotifierProvider(create: (ctx) => FirstChatModel(_repository))
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          _flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        initialRoute: Routes.HOME,
        routes: {
          Routes.HOME: (ctx) => HomeScreen(),
        },
      ),
    );
  }

  Future<bool> _prepare() async {
    try {
      _client = httpClient;
      _webApi = WebApiImpl(_client);
      _repository = RepositoryImpl(_webApi);
      return true;
    } catch (e) {
      showToast("Init error = $e");
      print("Init error = $e");
      return false;
    }
  }
}
