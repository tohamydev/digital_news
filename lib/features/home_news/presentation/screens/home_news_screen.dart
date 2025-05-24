import 'package:digital_news/features/home_news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../components/home_news/breaking_news_card.dart';
import '../logic/home_news_cubit.dart';
import '../logic/home_news_state.dart';
import 'stories_news_screen.dart';
import '../components/home_news/app_title.dart';
import '../components/home_news/categories_list.dart';
import '../components/home_news/news_list.dart';
import '../components/home_news/news_search_bar.dart';

class HomeNewsScreen extends StatefulWidget {
  const HomeNewsScreen({Key? key}) : super(key: key);

  @override
  State<HomeNewsScreen> createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _selectedCategoryNotifier =
      ValueNotifier<String>('general');
  final ScrollController _scrollController = ScrollController();

  final List<String> _categories = [
    'general',
    'business',
    'entertainment',
    'health',
    'science',
    'sports',
    'technology'
  ];

  @override
  void initState() {
    super.initState();
    context
        .read<HomeNewsCubit>()
        .loadTopHeadlines(category: _selectedCategoryNotifier.value);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _selectedCategoryNotifier.dispose();
    super.dispose();
  }

  void _handleSearch(String query) {
    if (query.isNotEmpty) {
      _selectedCategoryNotifier.value = '';
      context.read<HomeNewsCubit>().loadTopHeadlines(query: query);
    } else {
      context
          .read<HomeNewsCubit>()
          .loadTopHeadlines(category: _selectedCategoryNotifier.value);
    }
  }

  void _handleCategoryChange(String category) {
    _selectedCategoryNotifier.value = category;
    _searchController.clear();
    context.read<HomeNewsCubit>().loadTopHeadlines(category: category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeNewsCubit>().loadTopHeadlines(
                category: _selectedCategoryNotifier.value,
              );
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            _buildAppBar(),
            _buildNewsContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.background,
      elevation: 0,
      expandedHeight: 175.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 16.h,
            top: 90.h,
          ),
          child: Column(
            children: [
              NewsSearchBar(
                controller: _searchController,
                onSubmitted: _handleSearch,
              ),
              SizedBox(height: 12.h),
              CategoriesList(
                categories: _categories,
                selectedCategoryNotifier: _selectedCategoryNotifier,
                onCategorySelected: _handleCategoryChange,
              ),
            ],
          ),
        ),
      ),
      title: const AppTitle(),
    );
  }

  Widget _buildNewsContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Breaking News',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            SizedBox(height: 12.h),
            const NewsList(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
