import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_and_firebase/features/posts/models/post_ui_data_model.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  Future<FutureOr<void>> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<dynamic> emit) async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

      List<dynamic> results = jsonDecode(response.body);

      for (int i = 0; i < results.length; i++) {
        PostDataUiModel post =
            PostDataUiModel.fromJson(results[i] as Map<String, dynamic>);
        posts.add(post);
      }

      print(posts);

      emit(PostsFetchingSuccessfulState(posts: posts));
    } catch (e) {
      print(e.toString());
    }
  }
}
