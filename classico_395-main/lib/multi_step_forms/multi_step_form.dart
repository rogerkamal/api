import 'package:flutter/material.dart';

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  int currentStep = 0;

  bool get isFirstStep => currentStep == 0;
  bool get isLastStep => currentStep == steps().length - 1;

  final name = TextEditingController();
  final age = TextEditingController();
  final company = TextEditingController();
  final role = TextEditingController();
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Multi-Step Form')),
        body: isComplete
            ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  Text("Success",textAlign: TextAlign.center,),
                  Spacer(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: () {
                            isComplete = false;
                            currentStep = 0;

                            name.clear();
                            age.clear();
                            company.clear();
                            role.clear();

                            setState(() {

                            });
                          },
                          child: Text("Reset")))
                ],
              ),
            )
            : Stepper(
                steps: steps(),
                currentStep: currentStep,
                onStepContinue: () {
                  if (isLastStep) {
                    setState(() => isComplete = true);
                  } else {
                    setState(() => currentStep += 1);
                  }
                },
                onStepCancel: isFirstStep
                    ? null
                    : () => setState(() {
                          currentStep -= 1;
                        }),
                onStepTapped: (step) => setState(() {
                  currentStep = step;
                }),
                controlsBuilder: (context, details) => Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: details.onStepContinue,
                            child: Text(isLastStep ? 'Confirm' : 'Next')),
                      ),
                      if (!isFirstStep) ...[
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed:
                                  isFirstStep ? null : details.onStepCancel,
                              child: const Text('Back')),
                        ),
                      ]
                    ],
                  ),
                ),
              ));
  }

  List<Step> steps() => <Step>[
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("Personal"),
          content: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: age,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Age'),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Work"),
          content: Column(
            children: [
              TextFormField(
                controller: company,
                decoration: InputDecoration(labelText: 'Company'),
              ),
              TextFormField(
                controller: role,
                decoration: InputDecoration(labelText: 'Job Role'),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep > 2,
          title: const Text("Complete"),
          content: Column(
            children: [
              FieldItemWidget(
                label: 'Full Name',
                content: name.text,
              ),
              SizedBox(
                height: 22,
              ),
              FieldItemWidget(
                label: 'Age',
                content: age.text,
              ),
              Divider(
                color: Colors.blueGrey,
                height: 42,
              ),
              FieldItemWidget(
                label: 'Company',
                content: company.text,
              ),
              SizedBox(
                height: 22,
              ),
              FieldItemWidget(
                label: 'Job Role',
                content: role.text,
              ),
              SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ];

  FieldItemWidget({required String label, required content}) {
    return Row(
      children: [
        Text(label, style: TextStyle(color: Colors.red)),
        SizedBox(
          width: 10,
        ),
        Text(content.toString())
      ],
    );
  }
}
