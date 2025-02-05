import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET COLLECTION
  final CollectionReference transaction =
      FirebaseFirestore.instance.collection('transaction');
  // CREATE
  Future<void> addTransaction(
      String name, int amount, String category, DateTime date, String time) {
    print(name);
    return transaction.add({
      'name': name,
      'amount': amount,
      'category': category,
      'date': date,
      'time': time,
    });
  }

  // READ
  Stream<QuerySnapshot> getTransactionStream() {
    final transactionStream =
        transaction.orderBy('time', descending: true).snapshots();
    return transactionStream;
  }

  // UPDATE
  Future<void> updateTransaction(String id, String? name, int? amount,
      String? category, DateTime? date, String? time) {
    return transaction.doc(id).update({
      'name': name,
      'amount': amount,
      'category': category,
      'date': date,
      'time': time,
    });
  }
}
