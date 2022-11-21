import 'package:flutter/material.dart';
import 'package:sepia_app/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ClassModel {
  ClassModel({required this.id, required this.title, required this.imageName});
  int id;
  String title;
  String imageName;
}

class ClassesPage extends StatefulWidget {
  const ClassesPage({super.key});

  @override
  State<ClassesPage> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  @override
  Widget build(BuildContext context) {
    List<ClassModel> _className = [
      ClassModel(
          id: 0,
          title: AppLocalizations.of(context)!.kurdish,
          imageName: Images.LANGUAGE),
      ClassModel(
          id: 1,
          title: AppLocalizations.of(context)!.science,
          imageName: Images.SCIENCE),
      ClassModel(
          id: 2,
          title: AppLocalizations.of(context)!.maths,
          imageName: Images.MATHS),
      ClassModel(
          id: 3,
          title: AppLocalizations.of(context)!.sports,
          imageName: Images.SPORT),
      ClassModel(
          id: 4,
          title: AppLocalizations.of(context)!.religion,
          imageName: Images.ISLAMIC)
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView.builder(
          itemCount: _className.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('view_post'),
                          child: Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text(_className[index].title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(18)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          _className[index].imageName),
                                      fit: BoxFit.fill),
                                ),
                                height: 160,
                                //becareful that there is aspect ratio of 2.1
                                width: 340,
                              )
                            ]),
                          ))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
