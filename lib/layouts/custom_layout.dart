
import 'dart:io';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transforms/styles/colors.dart';

class CustomLayout extends StatelessWidget {
  final double? collapsedHeight;
  final double? expandedHeight;
  final Widget? leading;
  final Widget? floatingActionButton;
  final Widget? header;
  final List<Widget> contents;
  final Future<void> Function()? onRefresh; // added for pull-to-refresh
  final Future<void> Function()? lazyFetch;

  static bool _lazyLoad = false;

  const CustomLayout({
    Key? key,
    this.collapsedHeight,
    this.expandedHeight,
    this.floatingActionButton,
    this.leading,
    this.header,
    required this.contents,
    this.onRefresh, this.lazyFetch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        backgroundColor: CustomColor.backgroundColor,
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            _buildBackgroundImages(),
            _buildScrollView(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImages() {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 0,
          child: Image.asset("assets/images/background-3.png"),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          child: Image.asset("assets/images/background-1.png"),
        ),
        Positioned(
          bottom: 100,
          right: 0,
          child: Image.asset("assets/images/background-2.png"),
        ),
      ],
    );
  }

  Widget _buildScrollView(BuildContext context) {
    if (Platform.isIOS) {
      // is iOS
      return NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (lazyFetch != null) {
            if (notification.metrics.pixels == notification.metrics.maxScrollExtent && notification.metrics.maxScrollExtent != 0.0) {
              if (!_lazyLoad) {
                _lazyLoad = true;
                lazyFetch!().then((value) {
                  _lazyLoad = false;
                  return null;
                }).then((value) {
                  _lazyLoad = false;
                  return null;
                });
              }
              
            }
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            if (header != null)
              SliverAppBar(
                elevation: 0,
                collapsedHeight: collapsedHeight,
                expandedHeight: expandedHeight,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: leading,
                floating: true,
                pinned: true,
                flexibleSpace: BlurryContainer(
                  padding: const EdgeInsets.all(0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(0),
                  ),
                  elevation: 0,
                  child: header!,
                ),
              ),
            // refresh
            if (onRefresh != null)
              CupertinoSliverRefreshControl(
                onRefresh: () {
                  return Future(() => onRefresh!());
                }
              ),
            
            SliverToBoxAdapter(
              child: Column(
                children: contents,
              ),
            )
            
          ],
        ),
      );
    } else {
      // is android
      if (onRefresh != null) {
        return NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (lazyFetch != null) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent && notification.metrics.maxScrollExtent != 0.0) {
                if (!_lazyLoad) {
                  _lazyLoad = true;
                  lazyFetch!().then((value) {
                    _lazyLoad = false;
                    return null;
                  }).then((value) {
                    _lazyLoad = false;
                    return null;
                  });
                }
                
              }
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: onRefresh ?? () async {},
            child: CustomScrollView(
              slivers: [
                if (header != null)
                  SliverAppBar(
                    elevation: 0,
                    collapsedHeight: collapsedHeight,
                    expandedHeight: expandedHeight,
                    backgroundColor: CustomColor.backgroundColor,
                    automaticallyImplyLeading: false,
                    leading: leading,
                    floating: true,
                    pinned: true,
                    flexibleSpace: BlurryContainer(
                      elevation: 0,
                      child: SafeArea(
                        child: header!,
                      ),
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Column(
                    children: contents,
                  ),
                )
              ],
            )
          ),
        );
      } else {
        return NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (lazyFetch != null) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent && notification.metrics.maxScrollExtent != 0.0) {
                if (!_lazyLoad) {
                  _lazyLoad = true;
                  lazyFetch!().then((value) {
                    _lazyLoad = false;
                    return null;
                  }).then((value) {
                    _lazyLoad = false;
                    return null;
                  });
                }
                
              }
            }
            return false;
          },
          child: CustomScrollView(
            slivers: [
              if (header != null)
                SliverAppBar(
                  elevation: 0,
                  collapsedHeight: collapsedHeight,
                  expandedHeight: expandedHeight,
                  backgroundColor: CustomColor.backgroundColor,
                  automaticallyImplyLeading: false,
                  leading: leading,
                  floating: true,
                  pinned: true,
                  flexibleSpace: BlurryContainer(
                    child: SafeArea(
                      child: header!,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                child: Column(
                  children: contents,
                ),
              )
            ],
          ),
        );
      }
    }
  }
}
