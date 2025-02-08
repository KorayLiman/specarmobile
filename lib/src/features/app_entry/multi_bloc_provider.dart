part of 'app_entry.dart';

@immutable
final class _SpeCarAppEntyMultiBlocProvider extends StatelessWidget {
  const _SpeCarAppEntyMultiBlocProvider({required this.builder});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NetworkManagerBloc>()..add(const NetworkManagerInitializedEvent())),
        BlocProvider(
          create: (context) => getIt<LocalizationBloc>()..add(const LocalizationInitializedEvent()),
          lazy: false,
        ),
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<AuthBloc>()..add(const AuthInitializedEvent())),
      ],
      child: Builder(builder: builder),
    );
  }
}
