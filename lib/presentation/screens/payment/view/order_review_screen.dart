//! this screen is in ui but not required because of webview

// import 'package:task_tech/utils/exports.dart';

// class OrderReviewScreen extends StatefulWidget {
//   const OrderReviewScreen(
//       {super.key,
//       required this.imgUrl,
//       required this.serviceName,
//       required this.rate,
//       required this.deliveryDate,
//       required this.price});
//   final String imgUrl;
//   final String serviceName;
//   final num rate;
//   final String deliveryDate;
//   final int price;

//   @override
//   State<OrderReviewScreen> createState() => _OrderReviewScreenState();
// }

// class _OrderReviewScreenState extends State<OrderReviewScreen> {
//   bool creditChecked = false;
//   bool payPalChecked = false;
//   int selectedPaymentMethod = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         elevation: 0,
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             onPressed: () => Navigator.pop(context),
//             style: ButtonStyle(
//               padding: WidgetStatePropertyAll(const EdgeInsets.all(4)),
//               backgroundColor:
//                   WidgetStatePropertyAll(Theme.of(context).primaryColor),
//               shape: WidgetStatePropertyAll(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(24),
//                 ),
//               ),
//             ),
//             child: Icon(
//               Icons.arrow_back,
//               color: Theme.of(context).scaffoldBackgroundColor,
//               size: 30,
//             ),
//           ),
//         ),
//         title: Text(
//           'Order Review',
//           style: titleStyle,
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.15,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CachedNetworkImage(
//                     imageUrl: widget.imgUrl,
//                     imageBuilder: (context, imageProvider) => Container(
//                       width: 160,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Color(0xffE0E0E0),
//                             blurRadius: 6,
//                             offset: Offset(2, 2),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 60,
//                       width: MediaQuery.of(context).size.width * 0.55,
//                       child: SingleChildScrollView(
//                         child: Text(
//                           widget.serviceName,
//                           overflow: TextOverflow.visible,
//                           softWrap: true,
//                           style: headStyle.copyWith(fontSize: 14),
//                         ),
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         SmoothStarRating(
//                           rating: widget.rate.toDouble(),
//                           size: 30,
//                           filledIconData: Icons.star,
//                           defaultIconData: Icons.star_border,
//                           halfFilledIconData: Icons.star_half,
//                           starCount: 5,
//                           spacing: 2,
//                           color: const Color.fromRGBO(255, 193, 7, 1),
//                           borderColor: const Color.fromRGBO(218, 218, 218, 1),
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           '${widget.rate}',
//                           style: headStyle.copyWith(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       color: const Color(0xffDADADA),
//                       height: 1,
//                       width: MediaQuery.of(context).size.width * 0.6,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Add payment method',
//                     style: headStyle,
//                   ),
//                   CheckBoxlistTile(
//                     isChecked: creditChecked,
//                     imgName: 'credit',
//                     text: 'Credit or Dipt Card',
//                     onChanged: (newVal) {
//                       setState(() {
//                         payPalChecked = false;
//                         creditChecked = newVal!;
//                         selectedPaymentMethod = 1;
//                       });
//                     },
//                   ),
//                   CheckBoxlistTile(
//                       isChecked: payPalChecked,
//                       imgName: 'paypal',
//                       text: 'PayPal',
//                       onChanged: (newVal) {
//                         setState(() {
//                           creditChecked = false;
//                           payPalChecked = newVal!;
//                           selectedPaymentMethod = 2;
//                         });
//                       }),
//                   const Divider(
//                     color: Color(0xffDADADA),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Order Details',
//                     style: headStyle,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   // Row(
//                   //   children: [
//                   //     Text(
//                   //       'Delivery Days',
//                   //       style: GoogleFonts.poppins(
//                   //         color: const Color(0xff7C7C7C),
//                   //         fontSize: 16,
//                   //       ),
//                   //     ),
//                   //     const Spacer(),
//                   //     Text(
//                   //       widget.deliveryDays,
//                   //       style: GoogleFonts.poppins(
//                   //         fontSize: 15,
//                   //         color: const Color(0xff7C7C7C),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   // const SizedBox(
//                   //   height: 30,
//                   // ),
//                   const Divider(
//                     color: Color(0xffDADADA),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Total',
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           color:
//                               Theme.of(context).textTheme.headlineSmall!.color,
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         '${widget.price}',
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           color:
//                               Theme.of(context).textTheme.headlineSmall!.color,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Delivery Date',
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           color: Colors.black,
//                         ),
//                       ),
//                       const Spacer(),
//                       Text(
//                         widget.deliveryDate,
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           color:
//                               Theme.of(context).textTheme.headlineSmall!.color,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const Expanded(child: SizedBox()),
//           ElevatedButton(
//             onPressed: () {
//               if (selectedPaymentMethod == 0) {
//                 Scaffold.of(context).showBottomSheet<void>(
//                     (BuildContext context) =>
//                         const Text('choose a payment method!'));
//               }
//             },
//             style: ButtonStyle(
//               padding: WidgetStatePropertyAll(
//                   const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
//               backgroundColor:
//                   WidgetStatePropertyAll(Theme.of(context).primaryColor),
//               shape: WidgetStatePropertyAll(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             child: Text(
//               'Add payment method',
//               style: GoogleFonts.poppins(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CheckBoxlistTile extends StatelessWidget {
//   const CheckBoxlistTile({
//     Key? key,
//     required this.isChecked,
//     required this.imgName,
//     required this.text,
//     required this.onChanged,
//   }) : super(key: key);
//   final bool isChecked;
//   final String imgName;
//   final String text;
//   final Function(bool?)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         unselectedWidgetColor: Theme.of(context).primaryColor,
//       ),
//       child: CheckboxListTile(
//         title: Row(
//           children: [
//             Image.asset('images/$imgName.png'),
//             const SizedBox(
//               width: 10,
//             ),
//             Text(
//               text,
//               style: GoogleFonts.poppins(
//                 color: Theme.of(context).textTheme.headlineSmall!.color,
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         checkboxShape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: BorderSide(
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         controlAffinity: ListTileControlAffinity.leading,
//         checkColor: Theme.of(context).primaryColor,
//         activeColor: Colors.white,
//         value: isChecked,
//         onChanged: onChanged,
//       ),
//     );
//   }
// }
