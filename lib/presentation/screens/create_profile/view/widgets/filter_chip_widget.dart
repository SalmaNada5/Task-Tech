import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FilterChipWidget extends StatefulWidget {
  final String chipName;
  const FilterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  FilterChipWidgetState createState() => FilterChipWidgetState();
}

class FilterChipWidgetState extends State<FilterChipWidget> {
  var _isSelected = false;
  late Icon icon;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: const EdgeInsetsDirectional.only(top:3,bottom: 3,start: 3,end: 3),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.chipName),
           SizedBox(
            width:MediaQuery.of(context).size.width * 0.01,
          ),
          icon = _isSelected
              ? const Icon(Icons.check, color: Colors.white, size: 22, weight: 400)
              : const Icon(Icons.add,
                  color: Color.fromRGBO(166, 166, 166, 0.8),
                  size: 22,
                  weight: 400)
        ],
      ),
      
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      backgroundColor: Colors.white,
      showCheckmark: false,
      checkmarkColor: Colors.white,
      side: const BorderSide(
          width: 1,
          color: Color.fromRGBO(217, 217, 217, 1),
          style: BorderStyle.solid),
     

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      selectedColor: Theme.of(context).primaryColor,
      labelStyle: GoogleFonts.poppins(
        color: _isSelected ? Colors.white : const Color.fromRGBO(166, 166, 166, 0.8),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
