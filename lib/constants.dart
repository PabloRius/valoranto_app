import 'package:flutter/material.dart';

const kRed0 = Color(0xffffc2c3);
const kRed10 = Color(0xffffb3b5);
const kRed20 = Color(0xffFFA4A7);
const kRed30 = Color(0xffff9599);
const kRed40 = Color(0xffFF868C);
const kRed50 = Color(0xffFF777F);
const kRed60 = Color(0xffFF6872);
const kRed70 = Color(0xffFF5865);
const kRed80 = Color(0xffFF4859);
const kRed90 = Color(0xffF1374D);
const kRed100 = Color(0xffE02341);
const kRed200 = Color(0xffD00136);
const kRed300 = Color(0xffC0002B);
const kRed400 = Color(0xffAF0020);
const kRed500 = Color(0xff9F0016);
const kRed600 = Color(0xff8F000A);
const kRed700 = Color(0xff7F0000);
const kRed800 = Color(0xff700000);
const kRed900 = Color(0xff620000);

const kRedMain = Color(0xffFF4657);

/*____________________GRAY______________________*/
const kGray0 = Color(0xffFAFFFF);
const kGray10 = Color(0xffECF1F5);
const kGray20 = Color(0xffDDE3E7);
const kGray30 = Color(0xffCFD4D8);
const kGray40 = Color(0xffC1C6CA);
const kGray50 = Color(0xffB3B8BC);
const kGray60 = Color(0xffA5AAAE);
const kGray70 = Color(0xff979CA0);
const kGray80 = Color(0xff8A8F93);
const kGray90 = Color(0xff7D8286);
const kGray100 = Color(0xff707579);
const kGray200 = Color(0xff64686C);
const kGray300 = Color(0xff575C5F);
const kGray400 = Color(0xff4B5053);
const kGray500 = Color(0xff3F4447);
const kGray600 = Color(0xff34383B);
const kGray700 = Color(0xff292D30);
const kGray800 = Color(0xff1E2225);
const kGray900 = Color(0xff14181B);

const kGrayMain = Color(0xff1F2326);



final carouselImages = [
  "assets/images/ascent.jpg",
  "assets/images/bind.jpg",
  "assets/images/breeze.jpg",
  "assets/images/fracture.jpg",
  "assets/images/heaven.jpg",
  "assets/images/icebox.jpg",
  "assets/images/pearl.jpg",
  "assets/images/split.jpg",
];

final viperAbilities = [
  "assets/images/Abilities/Viper/C_Viper.png",
  "assets/images/Abilities/Viper/Q_Viper.png",
  "assets/images/Abilities/Viper/E_Viper.png",
  "assets/images/Abilities/Viper/X_Viper.png",
];

final carouselAgents = [
  "assets/images/Agent_Icons/Jett.png",
  "assets/images/Agent_Icons/Raze.png",
  "assets/images/Agent_Icons/Breach.png",
  "assets/images/Agent_Icons/Omen.png",
  "assets/images/Agent_Icons/Brimstone.png",
  "assets/images/Agent_Icons/Phoenix.png",
  "assets/images/Agent_Icons/Sage.png",
  "assets/images/Agent_Icons/Sova.png",
  "assets/images/Agent_Icons/Viper.png",
  "assets/images/Agent_Icons/Cypher.png",
  "assets/images/Agent_Icons/Reyna.png",
  "assets/images/Agent_Icons/Killjoy.png",
  "assets/images/Agent_Icons/Skye.png",
  "assets/images/Agent_Icons/Yoru.png",
  "assets/images/Agent_Icons/Astra.png",
  "assets/images/Agent_Icons/Kayo.png",
  "assets/images/Agent_Icons/Chamber.png",
  "assets/images/Agent_Icons/Neon.png",
  "assets/images/Agent_Icons/Fade.png",
  "assets/images/Agent_Icons/Harbor.png",
];



TextStyle tungstenBoldFont(Color color, double size, {double opacity = 1}){
  return TextStyle(
    color: Color.fromRGBO(255, 255, 255, opacity),
    fontFamily: "Tungsten",
    fontSize: size,
  );
} //Tungsten Bold Font Reusable

TextStyle valorantFont(Color color, double size){
  return TextStyle(
    color: color,
    fontFamily: "Valorant",
    fontSize: size,
  );
}