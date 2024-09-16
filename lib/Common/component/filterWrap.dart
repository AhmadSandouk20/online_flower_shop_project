// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:online_flower_shop/Styles/colors.dart';
// import 'package:online_flower_shop/Styles/fonts.dart';
// import 'package:online_flower_shop/common/component/selectTypeButton.dart';
// import 'package:online_flower_shop/common/custom/customMaterialButton.dart';

// class FilterWrap extends StatelessWidget {
//   final BoxConstraints constraints;
//   final String label;
//   final List<Map<String, dynamic>> filteringItems;

//   FilterWrap({
//     required this.constraints,
//     required this.filteringItems,
//     this.label = "",
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Widget wrapContent = Wrap(
//       spacing: constraints.maxWidth * 5 / 100,
//       children: List.generate(
//         filteringItems.length,
//         (index) => SelectTypeButton(
//           backgroundColor: Colors.white,
//           constraints: constraints,
//           label: filteringItems[index]["label"],
//           onPressed: () {},
//           borderColor: ShopLightColors.lighterPinkColor,
//           selected: filteringItems[index]["selected"],
//         ),
//       ),
//     );

//     return label != ""
//         ? Column(
//             children: [
//               Text(
//                 label,
//               ),
//               wrapContent,
//             ],
//           )
//         : wrapContent;
//   }
// }

// List<Map<String, dynamic>> filt = [
//   {
//     "label": "Lily",
//     "selected": true,
//   },
//   {
//     "label": "Roses",
//     "selected": true,
//   }
// ];
