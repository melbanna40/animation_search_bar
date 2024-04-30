library animation_search_bar;

import 'package:flutter/cupertino.dart' show CupertinoPageRoute;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ProviderScope, StateProvider, Consumer;

final searchingProvider = StateProvider.autoDispose((ref) => false);

// ignore: must_be_immutable
class AnimationSearchBar extends StatelessWidget {
  AnimationSearchBar({
    super.key,
    required this.iconsColor,
    required this.onChanged,
    this.searchTextEditingController,
    this.searchBarWidth,
    this.searchBarHeight,
    this.previousScreen,
    this.closeIcon,
    this.centerTitle,
    this.centerTitleStyle,
    this.searchFieldHeight,
    this.searchFieldDecoration,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.isBackButtonVisible,
    this.backIcon,
    this.padding,
    this.duration,
  });

  ///
  final double? searchBarWidth;
  final double? searchBarHeight;
  final double? searchFieldHeight;
  final Widget? previousScreen;
  final Widget? closeIcon;
  final Color iconsColor;
  final String? centerTitle;
  final String? hintText;
  final bool? isBackButtonVisible;
  final IconData? backIcon;
  final TextStyle? centerTitleStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Decoration? searchFieldDecoration;
  final EdgeInsets? padding;
  late Duration? duration;
  final TextEditingController? searchTextEditingController;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final duration = this.duration ?? const Duration(milliseconds: 500);
    final searchFieldHeight = this.searchFieldHeight ?? 40;
    final searchBarWidth =
        this.searchBarWidth ?? MediaQuery.sizeOf(context).width - 40;
    final isBackButtonVisible = this.isBackButtonVisible ?? true;
    return ProviderScope(
      child: Consumer(builder: (context, ref, __) {
        final isSearching = ref.watch(searchingProvider);
        final searchNotifier = ref.watch(searchingProvider.notifier);
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SizedBox(
            width: searchBarWidth,
            height: searchBarHeight ?? 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// back Button
                isBackButtonVisible
                    ? AnimatedOpacity(
                        opacity: isSearching ? 0 : 1,
                        duration: duration,
                        child: AnimatedContainer(
                            curve: Curves.easeInOutCirc,
                            width: isSearching ? 0 : 35,
                            height: isSearching ? 0 : 35,
                            duration: duration,
                            child: FittedBox(
                                child: KBackButton(
                                    icon: backIcon,
                                    iconColor: iconsColor,
                                    previousScreen: previousScreen))))
                    : AnimatedContainer(
                        curve: Curves.easeInOutCirc,
                        width: isSearching ? 0 : 35,
                        height: isSearching ? 0 : 35,
                        duration: duration),

                /// text
                AnimatedOpacity(
                  opacity: isSearching ? 0 : 1,
                  duration: duration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    width: isSearching ? 0 : searchBarWidth - 100,
                    duration: duration,
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        centerTitle ?? 'Title',
                        textAlign: TextAlign.center,
                        style: centerTitleStyle ??
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                ),

                /// close search
                AnimatedOpacity(
                  opacity: isSearching ? 1 : 0,
                  duration: duration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    width: isSearching ? 35 : 0,
                    height: isSearching ? 35 : 0,
                    duration: duration,
                    child: FittedBox(
                      child: KCustomButton(
                        widget: Padding(
                            padding: const EdgeInsets.all(3),
                            child: closeIcon ??
                                Icon(Icons.close, color: iconsColor)),
                        onPressed: () {
                          onChanged.call('');
                          searchNotifier.state = false;
                          searchTextEditingController?.clear();
                        },
                      ),
                    ),
                  ),
                ),

                /// input panel
                AnimatedOpacity(
                  opacity: isSearching ? 1 : 0,
                  duration: duration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: duration,
                    width: isSearching ? searchBarWidth - 55 : 0,
                    height: isSearching ? searchFieldHeight : 20,
                    margin: EdgeInsets.only(
                        left: isSearching ? 5 : 0, right: isSearching ? 10 : 0),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: searchFieldDecoration ??
                        BoxDecoration(
                            color: Colors.black.withOpacity(.05),
                            border: Border.all(
                                color: Colors.black.withOpacity(.2), width: .5),
                            borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      controller: searchTextEditingController,
                      cursorColor: iconsColor,
                      style: textStyle ??
                          const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: hintText ?? 'Search here...',
                        hintStyle: hintStyle ??
                            const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300),
                        disabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                ),

                ///  search button
                AnimatedOpacity(
                  opacity: isSearching ? 0 : 1,
                  duration: duration,
                  child: AnimatedContainer(
                    curve: Curves.easeInOutCirc,
                    duration: duration,
                    width: isSearching ? 0 : 35,
                    height: isSearching ? 0 : 35,
                    child: FittedBox(
                      child: KCustomButton(
                          widget: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Icon(Icons.search,
                                  size: 35, color: iconsColor)),
                          onPressed: () => searchNotifier.state = true),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class KCustomButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onPressed;
  final VoidCallback? onLongPress;
  final double? radius;

  const KCustomButton(
      {super.key,
      required this.widget,
      required this.onPressed,
      this.radius,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 50),
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius ?? 50),
            child: InkWell(
                splashColor: Theme.of(context).primaryColor.withOpacity(.2),
                highlightColor: Theme.of(context).primaryColor.withOpacity(.05),
                onTap: onPressed,
                onLongPress: onLongPress,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    child: widget))));
  }
}

class KBackButton extends StatelessWidget {
  final Widget? previousScreen;
  final Color? iconColor;
  final IconData? icon;

  const KBackButton(
      {super.key,
      required this.previousScreen,
      required this.iconColor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
                splashColor: Theme.of(context).primaryColor.withOpacity(.2),
                highlightColor: Theme.of(context).primaryColor.withOpacity(.05),
                onTap: () async {
                  previousScreen == null
                      ? Navigator.pop(context)
                      : Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => previousScreen!));
                },
                child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(icon ?? Icons.arrow_back_ios_new,
                            color: iconColor ?? Colors.black.withOpacity(.7),
                            size: 25))))));
  }
}
