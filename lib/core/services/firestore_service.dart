import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class FirestoreService {
  /// GET COLLECTION
  final CollectionReference transaction =
      FirebaseFirestore.instance.collection('transaction');

  /// CREATE
  Future<void> addTransaction(int type, String name, int amount,
      String category, DateTime date, String time) {
    print(name);
    return transaction.add({
      'type': type,
      'name': name,
      'amount': amount,
      'category': category,
      'date': date,
      'time': time,
    });
  }

  /// READ
  Stream<QuerySnapshot> getTransactionStream() {
    final transactionStream =
        transaction.orderBy('time', descending: true).snapshots();
    return transactionStream;
  }

  Stream<QuerySnapshot> getTotalTransactionToday() {
    String today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final transactionStream = transaction
        .where('date', isEqualTo: today)
        .orderBy('date', descending: true)
        .snapshots();

    return transactionStream;
  }

  Stream<QuerySnapshot> getTotalTransactionThisMonth() {
    DateTime now = DateTime.now();
    String startOfMonth =
        DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, 1));
    String endOfMonth =
        DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month + 1, 0));

    final transactionStream = transaction
        .where('date', isGreaterThanOrEqualTo: startOfMonth)
        .where('date', isLessThanOrEqualTo: endOfMonth)
        .orderBy('date', descending: true)
        .snapshots();

    return transactionStream;
  }

  Stream<QuerySnapshot> getAllTotalTransaction() {
    final transactionStream =
        transaction.orderBy('date', descending: true).snapshots();
    return transactionStream;
  }

  /// GET
  Future<Map<String, int>> getTotalAmountForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);

    final querySnapshot = await transaction
        .where('date', isGreaterThanOrEqualTo: startOfDay)
        .where('date', isLessThanOrEqualTo: endOfDay)
        .get();

    int totalIncome = 0;
    int totalOutcome = 0;

    for (var doc in querySnapshot.docs) {
      int type = doc['type'];
      int amount = doc['amount'];

      if (type == 1) {
        totalIncome += amount;
      } else if (type == 2) {
        totalOutcome += amount;
      }
    }

    return {
      'income': totalIncome,
      'outcome': totalOutcome,
    };
  }

  Future<Map<String, int>> getTotalAmountForMonth(DateTime date) async {
    final startOfMonth = DateTime(date.year, date.month, 1);
    final endOfMonth = DateTime(date.year, date.month + 1, 0, 23, 59, 59);

    final querySnapshot = await transaction
        .where('date', isGreaterThanOrEqualTo: startOfMonth)
        .where('date', isLessThanOrEqualTo: endOfMonth)
        .get();

    int totalIncome = 0;
    int totalOutcome = 0;

    for (var doc in querySnapshot.docs) {
      int type = doc['type'];
      int amount = doc['amount'];

      if (type == 1) {
        totalIncome += amount;
      } else if (type == 2) {
        totalOutcome += amount;
      }
    }

    return {
      'income': totalIncome,
      'outcome': totalOutcome,
    };
  }

  Future<Map<String, int>> getAllTotalAmount() async {
    final querySnapshot = await transaction.get();

    int totalIncome = 0;
    int totalOutcome = 0;

    for (var doc in querySnapshot.docs) {
      int type = doc['type'];
      int amount = doc['amount'];

      if (type == 1) {
        totalIncome += amount;
      } else if (type == 2) {
        totalOutcome += amount;
      }
    }

    return {
      'income': totalIncome,
      'outcome': totalOutcome,
    };
  }

  /// UPDATE
  Future<void> updateTransaction(String id, int type, String name, int amount,
      String category, DateTime date, String time) {
    return transaction.doc(id).update({
      'type': type,
      'name': name,
      'amount': amount,
      'category': category,
      'date': date,
      'time': time,
    });
  }

  /// DELETE
  Future<void> deleteTransaction(String id) {
    return transaction.doc(id).delete();
  }
}
