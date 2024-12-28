part of 'app_entry.dart';

@immutable
final class _SpeCarAppEntryMultiBlocListener extends StatelessWidget {
  const _SpeCarAppEntryMultiBlocListener({required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: const [],
      child: Builder(
        builder: builder,
      ),
    );
  }
}
