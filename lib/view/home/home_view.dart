import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallet_management/common/color_extension.dart';
import 'package:wallet_management/common_widget/bar_view.dart';
import 'package:wallet_management/common_widget/selection_botton.dart';
import 'package:wallet_management/common_widget/transaction_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectButton = 0;

  var barData = [
    {"name": "Sun", "income": 10,"expense": 0},
    {"name": "Mon", "income": 5,"expense": 4},
    {"name": "Tue", "income": 4,"expense": 3},
    {"name": "Wed", "income": 7,"expense": 2},
    {"name": "Thus", "income": 2,"expense": 5},
    {"name": "Fri", "income": 0,"expense": 8},
    {"name": "Sat", "income": 6,"expense": 2}
    ];
  

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    var barWidth = (media.width / barData.length) - 30;

    var maxVal = barData.map((e) => (double.tryParse(e["income"].toString()) ?? 0.0 ) + (double.tryParse(e["expense"].toString()) ?? 0.0 ) ).reduce(max);

    return Scaffold(
      backgroundColor: TColor.bg, 
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1),

          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
              SelectionBotton(
                title: "Today", 
                onPressed: (){
                  setState(() {
                    selectButton = 0;
                  });
                }, 
                isSelect: selectButton == 0
                ),

              SelectionBotton(
                title: "Week", 
                onPressed: (){
                  setState(() {
                    selectButton = 1;
                  });
                },
                isSelect: selectButton == 1
                ),

                SelectionBotton(
                title: "Month", 
                onPressed: (){
                  setState(() {
                    selectButton = 2;
                  });
                }, 
                isSelect: selectButton == 2
                ),

                SelectionBotton(
                title: "Year", 
                onPressed: (){
                  setState(() {
                    selectButton = 3;
                  });
                }, 
                isSelect: selectButton == 3
                ),
            ],
            ),

            const SizedBox(
              height: 20,
            ),

            //chat
            Container(
              height: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: 
                barData.map((cObj) => BarView(cObj: cObj, barWidth: barWidth, maxVal: maxVal,)).toList()
                ),
              ),

             const SizedBox(
              height: 20,
            ),

            Row(children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xffECE9FF),
                    borderRadius: BorderRadius.all(Radius.circular(15),),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                        Text(
                          "Income", 
                          style: TextStyle(
                            color: Color(0xff9588CE), 
                            fontSize: 16, 
                            fontWeight: FontWeight.w700),
                            ),

                            Icon(
                              Icons.arrow_drop_down, 
                              color: Color(0xff02C487), 
                              size: 30
                              ),
                      ],
                      ),

                        Text(
                          "+\$764.42", 
                          style: TextStyle(
                            color: TColor.primary, 
                            fontSize: 25, 
                            fontWeight: FontWeight.w700),
                            ),
                    ],
                    ),
                    ),
                    ),

                    const SizedBox(
                        width: 15,
                      ),

                Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xffEBFBFF),
                    borderRadius: BorderRadius.all(Radius.circular(15),),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                        Text(
                          "Expense", 
                          style: TextStyle(
                            color: Color(0xff71C105), 
                            fontSize: 16, 
                            fontWeight: FontWeight.w700),
                            ),
                            Icon(
                              Icons.arrow_drop_up, 
                              color: Color(0xffFC6158), 
                              size: 30
                              ),
                      ],
                      ),
                        Text(
                          "-\$654.20", 
                          style: TextStyle(
                            color: TColor.secondary, 
                            fontSize: 25, 
                            fontWeight: FontWeight.w700),
                            ),
                    ],
                    ),
                    ),
                    ),
            ],
            ),

            const SizedBox(
              height: 20,
            ),

                      Text(
                          "Transactions", 
                          style: TextStyle(
                            color: TColor.primary, 
                            fontSize: 18, 
                            fontWeight: FontWeight.w700),
                            ),

              const SizedBox(
              height: 20,
            ),
            
            Column(children: [{},{},{},{}].map((cObj) => const TransactionRow()).toList(),)
           
          ], 
          ),
          ),
          ),
          );
  }
}