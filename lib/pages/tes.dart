import 'package:flutter/material.dart';
import 'package:healthcare/models/model.dart';
import 'package:healthcare/models/repository.dart';

class GetDataTes extends StatefulWidget {
  const GetDataTes({super.key});

  @override
  State<GetDataTes> createState() => _GetDataTesState();
}

class _GetDataTesState extends State<GetDataTes> {
  List<Album> listAlbum = [];
  Repository repository = Repository();

  getData() async {
    listAlbum = await repository.getData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: Text(
              listAlbum[index].jawaban,
            ),
          );
        },
        itemCount: listAlbum.length,
      ),
    );
  }
}
