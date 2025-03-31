enum SensorActivityType {
  armRotation,
  clapHands,
  onBicycle,
  inVehicle,
  stand,
  sit,
  talkSit,
  standSit,
  lay,
  jump,
  walk,
  walkOnSpot,
  walkingBack,
  walkingCircle,
  tapisRoulant,
  horizontalCyclette,
  verticalCyclette,
  run,
  runOnSpot;

  String get translate {
    return switch (this) {
      SensorActivityType.armRotation => 'Rotazione delle braccia',
      SensorActivityType.clapHands => 'Battito di mani',
      SensorActivityType.onBicycle => 'Bicicletta',
      SensorActivityType.inVehicle => 'Su veicolo',
      SensorActivityType.stand => 'Fermo in piedi',
      SensorActivityType.standSit => 'Fermo da seduto',
      SensorActivityType.sit => 'Seduto',
      SensorActivityType.talkSit => 'Parlando da seduti',
      SensorActivityType.lay => 'Fermo',
      SensorActivityType.jump => 'Salto',
      SensorActivityType.walk => 'Camminata',
      SensorActivityType.walkOnSpot => 'Camminata sul posto',
      SensorActivityType.walkingBack => 'Camminata all\'indietro',
      SensorActivityType.walkingCircle => 'Camminata in cerchio',
      SensorActivityType.tapisRoulant => 'Tapis Roulant',
      SensorActivityType.horizontalCyclette => 'Cyclette orizzontale',
      SensorActivityType.verticalCyclette => 'Cyclette verticale',
      SensorActivityType.run => 'Corsa',
      SensorActivityType.runOnSpot => 'Corsa sul posto',
    };
  }
}

/*Camminata sul posto,
 fermo (in piedi),

      rotazione delle braccia,).*/

// cyclette: resistenza, standard o recumbent
// tapiroulant: pendenza, velocità

// campionamento
// tagliare i primi 5 secondi di attività
// bip finale con un secondo di ritardo per tagliare la fine della traccia
