import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/widgets/character_card.dart';

import '../../core/models/character.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool isLoading = false;
  List<Character>? results;
  String gender = 'All';
  String status = 'All';

  void search(String value) async {
    if (value.trim().isEmpty) {
      return;
    }
    results = null;
    isLoading = true;
    setState(() {});
    try {
      final baseURL = 'https://rickandmortyapi.com/api/character/?name=$value';
      final genderFilter = (gender == "All" ? '' : "&gender=$gender");
      final statusFilter = (status == "All" ? '' : "&status=$status");
      final response = await Dio().get(baseURL + genderFilter + statusFilter);
      results = [];
      for (var i in response.data['results']) {
        results!.add(Character.fromJson(i));
      }
    } catch (e, s) {
      print(e);
      print(s);
      results = [];
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: search,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                label: Text("Character name..."),
              ),
            ),
            SizedBox(height: 12),
            DropdownButton(
              isExpanded: true,
              hint: Text(status != 'All' ? status : 'Status'),
              items: [
                DropdownMenuItem(
                  value: "All",
                  child: Text('All'),
                ),
                DropdownMenuItem(
                  value: "Alive",
                  child: Text('Alive'),
                ),
                DropdownMenuItem(
                  value: "Dead",
                  child: Text('Dead'),
                ),
                DropdownMenuItem(
                  value: "Unknown",
                  child: Text('Unknown'),
                ),
              ],
              onChanged: (v) {
                status = v as String;
                setState(() {});
              },
            ),
            Row(
              children: [
                Checkbox(
                  value: gender == 'All',
                  onChanged: (v) {
                    gender = 'All';
                    setState(() {});
                  },
                ),
                Text("All Genders"),
                Checkbox(
                  value: gender == 'Male',
                  onChanged: (v) {
                    gender = 'Male';
                    setState(() {});
                  },
                ),
                Text('Male'),
                Checkbox(
                  value: gender == 'Female',
                  onChanged: (v) {
                    gender = 'Female';
                    setState(() {});
                  },
                ),
                Text('Female'),
              ],
            ),
            Expanded(
              child: Builder(builder: (context) {
                if (isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (results != null && results!.isEmpty) {
                  return Center(
                    child: Text('No Results!'),
                  );
                }
                return ListView.builder(
                  itemCount: results?.length ?? 0,
                  itemBuilder: (context, index) {
                    return CharacterCard(
                      character: results![index],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
