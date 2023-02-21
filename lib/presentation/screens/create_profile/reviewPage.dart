import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:[
          ReviewCard(name: 'Emily',
              review: 'Nice work and user friendly communication.',
              rate: 4.5),
          ReviewCard(name: 'Emily',
              review: 'very patient and awesome to work with!'
                  'asked the right question about the target'
                  'audience and made exactly what we '
                  'needed!',
              rate: 4.5),
          ReviewCard(name: 'Emily',
              review:  'very patient and awesome to work with!'
                  'asked the right question about the target'
                  'audience and made exactly what we '
                  'needed!',
              rate: 4.5)

        ]


    );
  }
}




Widget ReviewCard({required String name, required String review, required double rate}){
  return  ListTile(
    leading: CircleAvatar(
      backgroundImage: AssetImage('images/person.png'),
      //radius: 37.5,
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star,
          color: Color.fromRGBO(255, 193, 7, 1),
          size: 25,),
        //SizedBox(width: 6,),
        Text('$rate',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(255, 193, 7, 1),
          ),)
      ],),
    title:Padding(
      padding: const EdgeInsetsDirectional.only(top:20.0),
      child: Text('$name',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black
      ),),
    ),
    isThreeLine: true,
    subtitle: Padding(
      padding: const EdgeInsetsDirectional.only(top:10.0),
      child: Text('$review',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(124, 124, 124, 1)
        ),),
    ),


  );
}
