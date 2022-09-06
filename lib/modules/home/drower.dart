import 'package:flutter/material.dart';
import 'package:news_c6/core/constant/my_colors.dart';

class HomeDrawer extends StatelessWidget {
static int categorynum=1;
static int settingnum=1;

  Function onMenuItemClicked;
HomeDrawer(this.onMenuItemClicked);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: size.width * 0.75,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 65),
              color: standeredColor,
              child:const Text(
                "News App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: (){
                onMenuItemClicked(categorynum);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:const [
                    Icon(Icons.list,size: 30,),
                    SizedBox(width: 10,),
                    Text("Categories"),

                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
           InkWell(
             onTap: (){
               onMenuItemClicked(settingnum);
             },
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children:const [
                   Icon(Icons.settings,size: 30,),
                   SizedBox(width: 10,),
                   Text("Settings"),

                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
