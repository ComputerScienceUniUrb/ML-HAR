enum SmartphonePosition {
  byHand,
  byHandPortrait,
  pocket,
  pouch,
  handleBar;

  String get translate {
    return switch (this) {
      SmartphonePosition.byHand => 'In mano',
      SmartphonePosition.byHandPortrait => 'In mano verticale',
      SmartphonePosition.pocket => 'In tasca',
      SmartphonePosition.pouch => 'In borsa',
      SmartphonePosition.handleBar => 'Su manubrio',
    };
  }
}
