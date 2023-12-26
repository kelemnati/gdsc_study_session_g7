import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List text = ['Health', 'Science', 'History', 'Technology', 'Philosophy'];
  List<Icon> icons = const [
    Icon(Icons.medical_information_sharp),
    Icon(Icons.science),
    Icon(Icons.history_edu),
    Icon(Icons.satellite_alt),
    Icon(Icons.book)
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: StyledButton(name: text[index], icon: icons[index]),
        );
      },
    );
  }
}

class StyledButton extends StatelessWidget {
  const StyledButton({super.key, required this.name, required this.icon});
  final String name;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.only(left: 10, right: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Colors.grey[200]),
      child: Row(children: [
        icon,
        const SizedBox(width: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ]),
    );
  }
}
