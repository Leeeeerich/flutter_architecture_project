import 'package:flutter_architecture_project/src/model/models/models.dart';
import 'package:flutter_architecture_project/src/model/web_api/web_utils.dart';

abstract class Repository {
  Future<Result<ChatMessage>> sendMessage(ChatMessage message);
}