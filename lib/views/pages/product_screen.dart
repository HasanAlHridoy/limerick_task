import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limerick_task/controller/repositories.dart';
import 'package:limerick_task/models/product_model.dart';
import 'package:limerick_task/views/widgets/checkout_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../blocs/product_bloc/product_bloc.dart';
import '../../controller/services/pref_utils.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(ProductLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রোডাক্ট তালিকা'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'নাম দ্বারা অনুসন্ধান',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        children: [
                                          //Using Icon because no image field got on API.
                                          Container(
                                            color: Colors.grey,
                                            width: double.infinity,
                                            child: const Icon(
                                              Icons.grading_outlined,
                                              color: Colors.orange,
                                              size: 50,
                                            ),
                                          ),
                                          TextField(
                                            controller: state.productsQuantity[state.products[index].name],
                                            decoration: InputDecoration(
                                              prefixIcon: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.remove),
                                              ),
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  Map quickMap = {};
                                                  // int qty = int.parse(state.productsQuantity[state.products[index].name].text);
                                                  quickMap[state.productsQuantity.keys.toList()[index]] =
                                                      state.productsQuantity[state.products[index].name].text;
                                                  quickMap['price'] = state.products[index].price;

                                                  BlocProvider.of<ProductBloc>(context).add(ProductQuantityIncrementEvent(quickMap));
                                                  // print(state.productsQuantity);
                                                },
                                                icon: const Icon(Icons.add),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.products[index].name.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: '৳${state.products[index].price.toString()}  ',
                                                  style: TextStyle(color: Colors.blue),
                                                ),
                                                const TextSpan(
                                                  text: '||  ',
                                                  style: TextStyle(color: Colors.black),
                                                ),
                                                TextSpan(
                                                  text: 'স্টক ${state.products[index].stock.toString()}',
                                                  style: TextStyle(color: Colors.green),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            'মাস্টার প্যাক: ${state.products[index].packSize.toString()}',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  decoration:
                      BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'মোট: ৳${state.totalAmount}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CheckoutDialog();
                                });
                          },
                          child: const Text(
                            'অর্ডার করুন',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
