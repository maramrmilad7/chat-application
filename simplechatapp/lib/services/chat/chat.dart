import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:simplechatapp/models/message.dart';

class ChatServices {
  //get instance from firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream method
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send message method(Data)
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;

    final dynamic currentUserEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();
    //create a new message
    Message newMessage = Message(
        message: message,
        senderId: currentUserID,
        receiverId: receiverID,
        timestamp: timestamp,
        senderEmail: currentUserEmail);

    //constract chat room ID for two users(to store all messages)
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');
    //add message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //receive messages method(Data)
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //consruct chat room id for two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
