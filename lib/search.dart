import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/trainerprofile.dart';
import 'package:flutter/material.dart';

import 'Modles/Trainers.dart';
//vimport 'package:mind_easy/Model/topic.dart';

//import 'Anxiety.dart';

class DataSearch extends SearchDelegate<String> {
  DataSearch({this.context});
  BuildContext context;
  int calculatepercentage(double num,double dis){
    double totoal=(dis/num)*100;
    return totoal.round();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
      //_shoppingCartBadge()
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //print(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty
        ? trainers
        : trainers.where((p) => p.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
          //  color: Colors.black,
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                  /*  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProductDescription(num: product
                            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                            .toList()[index])));*/
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Trainerprofile(trainers
                          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                          .toList()[index])),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width/6,
                     // color: Colors.green,
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          imageUrl:trainers
                              .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                              .toList()[index]
                              .image,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.fill,

                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15,left: 5),
                                child:
                                Container(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 50.0,
                                      maxWidth: MediaQuery.of(context).size.width/1.7,
                                        //  minHeight: 30.0,
                                      //maxHeight: 25.0,
                                    ),
                                    child: AutoSizeText(
                                      trainers
                                          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                          .toList()[index]
                                          .name,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                //Text("Hello my name is bilal hassan qadri",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            Padding(
                                padding: const EdgeInsets.only(top: 2,left: 5),
                                child: Text("Available Slots :: "+ trainers
                                    .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                    .toList()[index]
                                    .available_slos.toString(),),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.navigate_next,color: Colors.black,size: 30,),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Trainerprofile(trainers
                                    .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                    .toList()[index])),
                              );
                            },
                          )
                        ],
                      ),

                      SizedBox(height: 15,),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                /*    Padding (
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(calculatepercentage(topic
                                          .where((p) => p.Title.toLowerCase().contains(query.toLowerCase()))
                                          .toList()[index]
                                          .price,product
                                          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                          .toList()[index]
                                          .Discount).toString()+"% OFF",style: TextStyle(color: Colors.green),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Row(
                                        children: <Widget>[
                                          Text("Rs "+(product
                                              .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                              .toList()[index]
                                              .price).toString()+" ",style: TextStyle(fontWeight: FontWeight.bold)),
                                          Visibility(
                                              visible: product
                                                  .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                                  .toList()[index]
                                                  .Discount!=0,
                                              child: Text("Rs "+(product
                                                  .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                                  .toList()[index]
                                                  .price+product
                                                  .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                                  .toList()[index]
                                                  .Discount).toString(),style: TextStyle(fontSize: 10,decoration: TextDecoration.lineThrough),)),
                                        ],
                                      ),
                                    ),*/
                                  ],
                                ),


                                Spacer(),
                                /*StatefulBuilder(

                                  builder: (BuildContext context, StateSetter setState) {
                                    return RaisedButton(

                                      color: MyColors.primaryColor,
                                      child:  subonoff(product
                                          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                          .toList()[index]) && visbutton ? Text("   Get Once   ",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width/35)) : Text("+ Add to Cart",style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width/35)),
                                      onPressed: (){
                                        subtotal=subtotal+product
                                            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                                            .toList()[index].price.round();
                                        grandtotal=subtotal;
                                        setState(() {
                                          //change="Once";
                                          // print("sum setstate");
                                          // sum++;
                                          myfunc();
                                          //this.widget.callback(sum);

                                        });
                                       // makefalsbutton(subcatextraproduct[index].id);

                                        for(int i=0;i<savedata.length;i++)
                                        {
                                          if(savedata[i]==id) {
                                            if (savedata[i + 1] == 1) {
                                              setState(() {
                                                savedata[i + 1]=0;
                                              });
                                              break;
                                            }
                                            else
                                            {
                                              setState(() {
                                                savedata[i + 1]=1;
                                              });
                                            }
                                          }
                                          i++;
                                        }
                                        //maketruecountr(subcatextraproduct[index].id);
                                        for(int i=0;i<savedatacountr.length;i++)
                                        {
                                          if(savedatacountr[i]==id) {
                                            if (savedatacountr[i + 1] == 1) {
                                              setState(() {
                                                savedatacountr[i + 1]=0;
                                              });
                                              break;
                                            }
                                            else
                                            {
                                              setState(() {
                                                savedatacountr[i + 1]=1;
                                              });
                                              break;
                                            }
                                          }
                                          i++;
                                        }
                                      //  totalcsetone(subcatextraproduct[index].id);
                                        for(int i=0;i<totalitems.length;i++)
                                        {
                                          if(totalitems[i]==id){
                                            totalitems[i+1]=1;
                                          }
                                          i++;
                                        }
                                      },
                                    );
                                  }
                                ),*/
                              ],
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),

          /*ListTile(
        onTap: () {
          // showResults((context));
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDescription(num: product
                  .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                  .toList()[index])));

        },
        trailing: Icon(Icons.arrow_forward_ios),
        leading:Container(
          height: 50,
          width: 40,
          child: CachedNetworkImage(
            imageUrl:product
                .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
                .toList()[index]
                .image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.fill,

          ),
            /*FadeInImage.assetNetwork(image: product
                .where((p) => p.name.toLowerCase().startsWith(query.toLowerCase()))
                .toList()[index]
                .image,placeholder: "assets/bro.gif"),*/
        ),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                    text: suggestionList[index].name.substring(query.length) +
                        "\n",
                    style: TextStyle(color: Colors.grey)),
                TextSpan(
                    text: " Rs. " + suggestionList[index].price.toString(),
                    style: TextStyle(color: Colors.black))
              ]),
        ),
      ),*/
      itemCount: suggestionList.length,
    );
  }
}
