import 'package:flutter/material.dart';
import 'package:themoviedb/ui/widgets/elements/radial_percent_widget.dart';
import 'package:themoviedb/resources/resources.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummaryWidget(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _OverviewWidget(),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: _DiscriptionWidget(),
        ),
        SizedBox(height: 20),
        _PeopleWidget(),
      ],
    );
  }
}

class _DiscriptionWidget extends StatelessWidget {
  const _DiscriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his pregnant wife.',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(
          image: AssetImage(AppImages.topHeader),
        ),
        Positioned(
          top: 20,
          left: 10,
          bottom: 20,
          child: Image(
            image: AssetImage(AppImages.subTopHeader),
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Tom Clancy`s Without Remorse',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RadialPercentWidget(
                      percent: 0.72,
                      fillColor: Color.fromARGB(255, 10, 23, 25),
                      lineColor: Color.fromARGB(255, 37, 203, 103),
                      freeColor: Color.fromARGB(255, 25, 54, 21),
                      lineWidth: 5,
                      child: Text('72'),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'User Score',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(width: 2, height: 15, color: Colors.grey),
        TextButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.play_arrow),
                SizedBox(width: 5),
                Text(
                  'Play Treiler',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(29, 29, 29, 1.0),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        child: Text(
          'R, 04/29/2021 (US), 1h 49m, Action, Thriller,',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
    // return ColoredBox(
    //   color: const Color.fromRGBO(29, 29, 29, 1.0),
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
    //     child: RichText(
    //       textAlign: TextAlign.center,
    //       maxLines: 3,
    //       text: const TextSpan(
    //         children: [
    //           TextSpan(
    //             text: 'R,',
    //             style: TextStyle(
    //               fontSize: 18,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //           TextSpan(
    //             text: ' 04/29/2021,',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           TextSpan(
    //             text: ' (US),',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           TextSpan(
    //             text: ' 1h 49m,',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           TextSpan(
    //             text: ' Action,',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //           TextSpan(
    //             text: ' Thriller',
    //             style: TextStyle(
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});
  final nameStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  final jobTitleStyle = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Stefano Sollima', style: nameStyle),
                Text('Director', style: jobTitleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tom Clancy', style: nameStyle),
                Text('Novel', style: jobTitleStyle),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Will Staples', style: nameStyle),
                Text('Screenplay', style: jobTitleStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Taylor Sheridan', style: nameStyle),
                Text('Screenplay', style: jobTitleStyle),
              ],
            ),
          ],
        )
      ],
    );
  }
}
