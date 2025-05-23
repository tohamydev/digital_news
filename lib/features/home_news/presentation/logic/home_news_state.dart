import 'package:equatable/equatable.dart';
import '../../domain/entities/article.dart';

abstract class HomeNewsState extends Equatable {
  const HomeNewsState();

  @override
  List<Object> get props => [];
}

class HomeNewsInitial extends HomeNewsState {}

class HomeNewsLoading extends HomeNewsState {}

class HomeNewsLoaded extends HomeNewsState {
  final List<Article> articles;

  const HomeNewsLoaded(this.articles);

  @override
  List<Object> get props => [articles];
}

class HomeNewsError extends HomeNewsState {
  final String message;

  const HomeNewsError(this.message);

  @override
  List<Object> get props => [message];
}
