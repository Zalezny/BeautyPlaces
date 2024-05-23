import 'package:flutter/material.dart';

class DraggableSheetWidget extends StatefulWidget {
  final DraggableScrollableController sheetController;
  final Widget child;
  const DraggableSheetWidget({super.key, required this.sheetController, required this.child});

  @override
  State<DraggableSheetWidget> createState() => _DraggableSheetWidgetState();
}

class _DraggableSheetWidgetState extends State<DraggableSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: DraggableScrollableSheet(
        controller: widget.sheetController,
        shouldCloseOnMinExtent: true,
        minChildSize: 0.2,
        builder: (BuildContext context, scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 4,
                      width: 40,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                SliverList.list(children: [
                  widget.child,
                ])
              ],
            ),
          );
        },
      ),
    );
  }
}
