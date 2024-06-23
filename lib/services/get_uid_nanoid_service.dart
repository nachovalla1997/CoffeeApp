import 'package:coffee_app/services_interfaces/i_get_uid_service.dart';
import 'package:coffee_app/utilities/configuration.dart';
import 'package:nanoid/nanoid.dart';

class GetUidNanoidService implements IGetUidService {
  @override
  String getUid() {
    var uniqueId = nanoid(kDefaultLength);
    return uniqueId;
  }
}
