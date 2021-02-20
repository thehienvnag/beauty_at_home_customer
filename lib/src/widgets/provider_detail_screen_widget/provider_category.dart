// import 'package:flutter/material.dart';
//
// class ProviderCategory extends StatefulWidget {
//   iwnt
//   @override
//   _ProviderCategoryState createState() => _ProviderCategoryState();
// }
//
// class _ProviderCategoryState extends State<ProviderCategory> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
//
//   Widget _buildCategory(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: AnimatedContainer(
//         height: MediaQuery.of(context).size.height,
//         width: 130.0,
//         duration: Duration(milliseconds: 100),
//         curve: Curves.easeIn,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           border: _selectedIndex == index ? Border(
//             top: BorderSide(width: 3.0, color: Colors.cyan[400]),
//           ) : null,
//         ),
//         child: Text(
//           _categories[index],
//           style: TextStyle(
//               color: _selectedIndex == index ? Color(0xFF3EBACE): null,
//               fontWeight: FontWeight.w500
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
