import 'package:flutter/material.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/data/data.dart';
import 'package:netflix_clone/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController? _scrollController;
  double _scrollOffet = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffet = _scrollController!.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit, double>(
          builder: (context, scrollOffset) {
            return CustomAppBar(
              scrollOffset: scrollOffset,
            );
          },
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey('preview'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('my List'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('originals'),
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                key: const PageStorageKey('trending'),
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('cast'),
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
      ),
    );
  }
}
