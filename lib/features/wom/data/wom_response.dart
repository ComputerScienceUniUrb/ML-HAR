class WomResponse {
  final int count;
  final String link;
  final String password;
  final String registryUrl;
  final String nonce;
  final String otc;

  WomResponse({
    required this.count,
    required this.link,
    required this.password,
    required this.registryUrl,
    required this.nonce,
    required this.otc,
  });

  /// Crea un'istanza di WomResponse da una mappa.
  /// Lancia un'eccezione se i campi richiesti non sono presenti o del tipo sbagliato.
  factory WomResponse.fromMap(Map<String, dynamic> map) {
    if (map['count'] == null ||
        map['link'] == null ||
        map['password'] == null ||
        map['registryUrl'] == null ||
        map['nonce'] == null ||
        map['otc'] == null) {
      throw const FormatException(
          'La mappa fornita non contiene tutti i campi necessari per WomResponse.');
    }

    return WomResponse(
      count: map['count'] as int,
      link: map['link'] as String,
      password: map['password'] as String,
      registryUrl: map['registryUrl'] as String,
      nonce: map['nonce'] as String,
      otc: map['otc'] as String,
    );
  }

  /// Converte l'istanza di WomResponse in una mappa.
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'link': link,
      'password': password,
      'registryUrl': registryUrl,
      'nonce': nonce,
      'otc': otc,
    };
  }
}
