part of 'app_entry.dart';

@immutable
final class _SpeCarAppEntyMultiBlocProvider extends StatelessWidget {
  const _SpeCarAppEntyMultiBlocProvider({required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: Builder(builder: builder),
    );
  }
}
