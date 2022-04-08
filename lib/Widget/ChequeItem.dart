import 'package:flutter/material.dart';
import 'package:mobile_bank_checkque/data/models/cheque.dart';

Widget chequeItem(Cheque e) {
  return Padding(
    padding: const EdgeInsets.only(left: 7.0, right: 7.0),
    child: Container(
      height: 45,
      child: Card(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.money),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}