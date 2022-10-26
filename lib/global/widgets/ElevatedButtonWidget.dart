// ignore_for_file: must_be_immutable
import 'package:testapp/global/allimports.dart';


class ElevatedButtonWidget extends StatelessWidget {
    double? width;
    double? height;
    EdgeInsetsGeometry? margin;
    Color? primary;
    double? fontSize;
    BorderRadiusGeometry? radius;
    void Function()? onPressed;
    String text;
   ElevatedButtonWidget({ Key? key,this.width,
   this.height,
    this. margin,
    this. primary,
    this. fontSize,
   this.radius,
    this.onPressed,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
    width: width,
    height: height ?? 55,
    margin: margin ?? null,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: Theme.of(context).shadowColor,
        elevation: 3,
        backgroundColor: primary ?? ColorPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: radius ?? BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(
              fontSize: fontSize ?? 20,
              color: ColorWhite)),
    ),
  );
  }
}