import 'package:flutter/material.dart';

class baseAppBar extends StatelessWidget implements PreferredSizeWidget{
  //final deco
  final AppBar appBar;

  const baseAppBar({Key? key, required this.appBar}):super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
      leading: IconButton(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          icon: const Icon(Icons.arrow_back_ios, size: 40,),
          tooltip: '....',
          onPressed: () { Navigator.pop(context);//setState(() {});
          },
        ),
        actions: const [ 
          Icon(Icons.menu, size: 50,),
          Padding(padding: EdgeInsets.fromLTRB(0,0,20,0))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
    );
  }


  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);



}