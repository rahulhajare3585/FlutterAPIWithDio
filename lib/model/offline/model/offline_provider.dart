import 'package:hive/hive.dart';
import '../model/provider_response_model.dart';

part 'offline_provider.g.dart'; // This is the part file that will be generated

@HiveType(typeId: 0) // Provide a unique typeId for the model
class OfflineProvider {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String serviceIds;

  @HiveField(3)
  final String? providerGroup;

  OfflineProvider({
    required this.id,
    required this.name,
    required this.serviceIds,
    this.providerGroup,
  });

  // Method to convert OfflineProvider to Provider
  static OfflineProvider fromProvider(Provider provider) {
    return OfflineProvider(
      id: provider.id,
      name: provider.name,
      serviceIds: provider.serviceIds,
      providerGroup: provider.providerGroup,
    );
  }
}
