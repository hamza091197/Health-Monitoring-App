import '../data/models/device_model.dart';

class DeviceService {
  DeviceModel getDeviceStatus() {
    // Replace with actual data fetching logic
    return DeviceModel(batteryLevel: 86, isConnected: true);
  }
}
