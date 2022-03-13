import 'package:flutter_developer_test/src/export/app_export.dart';

class PostProvider extends GetConnect {
  final _baseUrl = 'jsonplaceholder.typicode.com';
  final _endPoint = 'posts';

  Future<List<PostModel>> getPost() async {
    try {
      List<PostModel> data = [];
      final res = await get('https://$_baseUrl/$_endPoint');
      if (res.isOk && res.bodyString != null) {
        final postData = PostModel.fromJsonList(res.bodyString!);
        data = postData;
      }
      return data;
    } catch (e) {
      print('Error $e');
      return [];
    }
  }
}
