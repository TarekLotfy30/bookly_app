class EndPoints {
  EndPoints._();

  //---------------------Base url------------------------------
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';

  //----------------------Endpoints-----------------------------
  static const String featuredBooks = '''
volumes?Filtering=free-ebooks&q=subject:Programming''';

  static const String newestBooks = '''
volumes?Filtering=free-ebooks&Sorting=newest &q=computer science''';

  static const String similarBooks =
      'volumes?Filtering=free-ebooks&Sorting=r'
      'elevance &q=subject:Programming';
}
