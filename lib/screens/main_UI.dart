// import 'package:flutter/material.dart';
// import 'package:flutter01/Model/model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter01/blocs/item_bloc.dart';
// import 'package:flutter01/blocs/item_event.dart';
// import 'package:flutter01/blocs/item_state.dart';
// import 'package:flutter01/models/item.dart';

// class CustomTextField extends StatelessWidget {
//   final String label;
//   final String value;

//   CustomTextField({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.black.withOpacity(0.6),
//               Colors.black.withOpacity(0.1)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.white, width: 1),
//         ),
//         child: TextField(
//           decoration: InputDecoration(
//             labelText: label,
//             border: OutlineInputBorder(),
//             filled: true,
//             fillColor: Colors.transparent,
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//           controller: TextEditingController(text: value),
//           readOnly: true,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class SelectedItemDetails extends StatelessWidget {
//   final Item item;

//   const SelectedItemDetails({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Column(
//                   children: [
//                     CustomTextField(label: 'Barcode No.', value: item.barcode),
//                     CustomTextField(label: 'Location', value: item.location),
//                     CustomTextField(label: 'Branch', value: item.branch),
//                     CustomTextField(label: 'Status', value: item.status),
//                     CustomTextField(
//                         label: 'Counter', value: item.counter.toString()),
//                     CustomTextField(
//                         label: 'Order No.', value: item.orderNo.toString()),
//                     CustomTextField(label: 'KT', value: item.kt.toString()),
//                     CustomTextField(label: 'Pcs', value: item.pcs.toString()),
//                     CustomTextField(
//                         label: 'Gross Wt', value: item.grossWt.toString()),
//                     CustomTextField(
//                         label: 'Net Wt', value: item.netWt.toString()),
//                     CustomTextField(
//                         label: 'Dia Pcs', value: item.diaPcs.toString()),
//                     CustomTextField(
//                         label: 'Dia Wt', value: item.diaWt.toString()),
//                     CustomTextField(
//                         label: 'Cls Pcs', value: item.clsPcs.toString()),
//                     CustomTextField(
//                         label: 'Cls Wt', value: item.clsWt.toString()),
//                     CustomTextField(
//                         label: 'Chain Wt', value: item.chainWt.toString()),
//                     CustomTextField(
//                         label: 'M Rate', value: item.mRate.toString()),
//                     CustomTextField(
//                         label: 'M Value', value: item.mValue.toString()),
//                     CustomTextField(
//                         label: 'L Rate', value: item.lRate.toString()),
//                     CustomTextField(
//                         label: 'L Charges', value: item.lCharges.toString()),
//                     CustomTextField(
//                         label: 'R Charges', value: item.rCharges.toString()),
//                     CustomTextField(
//                         label: 'O Charges', value: item.oCharges.toString()),
//                     CustomTextField(label: 'MRP', value: item.mrp.toString()),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   width: 150,
//                   height: 150,
//                   child: Image.network(item.imageLink, fit: BoxFit.cover),
//                 ),
//               ),
//             ],
//           ),
//           DataTableWidget(tableData: Item.tableData),
//           TextButton(
//             onPressed: () {
//               BlocProvider.of<ItemBloc>(context).add(ClearSelection());
//             },
//             child: Text('Clear'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class MainScreen extends StatelessWidget {
//   final List<String> buttonLabels = [
//     'Barcode No',
//     'Location',
//     'Branch',
//     'Status',
//     'Counter',
//     'Category',
//     'Collection',
//     'Description',
//     'Metal Grp',
//     'STK Section',
//     'Mngd By',
//     'Notes',
//     'In STK Since',
//     'Cert No.',
//     'HUD No.',
//     'Order No.',
//     'Cust Name',
//     'Dsn No',
//     'Qty',
//     'K.T.',
//     'Pcs',
//     'Gross Wt.',
//     'Net Wt.',
//     'Dia Wt.',
//     'Clr Pcs',
//     'Stn Wt.',
//     'Chain Wt.',
//     'M Rate',
//     'I Rate',
//     'L Charges',
//     'F Charges',
//     'O Charges',
//     'MRP',
//   ];

