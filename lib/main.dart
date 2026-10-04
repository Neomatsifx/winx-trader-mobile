import 'package:flutter/material.dart';
void main() => runApp(WinXApp());
class WinXApp extends StatefulWidget {
  @override
  State<WinXApp> createState() => _WinXAppState();
}
class _WinXAppState extends State<WinXApp> {
  String active='Exness';
  final Map<String, Color> colors={'Exness':Color(0xFFFFD700),'XM':Color(0xFFE30613),'FBS':Color(0xFF00B04F),'Deriv':Color(0xFFFF444F),'ICMarkets':Color(0xFF00C800)};
  @override
  Widget build(BuildContext context) {
    final c=colors[active]!;
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        backgroundColor:Color(0xFF0a0e14),
        appBar: AppBar(backgroundColor:Color(0xFF151a23), title:Text('WinX Trader - '+active, style:TextStyle(color:c))),
        body: Column(children:[
          Container(margin:EdgeInsets.all(16), padding:EdgeInsets.symmetric(horizontal:16), decoration:BoxDecoration(color:Color(0xFF151a23), borderRadius:BorderRadius.circular(12), border:Border.all(color:c)), child:DropdownButton<String>(value:active, isExpanded:true, dropdownColor:Color(0xFF151a23), underline:SizedBox(), items:colors.keys.map((k)=>DropdownMenuItem(value:k, child:Text(k, style:TextStyle(color:colors[k])))).toList(), onChanged:(v)=>setState(()=>active=v!))),
          Container(margin:EdgeInsets.symmetric(horizontal:16), padding:EdgeInsets.all(20), decoration:BoxDecoration(color:Color(0xFF151a23), borderRadius:BorderRadius.circular(16)), child:Column(children:[Text('Balance \$12,543', style:TextStyle(color:Colors.white, fontSize:20, fontWeight:FontWeight.bold)), Text('P/L +\$258', style:TextStyle(color:c))])) ,
          SizedBox(height:16),
          Container(margin:EdgeInsets.symmetric(horizontal:16), width:double.infinity, child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:c), onPressed:(){}, child:Text('STOP BOT - '+active, style:TextStyle(color:Colors.black)))),
          Expanded(child:Center(child:Text('Positions for '+active, style:TextStyle(color:c)))),
          Container(padding:EdgeInsets.all(12), color:Color(0xFF151a23), child:Row(children:[Text('Multi-Mode: 3 brokers running', style:TextStyle(color:Colors.white54, fontSize:10)), Spacer(), Text('Total +\$127', style:TextStyle(color:c, fontSize:10))]))
        ]),
      ),
    );
  }
}
