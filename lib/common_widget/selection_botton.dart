import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class SelectionBotton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelect;
  const SelectionBotton(
    {super.key, 
    required this.title, 
    required this.onPressed, 
    required this.isSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 40, 
                decoration: isSelect ? BoxDecoration(
                  color: TColor.primary, 
                  borderRadius: BorderRadius.circular(10),
                  ) : BoxDecoration(
                    border: Border.all(
                      color: TColor.primary
                      ),
                      borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: onPressed,
                    child: Text(
                      title, 
                      style: TextStyle(
                        color: isSelect ? Colors.white : TColor.primary, 
                        fontSize: 15, 
                        fontWeight: FontWeight.bold
                        ),
                        ),
                        ),
                  );
  }
}