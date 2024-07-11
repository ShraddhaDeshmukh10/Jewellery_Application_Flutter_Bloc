class Item {
  final String barcode;
  final String location;
  final String branch;
  final String status;
  final int counter;
  final String source;
  final String category;
  final String collection;
  final String description;
  final String metalGrp;
  final String stkSection;
  final String mfgdBy;
  final String notes;
  final String inStkSince;
  final String certNo;
  final String huidNo;
  final int orderNo;
  final String cusName;
  final String size;
  final String quality;
  final double kt;
  final int pcs;
  final double grossWt;
  final double netWt;
  final int diaPcs;
  final double diaWt;
  final int clsPcs;
  final double clsWt;
  final double chainWt;
  final double mRate;
  final double mValue;
  final double lRate;
  final double lCharges;
  final double rCharges;
  final double oCharges;
  final double mrp;
  final String imageLink;
  final List<TableData> tableData;

  Item({
    required this.barcode,
    required this.location,
    required this.branch,
    required this.status,
    required this.counter,
    required this.source,
    required this.category,
    required this.collection,
    required this.description,
    required this.metalGrp,
    required this.stkSection,
    required this.mfgdBy,
    required this.notes,
    required this.inStkSince,
    required this.certNo,
    required this.huidNo,
    required this.orderNo,
    required this.cusName,
    required this.size,
    required this.quality,
    required this.kt,
    required this.pcs,
    required this.grossWt,
    required this.netWt,
    required this.diaPcs,
    required this.diaWt,
    required this.clsPcs,
    required this.clsWt,
    required this.chainWt,
    required this.mRate,
    required this.mValue,
    required this.lRate,
    required this.lCharges,
    required this.rCharges,
    required this.oCharges,
    required this.mrp,
    required this.imageLink,
    required this.tableData,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      barcode: json['Barcode'].toString(),
      location: json['Location'].toString(),
      branch: json['Branch'].toString(),
      status: json['Status'].toString(),
      counter:
          json['Counter'] is int ? json['Counter'] : int.parse(json['Counter']),
      source: json['Source'].toString(),
      category: json['Category'].toString(),
      collection: json['Collection'].toString(),
      description: json['Description'].toString(),
      metalGrp: json['Metal_Grp'].toString(),
      stkSection: json['STK_Section'].toString(),
      mfgdBy: json['Mfgd_By'].toString(),
      notes: json['Notes'].toString(),
      inStkSince: json['In_STK_Since'].toString(),
      certNo: json['Cert_No'].toString(),
      huidNo: json['HUID_No'].toString(),
      orderNo: json['Order_No'] is int
          ? json['Order_No']
          : int.parse(json['Order_No']),
      cusName: json['Cus_Name'].toString(),
      size: json['Size'].toString(),
      quality: json['Quality'].toString(),
      kt: json['KT'] is double
          ? json['KT']
          : double.parse(json['KT'].toString()),
      pcs: json['Pcs'] is int ? json['Pcs'] : int.parse(json['Pcs']),
      grossWt: json['Gross_Wt'] is double
          ? json['Gross_Wt']
          : double.parse(json['Gross_Wt'].toString()),
      netWt: json['Net_Wt'] is double
          ? json['Net_Wt']
          : double.parse(json['Net_Wt'].toString()),
      diaPcs:
          json['Dia_Pcs'] is int ? json['Dia_Pcs'] : int.parse(json['Dia_Pcs']),
      diaWt: json['Dia_Wt'] is double
          ? json['Dia_Wt']
          : double.parse(json['Dia_Wt'].toString()),
      clsPcs:
          json['Cls_Pcs'] is int ? json['Cls_Pcs'] : int.parse(json['Cls_Pcs']),
      clsWt: json['Cls_Wt'] is double
          ? json['Cls_Wt']
          : double.parse(json['Cls_Wt'].toString()),
      chainWt: json['Chain_Wt'] is double
          ? json['Chain_Wt']
          : double.parse(json['Chain_Wt'].toString()),
      mRate: json['M_Rate'] is double
          ? json['M_Rate']
          : double.parse(json['M_Rate'].toString()),
      mValue: json['M_Value'] is double
          ? json['M_Value']
          : double.parse(json['M_Value'].toString()),
      lRate: json['L_Rate'] is double
          ? json['L_Rate']
          : double.parse(json['L_Rate'].toString()),
      lCharges: json['L_Charges'] is double
          ? json['L_Charges']
          : double.parse(json['L_Charges'].toString()),
      rCharges: json['R_Charges'] is double
          ? json['R_Charges']
          : double.parse(json['R_Charges'].toString()),
      oCharges: json['O_Charges'] is double
          ? json['O_Charges']
          : double.parse(json['O_Charges'].toString()),
      mrp: json['MRP'] is double
          ? json['MRP']
          : double.parse(json['MRP'].toString()),
      imageLink: json['image_link'].toString(),
      tableData: (json['Table_Data'] as List)
          .map((data) => TableData.fromJson(data))
          .toList(),
    );
  }
}

class TableData {
  final String lotDescription;
  final String group;
  final String units;
  final int pcs;
  final double weight;
  final double rate;
  final double value;
  final double sRate;
  final double sValue;

  TableData({
    required this.lotDescription,
    required this.group,
    required this.units,
    required this.pcs,
    required this.weight,
    required this.rate,
    required this.value,
    required this.sRate,
    required this.sValue,
  });

  factory TableData.fromJson(Map<String, dynamic> json) {
    return TableData(
      lotDescription: json['Lot_Description'].toString(),
      group: json['Group'].toString(),
      units: json['Units'].toString(),
      pcs: json['Pcs'] is int ? json['Pcs'] : int.parse(json['Pcs']),
      weight: json['Weight'] is double
          ? json['Weight']
          : double.parse(json['Weight'].toString()),
      rate: json['Rate'] is double
          ? json['Rate']
          : double.parse(json['Rate'].toString()),
      value: json['Value'] is double
          ? json['Value']
          : double.parse(json['Value'].toString()),
      sRate: json['S_Rate'] is double
          ? json['S_Rate']
          : double.parse(json['S_Rate'].toString()),
      sValue: json['S_Value'] is double
          ? json['S_Value']
          : double.parse(json['S_Value'].toString()),
    );
  }
}
