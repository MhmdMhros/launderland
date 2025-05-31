import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  Future<String> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedTheme = prefs.getString('theme');
    return savedTheme?.isNotEmpty == true ? savedTheme! : 'light';
  }

  void setTheme(String theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = AsyncValue.data(theme);
    await prefs.setString('theme', theme);
  }
}
