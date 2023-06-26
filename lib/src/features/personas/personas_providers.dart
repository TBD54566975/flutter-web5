import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallet_exp/src/features/personas/persona.dart';

final personasProvider = StateProvider<List<Persona>>((ref) => []);
