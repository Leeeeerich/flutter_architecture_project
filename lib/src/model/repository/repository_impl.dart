import 'package:flutter_architecture_project/src/model/models/models.dart';
import 'package:flutter_architecture_project/src/model/web_api/web_api.dart';
import 'package:flutter_architecture_project/src/model/web_api/web_utils.dart';

import 'repository.dart';

class RepositoryImpl extends Repository {
  final WebApi _webApi;
  RepositoryImpl(this._webApi);

  @override
  Future<Result<ChatMessage>> sendMessage(ChatMessage message) {
    return _webApi.sendMessage(message);
  }
}