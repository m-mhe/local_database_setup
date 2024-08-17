import 'package:flutter/material.dart';
import 'package:local_database_setup/data_entity.dart';
import 'package:local_database_setup/local_database_connection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tECOne = TextEditingController();
  final TextEditingController _tECTwo = TextEditingController();
  List<DataEntity> _output = [];
  Future<void> _fetchData() async{
    _output = await LocalDatabaseConnection.fetch();
    setState(() {});
  }
  @override
  initState() {
    _fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _tECOne,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _tECTwo,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  DataEntity dataEntity = DataEntity(
                      one: _tECOne.text,
                      two: _tECTwo.text,
                      dateTime: DateTime.now());
                  LocalDatabaseConnection.insert(dataEntity);
                  await _fetchData();
                },
                child: const Icon(Icons.add)),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _output.length,
                  itemBuilder: (context, i){
                return ListTile(
                  title: Text(_output[i].one),
                  subtitle: Text(_output[i].two),
                  trailing: Text(_output[i].dateTime.minute.toString()),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _tECTwo.dispose();
    _tECOne.dispose();
  }
}
