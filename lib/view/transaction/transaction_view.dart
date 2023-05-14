import 'package:flutter/material.dart';
import 'package:wallet_management/common/color_extension.dart';
import 'package:wallet_management/common_widget/selection_botton.dart';
import 'package:wallet_management/common_widget/tab_icon_text_button.dart';
import 'package:wallet_management/common_widget/transaction_list_row.dart';

class TransactionView extends StatefulWidget {
  const TransactionView({super.key});

  @override
  State<TransactionView> createState() => _TransactionViewState();
}

class _TransactionViewState extends State<TransactionView> {
  int selectButton = 0;
  int selectType = 0;

  List selectTypeList = [
    {"name":"Send", "tag":0, "icon": Icons.arrow_upward_outlined},
    {"name":"Recived", "tag":1, "icon": Icons.arrow_downward_outlined},
    {"name":"Transactions", "tag":2, "icon": Icons.compare_arrows_rounded},
    {"name":"Category", "tag":3, "icon": Icons.apps_outlined}]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 20),

           Container(
            padding: const EdgeInsets.symmetric(horizontal: 1),
             child: Row(
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
           ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:

            selectTypeList.map((sObj) {
              return TabIconTextButton(
                title: sObj["name"] as String? ?? "", 
                icon: sObj["icon"] as IconData? ?? Icons.arrow_upward_outlined, 
                isSelect: selectType == (sObj["tag"] as int? ?? 0),
                onPressed: (){
                  setState(() {
                    selectType = sObj["tag"] as int? ?? 0;
                  });
                }
                );
            } ).toList()
            
            ),
          ),

        Expanded(child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
          return TransactionListRow();
        }))

      ],
      ),
    );
  }
}