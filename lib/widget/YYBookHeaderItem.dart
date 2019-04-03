import 'package:flutter/material.dart';

import 'package:lychee/common/style/YYStyle.dart';
import 'package:lychee/common/util/YYCommonUtils.dart';
import 'package:lychee/common/model/YYReceiptResult.dart';

class YYBookHeaderItem extends StatelessWidget {
  final YYReceiptResult receiptResult;
  final double height;
  final bool isSelected;
  final VoidCallback onPressed;
  YYBookHeaderItem({@required this.receiptResult,this.height=40.5,this.isSelected=false,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      padding: EdgeInsets.zero,
      onPressed: (){onPressed?.call();},
      child: Container(
        height: height,
        color: Color(YYColors.gray),
        child: Padding(
          padding: EdgeInsets.only(left: 10.5,right: 10.5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.asset(YYCommonUtils.Local_Icon_prefix+((isSelected==true)?"checkbox.png":"checkbox_empty.png"),width: 17.5,height: 17.5,fit: BoxFit.fill),
              SizedBox(width: 10.5),
              Text(receiptResult.name,style: TextStyle(color: Color(YYColors.primaryText),fontSize: YYSize.large),overflow: TextOverflow.ellipsis)
            ],
          ),
        ),
      ),
    );
  }
}