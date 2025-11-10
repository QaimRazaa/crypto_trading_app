import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subTitle;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final Color? subTitleColor;
  final double letterSpacing;
  final TextAlign textAlign;
  final VoidCallback? subTitleOnTap;

  const SectionTitle({
    super.key,
    required this.title,
    this.subTitle,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.subTitleColor,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.start,
    this.subTitleOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: GoogleFonts.roboto(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? Colors.black,
            letterSpacing: letterSpacing,
          ),
        ),
        if(subTitle != null)
          GestureDetector(
            onTap: subTitleOnTap,
            child: Text(
              subTitle!,
              textAlign: textAlign,
              style: GoogleFonts.roboto(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: subTitleColor ?? Colors.black,
                letterSpacing: letterSpacing,
              ),
            ),
          ),
      ],
    );
  }
}
