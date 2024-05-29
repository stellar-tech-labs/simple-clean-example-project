import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get_api/src/core/config/api_config.dart';
import 'package:get_api/src/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

var client = http.Client();

abstract class PostRemoteDataSource {
  Future<List<PostModel>> fetchPosts();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> fetchPosts() async {
    List<PostModel> postModel = [];
    try {
      String url = ApiConfig.posts;
      var response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        postModel = body.map((e) => PostModel.fromJson(e)).toList();
      } else {
        // If the server responds with an error, throw an exception
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Print the error for debugging purposes
      debugPrint('Error fetching data: $e');
      // Rethrow the error to propagate it further
      rethrow;
    }
    return postModel;
  }
}
