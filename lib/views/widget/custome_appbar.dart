import 'package:flutter/material.dart';
//"Find Product"
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.titlAppbar,
   this.onPressedIcone,
    this.onPressedSearch, 
   required this.onPressedIconeFavorite, this.onChanged, required this.searchController});
  final String titlAppbar ;
  final void Function()? onPressedIcone;
  final void Function()? onPressedSearch;
    final void Function()? onPressedIconeFavorite;
    final void Function(String)? onChanged;
   final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: onChanged,  //بتعرفك ان في سيرش ولا لا
                      controller: searchController,
                      decoration: InputDecoration(
                        prefixIcon:IconButton(
                      onPressed:onPressedSearch,
                      icon: Icon(Icons.search)),
                        hintText: titlAppbar,
                        hintStyle: TextStyle(fontSize: 18),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 207, 207, 207),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                    width: 60,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: IconButton(
                      onPressed:onPressedIcone,
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 207, 207, 207),
                    ),
                    width: 60,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: IconButton(
                      onPressed:onPressedIconeFavorite,
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        size: 30,
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                    ),
                  )
                ],
              ),
            );
  }
}