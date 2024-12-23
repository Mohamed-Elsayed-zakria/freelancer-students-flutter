import 'widgets/apply_for_jobs/proposal.dart';
import 'widgets/apply_for_jobs/benifit.dart';
import 'package:flutter/material.dart';

class ApplyForJobsView extends StatelessWidget {
  const ApplyForJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply for Job"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Proposal(),
            Benifit(),
          ],
        ),
      ),
    );
  }
}
