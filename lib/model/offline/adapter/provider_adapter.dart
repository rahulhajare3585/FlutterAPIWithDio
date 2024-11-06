import 'package:flutter_api_intrgration/model/offline/model/provider_response_model.dart';
import 'package:hive/hive.dart';

class ProviderAdapter extends TypeAdapter<Provider> {
  @override
  final int typeId = 0;

  @override
  Provider read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final serviceIds = reader.readString();
    final providerGroup = reader.readString(); // Assuming this can be null

    return Provider(
      id: id,
      name: name,
      serviceIds: serviceIds,
      providerGroup:
          providerGroup.isEmpty ? null : providerGroup, // Handle nullable
    );
  }

  @override
  void write(BinaryWriter writer, Provider obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.serviceIds);
    writer.writeString(obj.providerGroup ?? ''); // Handle nullable
  }
}
