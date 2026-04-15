import 'package:equatable/equatable.dart';

class SettingEntity extends Equatable {
  final String clave;
  final String valor;

  const SettingEntity({
    required this.clave,
    required this.valor,
  });

  @override
  List<Object?> get props => [clave, valor];
}
