enum SmartphonePosition {
  byHand,
  byHandPortrait,
  pocket;

  String get translate {
    return switch (this) {
      SmartphonePosition.byHand => 'In mano dinamica',
      SmartphonePosition.byHandPortrait => 'In mano verticale',
      SmartphonePosition.pocket => 'In tasca',
    };
  }
}