//   Widget buildDetailField(String label, dynamic value) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlueAccent],
//           ),
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           label != null ? '$label: ${value?.toString() ?? ''}' : '',
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Item Details'),
//       ),
//       body: BlocBuilder<ItemBloc, ItemState>(
//         builder: (context, state) {
//           if (state is ItemSelected) {
//             final Item selectedData = state.selectedItem;
//             return Column(
//               children: [
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: GridView.count(
//                           crossAxisCount: 4,
//                           childAspectRatio: 3.5,
//                           children: buttonLabels
//                               .take(buttonLabels.length - 12)
//                               .map((label) {
//                             return buildDetailField(
//                               label,
//                               getFieldValue(selectedData, label),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           height: double.infinity,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           alignment: Alignment.center,
//                           child: selectedData.imageLink != null
//                               ? Image.network(selectedData.imageLink)
//                               : Text(
//                                   'Display image here',
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 4,
//                     childAspectRatio: 3.5,
//                     children: buttonLabels
//                         .skip(buttonLabels.length - 12)
//                         .map((label) {
//                       return buildDetailField(
//                         label,
//                         getFieldValue(selectedData, label),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: DataTable(
//                     columns: [
//                       DataColumn(
//                         label: Text(
//                           'LOT Description',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Group',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Units',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Pcs',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Weight',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Rate',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'Value',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'S Rate',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       DataColumn(
//                         label: Text(
//                           'S Value',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                     rows: List<DataRow>.generate(
//                       selectedData.tableData.length,
//                       (index) {
//                         var row = selectedData.tableData[index];
//                         return DataRow(
//                           cells: row.value.map<DataCell>((value) {
//                             return DataCell(Text(value.toString()));
//                           }).toList(),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return Center(child: Text('No item selected'));
//           }
//         },
//       ),
//     );
//   }

//   dynamic getFieldValue(Item item, String label) {
//     switch (label) {
//       case 'Barcode No':
//         return item.barcode;
//       case 'Location':
//         return item.location;
//       case 'Branch':
//         return item.branch;
//       case 'Status':
//         return item.status;
//       case 'Counter':
//         return item.counter;
//       case 'Order No.':
//         return item.orderNo;
//       case 'KT':
//         return item.kt;
//       case 'Pcs':
//         return item.pcs;
//       case 'Gross Wt':
//         return item.grossWt;
//       case 'Net Wt':
//         return item.netWt;
//       case 'Dia Pcs':
//         return item.diaPcs;
//       case 'Dia Wt':
//         return item.diaWt;
//       case 'Cls Pcs':
//         return item.clsPcs;
//       case 'Cls Wt':
//         return item.clsWt;
//       case 'Chain Wt':
//         return item.chainWt;
//       case 'M Rate':
//         return item.mRate;
//       case 'M Value':
//         return item.mValue;
//       case 'L Rate':
//         return item.lRate;
//       case 'L Charges':
//         return item.lCharges;
//       case 'R Charges':
//         return item.rCharges;
//       case 'O Charges':
//         return item.oCharges;
//       case 'MRP':
//         return item.mrp;
//       default:
//         return null;
//     }
//   }
// }

// class DataTableWidget extends StatelessWidget {
//   final List<Map<String, dynamic>> tableData;

//   const DataTableWidget({required this.tableData});

//   @override
//   Widget build(BuildContext context) {
//     return DataTable(
//       columns: [
//         DataColumn(label: Text('LOT Description')),
//         DataColumn(label: Text('Group')),
//         DataColumn(label: Text('Units')),
//         DataColumn(label: Text('Pcs')),
//         DataColumn(label: Text('Weight')),
//         DataColumn(label: Text('Rate')),
//         DataColumn(label: Text('Value')),
//         DataColumn(label: Text('S Rate')),
//         DataColumn(label: Text('S Value')),
//       ],
//       rows: tableData.map((row) {
//         return DataRow(
//           cells: row.values.map((value) {
//             return DataCell(Text(value.toString()));
//           }).toList(),
//         );
//       }).toList(),
//     );
//   }
// }

