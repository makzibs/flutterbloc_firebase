import 'package:bloc_and_firebase/features/posts/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/post_ui_data_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostsBloc postsBloc = PostsBloc();
  List<PostDataUiModel> postDataUiModel = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Page"),
      ),
      body: BlocProvider(
        create: (context) => postsBloc..add(PostsInitialFetchEvent()),
        child: BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {
            if (state is PostsFetchingSuccessfulState) {
              postDataUiModel = state.posts;
            }
          },
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              return Container(
                  child: ListView.builder(
                itemCount: postDataUiModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(postDataUiModel[index].title!),
                  );
                },
              ));
            },
          ),
        ),
      ),
    );
  }
}
