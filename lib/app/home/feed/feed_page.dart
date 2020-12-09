import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterblog/app/home/bottom_navigation_view/bottom_navigation_change_notifier.dart';
import 'package:flutterblog/common_widgets/empty_content.dart';
import 'package:flutterblog/common_widgets/process_completion_card.dart';
import 'package:flutterblog/constants.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationView = Provider.of<BottomNavigationChangeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 2.0,
        centerTitle: false,
        backgroundColor: Colors.grey[50],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          EmptyContent(
            title: 'Welcome to $appName',
            content:
                'Follow people to start seeing the blogs and stories they share',
          ),
          Expanded(
            child: Center(
              child: ProcessCompletionCard(
                title: 'Complete Your Profile',
                subtitle:
                    'Finish setting up your profile so that friends can find you.',
                actionButtonText: 'Get Started',
                icon: EvaIcons.personOutline,
                borderRadius: 12.0,
                elevation: 3.0,
                onPressed: () => navigationView.changeView(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
