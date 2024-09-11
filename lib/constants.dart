const defaultSamplingPeriod = Duration(milliseconds: 10);
const defaultTestDurationInSeconds = 30.0;

const csvUserInfoHeader = [
  'OS',
  'Device',
  'Start_battery_level',
  'isInBatterySaveMode',
  'User_activity_choice',
  'User_smartphone_position',
  'Age',
  'Gender',
  'Height',
  'Weight',
];

const csvSensorsHeader = [
  'Timestamp',
  'Acc_x',
  'Acc_y',
  'Acc_z',
  'Acc_timestamp',
  'Acc_gravity_x',
  'Acc_gravity_y',
  'Acc_gravity_z',
  'Acc_gravity_timestamp',
  'Gyro_x',
  'Gyro_y',
  'Gyro_z',
  'Gyro_timestamp',
  'Magn_x',
  'Magn_y',
  'Magn_z',
  'Magn_timestamp',
  'Activity_recognition',
];