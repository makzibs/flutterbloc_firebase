part of 'posts_bloc.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsFetchingSuccessfulState extends PostsState {
  final List<PostDataUiModel> posts;
  PostsFetchingSuccessfulState({
    required this.posts,
  });
}
