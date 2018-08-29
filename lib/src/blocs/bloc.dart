import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../validators/validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Bloc extends Object with Validator {
  // final _emailStreamController = StreamController<String>.broadcast();
  // final _passwordStreamController = StreamController<String>.broadcast();
  // replace the StreamController<String>.broadcast() to BehaviorSubject<String> which aleady has boradcast in default
  final _emailStreamController = BehaviorSubject<String>();
  final _passwordStreamController = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get emailStream =>
      this._emailStreamController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      this._passwordStreamController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(
      this.emailStream, this.passwordStream, (e, p) => true);

  // retrieve data from stream
  Function(String) get emailChangeSink => this._emailStreamController.sink.add;
  Function(String) get passwordChangeSink =>
      this._passwordStreamController.sink.add;

  // submit method
  submit() {
    initializeFirebase();
    final validEmail = this._emailStreamController.value;
    final validPassword = this._passwordStreamController.value;

    print('Submited Email: $validEmail Password: $validPassword');
  }

  initializeFirebase() async {
    final FirebaseApp app = await FirebaseApp.configure(
      name: 'test',
      options: const FirebaseOptions(
        googleAppID: '1:829247948190:android:cc6eb3d69439a31e',
        gcmSenderID: '829247948190',
        clientID: "829247948190-b108v446h96rea0t59dgarc0j8hu6vgj.apps.googleusercontent.com",
        apiKey: 'AIzaSyBNcwup4L4Yvi0sgT0l6SjT9lgO0-8PyWw',
        databaseURL: "https://acc-shop.firebaseio.com",
        storageBucket: "acc-shop.appspot.com",
        projectID: 'acc-shop',
      ),
    );
    // final Firestore firestore = new Firestore(app: app);
    // final FirebaseAuth _auth = FirebaseAuth.instance;

    // final FirebaseUser user = await _auth.signInWithEmailAndPassword(

    // );
  }

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}

// final bloc = Bloc();
