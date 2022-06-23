const String _baseUrl = "https://www.themealdb.com/api/v1/1/";

class API {
  _Data data = _Data();

  static const String baseUrl = "$_baseUrl";
}

class _Data {
  final String category = "${_baseUrl}categories.php";

  String filterCategory(String name) => "${_baseUrl}filter.php?c=$name";
}
