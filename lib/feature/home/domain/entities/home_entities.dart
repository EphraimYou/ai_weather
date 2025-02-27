import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final double temperature;
  final int humidity;
  final double precipitation;
  final int cloudiness;

  const WeatherEntity({
    required this.temperature,
    required this.humidity,
    required this.precipitation,
    required this.cloudiness,
  });

  /// Calculates weather categories as a list of 0s and 1s
  /// - Index 0: Rainy (1 if precipitation > 0)
  /// - Index 1: Sunny (1 if no clouds and no rain)
  /// - Index 2: Hot (1 if temperature > 30°C)
  /// - Index 3: Mild (1 if 20°C ≤ temperature ≤ 30°C)
  /// - Index 4: Humid (1 if humidity > 60%)

  List<int> weatherCategory() {
    List<int> predictionList = [
      (precipitation > 0.5 || cloudiness > 70) ? 1 : 0, // Rainy
      (cloudiness < 30 && precipitation == 0) ? 1 : 0, // Sunny
      (temperature > 30.0) ? 1 : 0, // Hot
      (temperature >= 20.0 && temperature <= 30.0) ? 1 : 0, // Mild
      (humidity > 60) ? 1 : 0
    ];
    print('list of int : $predictionList');
    return predictionList;
  }

  @override
  List<Object?> get props => [temperature, humidity, precipitation, cloudiness];
}
