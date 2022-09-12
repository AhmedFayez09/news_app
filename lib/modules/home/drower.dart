import 'package:flutter/material.dart';
import 'package:news_c6/core/constant/my_colors.dart';
import 'package:news_c6/logic/app_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
static int categorynum=1;
static int settingnum=1;

  Function onMenuItemClicked;

HomeDrawer(this.onMenuItemClicked);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<App_Provider>(context);
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
                widget.onMenuItemClicked(HomeDrawer.categorynum);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:const [
                    SizedBox(width: 20),
                    Icon(Icons.list,size: 30,),
                    SizedBox(width: 35,),
                    Text("Categories"),

                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
           InkWell(
             onTap: (){
               widget.onMenuItemClicked(HomeDrawer.settingnum);
             },
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 children:const [
                   SizedBox(width: 20),
                   Icon(Icons.settings,size: 30,),
                   SizedBox(width: 35,),
                   Text("Settings"),

                 ],
               ),
             ),
           ),

            SwitchListTile(
              title: Text(
                "Language ",

              ),
              activeColor: standeredColor,
              activeTrackColor: standeredColor,
              inactiveThumbColor: whiteColor,
              inactiveTrackColor: Colors.black,
              controlAffinity: ListTileControlAffinity.leading,
              value:
              provider.lang == "en" ? false : true,
              onChanged: (val) {


                provider.changeAppChach(val);
                provider.changeAppLang(val == false ? "en" : "ar");
              },
            ),
          ],
        ),
      ),
    );
  }
}
