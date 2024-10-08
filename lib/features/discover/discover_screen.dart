import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/profile_images.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils/tap_to_unfocus.dart';
import 'package:tiktok_clone/utils/theme_mode.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> imageUrls = [
    'assets/images/18.jpeg',
  ];

  final tabs = [
    'Top',
    'Users',
    'Videos',
    'Sounds',
    'LIVE',
    'Shopping',
    'Brands',
  ];

  final TextEditingController _textEditingController =
      TextEditingController(text: '');

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onChangeSearchKeyword(String searchKeyword) {
    print('onChange: $searchKeyword');
  }

  void _onSubmitSearchKeyword(String searchKeyword) {
    print('Submitted keyword: $searchKeyword');
  }

  void _onClearSearchKeyword() {
    _textEditingController.clear();
  }

  Widget _getSearchPanel(bool isDark) {
    return CupertinoSearchTextField(
      controller: _textEditingController,
      // itemColor: Colors.black,
      onChanged: _onChangeSearchKeyword,
      onSubmitted: _onSubmitSearchKeyword,
      style: TextStyle(
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }

  Widget _getCustomizedSearchPanel(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: Sizes.size44,
            child: TextField(
              controller: _textEditingController,
              maxLines: 1,
              cursorColor: Theme.of(context).primaryColor,
              textInputAction: TextInputAction.send,
              onChanged: _onChangeSearchKeyword,
              onSubmitted: _onSubmitSearchKeyword,
              clipBehavior: Clip.hardEdge,
              style: const TextStyle(
                fontSize: Sizes.size18,
              ),
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.size8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: kIsWeb ? Sizes.size8 : Sizes.size11,
                    left: Sizes.size8,
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: Sizes.size20,
                    color: isDark ? Colors.grey.shade300 : Colors.black,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    top: kIsWeb ? Sizes.size9 : Sizes.size11,
                    left: kIsWeb ? Sizes.size10 : Sizes.size20,
                  ),
                  child: GestureDetector(
                    onTap: _onClearSearchKeyword,
                    child: FaIcon(
                      FontAwesomeIcons.solidCircleXmark,
                      size: Sizes.size20,
                      color:
                          isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Gaps.h22,
        const FaIcon(
          FontAwesomeIcons.sliders,
          size: Sizes.size28,
        ),
        Gaps.h8,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: () => onTapOutsideAndDismissKeyboard(context),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 1,
            title: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.sm,
              ),
              child: _getSearchPanel(isDark),
            ),
            bottom: TabBar(
              tabAlignment: TabAlignment.start,
              onTap: (value) => onTapOutsideAndDismissKeyboard(context),
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              labelStyle: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                for (var tab in tabs) Tab(text: tab),
              ],
            ),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              var width = constraints.maxWidth;
              var colCount = width < Breakpoints.sm
                  ? 2
                  : width < Breakpoints.md
                      ? 3
                      : 4;
              return TabBarView(
                children: [
                  GridView.builder(
                    // 드래그 시에 keyboard dismiss
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: 20,
                    padding: const EdgeInsets.all(Sizes.size6),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisCount => grid 의 컬럼 개수
                      crossAxisCount: colCount,
                      crossAxisSpacing: Sizes.size8,
                      mainAxisSpacing: Sizes.size20,
                      childAspectRatio: 9 / 21,
                    ),
                    itemBuilder: (context, index) => LayoutBuilder(
                      builder: (context, constraints) => Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Sizes.size4),
                            ),
                            child: AspectRatio(
                              aspectRatio: 9 / 16,
                              child: FadeInImage.assetNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: imageUrls[0],
                                  image:
                                      "https://media.istockphoto.com/id/477057828/photo/blue-sky-white-cloud.jpg?s=612x612&w=0&k=20&c=GEjySNaROrUD7TJUqoXEiBDI9yMmr2hUviSOox4SDlU="),
                            ),
                          ),
                          Gaps.v10,
                          const Text(
                            "This is a very long caption for my tiktok that I'm uploading just for now",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.size18,
                              fontWeight: FontWeight.w500,
                              height: 1.2,
                            ),
                          ),
                          Gaps.v8,
                          if (constraints.maxWidth < 210 ||
                              constraints.maxWidth > 230)
                            DefaultTextStyle(
                              style: TextStyle(
                                color: isDark
                                    ? Colors.grey.shade300
                                    : Colors.grey.shade600,
                                fontSize: Sizes.size14,
                                fontWeight: FontWeight.w500,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: Sizes.size12,
                                    backgroundImage: profileImage,
                                  ),
                                  Gaps.h4,
                                  const Expanded(
                                    child: Text(
                                      'My Avatar is going to be very long',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Gaps.h4,
                                  FaIcon(
                                    FontAwesomeIcons.heart,
                                    size: Sizes.size14,
                                    color: isDark
                                        ? Colors.grey.shade300
                                        : Colors.grey.shade600,
                                  ),
                                  Gaps.h2,
                                  const Text(
                                    '5.2K',
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  for (var tab in tabs.skip(1))
                    Center(
                      child: Text(
                        tab,
                        style: const TextStyle(
                          fontSize: Sizes.size28,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
