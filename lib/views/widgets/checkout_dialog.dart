import 'package:flutter/material.dart';

class CheckoutDialog extends StatelessWidget {
  const CheckoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      titlePadding: EdgeInsets.all(0),
      contentPadding: EdgeInsets.all(0),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Text(
                'চেকআউট নিশ্চিত করুন',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildProductRow('এক্সক্লি টি সেটালাইন', '10x5.35', '\৳53.50'),
                  SizedBox(height: 10),
                  _buildProductRow('ওয়াই ওয়াই এক্সট্রা', '20x8.20', '\৳164.00'),
                  SizedBox(height: 10),
                  _buildProductRow('এক্সি ক্লাসিক ম্যাঙ্গো', '30x26.00', '\৳780.00'),
                  SizedBox(height: 10),
                  _buildProductRow('ওয়াই ওয়াই এক্সট্রা', '50x16.00', '\৳800.00'),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Divider(thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'মোট: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\৳1797.50',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, height: 1),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'এড়িয়ে',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Add your action code here
                    },
                    child: Text(
                      'নিশ্চিত করুন',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProductRow(String name, String quantity, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            quantity,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
      Text(
        price,
        style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
