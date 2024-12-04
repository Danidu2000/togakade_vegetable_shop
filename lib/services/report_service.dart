import '../models/order.dart';
import '../models/report.dart';

class ReportService {
  Report generateDailyReport(List<Order> orders) {
    final date = DateTime.now();
    final filteredOrders = orders.where((order) =>
    order.timestamp.year == date.year &&
        order.timestamp.month == date.month &&
        order.timestamp.day == date.day);

    final totalRevenue =
    filteredOrders.fold(0.0, (sum, order) => sum + order.totalAmount);

    return Report(
      date: date,
      totalOrders: filteredOrders.length,
      totalRevenue: totalRevenue,
    );
  }
}
