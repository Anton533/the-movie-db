import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: Row(
                  children: [
                    const Image(image: AssetImage(AppImages.mortalKombat)),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Mortal Kombat ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'April, 7, 2022',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  splashColor: Colors.green,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
