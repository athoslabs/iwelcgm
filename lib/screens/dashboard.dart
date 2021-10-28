import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:amplify_api/amplify_api.dart';
import 'package:iwelcgm/models/DeviceReading.dart';

import 'package:iwelcgm/widgets/login.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:iwelcgm/widgets/navigation_drawer_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:async';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen(
      {Key? key, required this.cgmDeviceName, required this.device})
      : super(key: key);

  final String cgmDeviceName;
  final BluetoothDevice device;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AuthUser? _user;

  late List<LiveData> chartData;
  late double gaugeValue = 0;
  late String gaugeReading = '';
  late bool isReady;
  late int cgmReading = 0;
  late int fastingNumber = 0;
  late double constantNumber = 1.1;
  late int glucoseNumber = 0;
  late double intervalAverageNumber = 1;
  late Icon trendingIcon = const Icon(Icons.arrow_forward_outlined);
  bool isFirstTime = true;
  bool isCalibrating = true;
  DeviceReading newDeviceReading = DeviceReading(
      userId: '',
      glucoseNumber: 1,
      timeTaken: TemporalTimestamp.now(),
      deviceId: '');

  late StreamSubscription _subscription;

  late BluetoothDeviceState deviceState;

  Future<void> _getUser() async {
    await Future.wait([
      Amplify.Auth.getCurrentUser().then((user) {
        setState(() {
          _user = user;
        });
      })
    ]);
  }

  Future createAlertFastingNumber(BuildContext context) {
    TextEditingController dialogController = TextEditingController();

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Fasting Number'),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: dialogController,
            ),
            actions: [
              MaterialButton(
                elevation: 5.0,
                child: const Text('Submit'),
                onPressed: () {
                  Navigator.of(context).pop(dialogController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  void initState() {
    _getUser();

    chartData = getChartData();
    Timer.periodic(const Duration(minutes: 3), updateDataSource);
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      createAlertFastingNumber(context).then((onValue) {
        fastingNumber = int.parse(onValue);
        print('FASTING VALUE IS: $fastingNumber');
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Device: ${widget.cgmDeviceName}',
          style: const TextStyle(fontSize: 14),
        ),
        backgroundColor: Colors.teal,
        actions: [
          MaterialButton(
            onPressed: () {
              widget.device.disconnect();
              Amplify.DataStore.clear();
              Amplify.Auth.signOut().then((_) {
                // Navigator.pushReplacementNamed(context, '/login');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              });
            },
            child: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_user == null)
              const Text('Loading...')
            else ...[
              // Text('Hello'),

              // Text('Connected Device: ${widget.cgmDeviceName}'),
              // SizedBox(
              //   height: 5,
              // ),
              //Text(_user!.userId),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/iwel_logo_sm.png',
                        width: 60,
                        height: 60,
                      )),
                  Text('CONTINUOUS GLUCOSE MONITORING',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400)),
                  // Text(_user!.username),

                  Container(
                    height: 275,
                    width: 165,
                    child: SfRadialGauge(axes: <RadialAxis>[
                      RadialAxis(
                          showLabels: false,
                          minimum: 40,
                          maximum: 400,
                          showTicks: false,
                          // interval: 10,
                          ranges: <GaugeRange>[
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 40,
                                endValue: 80,
                                color: Colors.blue),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 80,
                                endValue: 115,
                                color: Colors.greenAccent),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 115,
                                endValue: 150,
                                color: Colors.green),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 150,
                                endValue: 180,
                                color: Colors.deepOrange),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 180,
                                endValue: 215,
                                color: Colors.pink),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 215,
                                endValue: 250,
                                color: Colors.red),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 215,
                                endValue: 250,
                                color: Colors.red),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 250,
                                endValue: 280,
                                color: Colors.purple),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 280,
                                endValue: 315,
                                color: Colors.deepPurpleAccent),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 315,
                                endValue: 350,
                                color: Colors.deepPurple),
                            GaugeRange(
                                startWidth: 30,
                                endWidth: 30,
                                startValue: 350,
                                endValue: 400,
                                color: Colors.deepPurple),
                          ],
                          pointers: <GaugePointer>[
                            NeedlePointer(
                              // knobStyle: KnobStyle(color: Colors.teal),
                              needleLength: .80,
                              needleEndWidth: 6.0,
                              // needleColor: Colors.teal,
                              enableAnimation: true,
                              value: gaugeValue,
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Column(
                                  children: [
                                    const SizedBox(
                                      height: 170,
                                    ),
                                    const Text(
                                      'Now',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        (isCalibrating
                                            ? const Text(
                                                'Activating',
                                                style: TextStyle(
                                                    height: .95,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : Text(
                                                gaugeReading,
                                                style: const TextStyle(
                                                    height: .95,
                                                    fontSize: 35,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        if (gaugeValue > 0)
                                          trendingIcon
                                        else
                                          Text(' '),
                                      ],
                                    ),
                                    const Text(
                                      'mg/dl',
                                      style: TextStyle(
                                          height: .75,
                                          fontSize: 12,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 0.5)
                          ]),
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 12, bottom: 20, top: 60),
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        height: 225,
                        child: SfCartesianChart(
                            series: <LineSeries<LiveData, int>>[
                              LineSeries<LiveData, int>(
                                enableTooltip: true,
                                onRendererCreated:
                                    (ChartSeriesController controller) {},
                                dataSource: chartData,
                                color: const Color.fromRGBO(192, 108, 132, 1),
                                xValueMapper: (LiveData currentTime, _) =>
                                    currentTime.time,
                                yValueMapper: (LiveData current, _) =>
                                    current.reading,
                              )
                            ],
                            enableAxisAnimation: true,
                            primaryXAxis: NumericAxis(
                                autoScrollingMode: AutoScrollingMode.end,
                                majorGridLines: const MajorGridLines(width: 1),
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                                interval: 3,
                                title: AxisTitle(text: 'Time Interval')),
                            primaryYAxis: NumericAxis(
                                axisLine: const AxisLine(width: 0),
                                majorTickLines: const MajorTickLines(size: 0),
                                title: AxisTitle(text: 'Reading')))),
                  )
                ],
              )
            ]
          ],
        ),
      ),
    );
  }

  void _scanForServices() async {
    List<BluetoothService> services = await widget.device.discoverServices();
    for (var service in services) {
      print('${service.characteristics.toString()}');
      _readCharacteristics(service);
    }
  }

  void _readCharacteristics(BluetoothService service) async {
    // Reads all characteristics
    var characteristics = service.characteristics;
    for (BluetoothCharacteristic c in characteristics) {
      if (c.uuid.toString() == '0000ffb1-0000-1000-8000-00805f9b34fb') {
        List<int> value = await c.read();
        print('The VALUE IS: ${value.first}');
        cgmReading = value.first;

        String cgmDeviceName = widget.cgmDeviceName;

        print(widget.cgmDeviceName);
        //cgmDeviceName: cgmDeviceName);

        setState(() {
          if (glucoseNumber == gaugeValue) {
            trendingIcon = const Icon(
              Icons.arrow_forward_outlined,
              size: 50,
            );
          } else if (glucoseNumber < gaugeValue) {
            trendingIcon = const Icon(
              Icons.trending_down_outlined,
              size: 50,
            );
          } else if (glucoseNumber > gaugeValue) {
            trendingIcon = const Icon(
              Icons.trending_up_outlined,
              size: 50,
            );
          }
        });
      }
    }
  }

  // double num = 0;
  // void _gatherReadings(Timer timer) async {
  //   for (int i = 0; i < 16; i++) {
  //     await new Future.delayed(const Duration(milliseconds: 11250));
  //     _scanForServices();
  //     num += cgmReading;
  //   }
  //   num = num / 16;
  //   print('THE AVERAGE IS: $num');
  //   updateDataSource();
  // }

  int time = 19;
  double num = 0;
  void updateDataSource(Timer timer) async {
    // _scanForServices();
    // chartData.add(LiveData(time++, cgmReading));
    var user = _user!.userId;

    await widget.device.disconnect().then((_) async => {
          await widget.device
              .connect(autoConnect: true, timeout: const Duration(seconds: 30))
              .then((_) => {
                    num = 0,
                    for (int i = 0; i < 16; i++)
                      {
                        Future.delayed(const Duration(milliseconds: 11250)),
                        _scanForServices(),
                        print('THE CGM READING NUMBER IS: $cgmReading'),
                        num += cgmReading
                      },
                    intervalAverageNumber = num / 16,
                    if (isFirstTime)
                      {
                        if (intervalAverageNumber > 0)
                          {
                            constantNumber =
                                (fastingNumber / intervalAverageNumber),
                            isFirstTime = false
                          }
                        else
                          {constantNumber = 1.1},
                      },
                    print('FIRST CONSTANT NUMBER IS: $constantNumber'),
                    glucoseNumber =
                        (intervalAverageNumber * constantNumber).round(),
                    isCalibrating = false,
                    print('INTERVAL AVERAGE NUMBER IS: $intervalAverageNumber'),
                    print('CONSTANT NUMBER IS: $constantNumber'),
                    print('GLUCOSE NUMBER IS: $glucoseNumber'),
                    newDeviceReading = DeviceReading(
                      glucoseNumber: glucoseNumber,
                      userId: user,
                      timeTaken: TemporalTimestamp.now(),
                      deviceId: widget.cgmDeviceName,
                    ),
                  }),

          // chartData.add(LiveData(time++, cgmReading))
          chartData.add(LiveData(time++, glucoseNumber))
        });
    if (glucoseNumber > 0) {
      try {
        await Amplify.DataStore.save(newDeviceReading);
      } catch (e) {
        throw ('An error occurred while saving Device Reading: $e');
      }
    }

    setState(() {
      if (glucoseNumber == gaugeValue) {
        trendingIcon = const Icon(
          Icons.arrow_forward_outlined,
          size: 60,
        );
      } else if (glucoseNumber < gaugeValue) {
        trendingIcon = const Icon(
          Icons.arrow_downward_outlined,
          size: 60,
        );
      } else if (glucoseNumber > gaugeValue) {
        trendingIcon = const Icon(
          Icons.arrow_upward_outlined,
          size: 60,
        );
      }
      gaugeValue = chartData.last.reading.toDouble();
      gaugeReading = chartData.last.reading.toString();
    });
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(0, 0),
    ];
  }
}

class LiveData {
  LiveData(this.time, this.reading);
  final int time;
  final num reading;
}
