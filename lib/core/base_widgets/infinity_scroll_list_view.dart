import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfinityScrollListView<T> extends StatefulWidget {
  final List<T> startingList;
  final Widget Function(BuildContext context, T data) itemBuilder;
  final Widget? loadingWidget;
  final Widget? noMoreItemWidget;
  final Widget? initialLoading;
  final InfinityScrollController controller;
  const InfinityScrollListView(
      {required this.itemBuilder,
      this.startingList = const [],
      Key? key,
      this.loadingWidget,
      this.initialLoading,
      required this.controller,
      this.noMoreItemWidget})
      : super(key: key);

  @override
  State<InfinityScrollListView<T>> createState() =>
      _InfinityScrollListViewState<T>();
}

class InfinityScrollController<T> {
  final void Function() onGetMoreItem;
  final void Function() onRefresh;
  _InfinityScrollListViewState? _viewState;

  InfinityScrollController(
      {required this.onGetMoreItem, required this.onRefresh});

  _init(_InfinityScrollListViewState state) {
    _viewState = state;
  }

  _dispose() {
    _viewState = null;
  }

  addItem(List<T> item, {bool hasMoreItem = true}) {
    _viewState?._addItem(item, hasMoreItem);
  }

  toggleLoading(bool isLoading) {
    _viewState?._toggleLoading(isLoading);
  }

  toggleNoMoreWidget(bool hasMoreItem) {
    _viewState?._toggleNoMoreWidget(hasMoreItem);
  }
}

class _InfinityScrollListViewState<T> extends State<InfinityScrollListView<T>> {
  final List<T> _list = [];
  late ScrollController _controller;
  bool _isLoading = true;
  bool _hasMoreItem = true;

  @override
  void initState() {
    widget.controller._init(this);
    _list.addAll(widget.startingList);
    _controller = ScrollController();
    _controller.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    final isOnEdge = _controller.position.atEdge;
    print("Is Loading $_isLoading");
    if (isOnEdge && !_isLoading && _hasMoreItem) {
      widget.controller.onGetMoreItem();
    }
  }

  @override
  void dispose() {
    widget.controller._dispose();
    _controller.removeListener(scrollListener);
    _controller.dispose();
    super.dispose();
  }

  _addItem(List<T> item, bool hasMoreItem) {
    setState(() {
      _list.addAll(item);
      _isLoading = false;
      _hasMoreItem = hasMoreItem;
    });
  }

  _toggleLoading(bool isLoading) {
    print("Set Loading too $isLoading");
    setState(() {
      _isLoading = isLoading;
    });
  }

  _toggleNoMoreWidget(bool hasMoreItem) {
    setState(() {
      _hasMoreItem = hasMoreItem;
    });
  }

  int get _loadingIndex => _list.length;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _isLoading = true;
          _hasMoreItem = true;
          _list.clear();
        });
        widget.controller.onRefresh();
      },
      child: ListView.builder(
        controller: _controller,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          if (index == _loadingIndex) {
            if(index == 0) return widget.initialLoading ?? widget.loadingWidget ?? const SizedBox(); 
            if (!_hasMoreItem) {
              return widget.noMoreItemWidget ?? const SizedBox();
            }
            final loadingWidget = widget.loadingWidget ?? const SizedBox();
            return _isLoading ? loadingWidget : const SizedBox();
          }
          return widget.itemBuilder(context, _list[index]);
        },
        itemCount: _list.length + 1,
      ),
    );
  }
}
