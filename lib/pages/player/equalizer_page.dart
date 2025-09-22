import 'package:flutter/material.dart';
import '../../AppStyle.dart';

class EqualizerPage extends StatefulWidget {
  const EqualizerPage({super.key});

  @override
  State<EqualizerPage> createState() => _EqualizerPageState();
}

class _EqualizerPageState extends State<EqualizerPage> {
  bool isEqualizerEnabled = true;
  List<double> bandLevels = [-2.0, 3.0, 1.0, -4.0, 2.5];
  String currentPreset = 'Custom';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        title: const Text('Equalizer'),
        actions: [
          Switch(
            value: isEqualizerEnabled,
            onChanged: (value) {
              setState(() {
                isEqualizerEnabled = value;
              });
            },
            activeColor: TColor.primary,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildPresetSelector(),
            const SizedBox(height: 30),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(bandLevels.length, (index) {
                  return _buildBandSlider(index, ['60Hz', '230Hz', '910Hz', '3KHz', '14KHz'][index]);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPresetSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: TColor.primaryText.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: currentPreset,
        isExpanded: true,
        dropdownColor: const Color(0xff383B49),
        style: TextStyle(color: TColor.primaryText, fontSize: 16),
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down, color: TColor.primaryText80),
        onChanged: (String? newValue) {
          setState(() {
            currentPreset = newValue!;
            // TODO: Apply preset values to bandLevels
          });
        },
        items: <String>['Custom', 'Pop', 'Rock', 'Jazz', 'Classical', 'Hip-Hop']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBandSlider(int bandIndex, String label) {
    return Column(
      children: [
        Expanded(
          child: RotatedBox(
            quarterTurns: -1,
            child: Slider(
              value: bandLevels[bandIndex],
              min: -12.0,
              max: 12.0,
              divisions: 24,
              onChanged: isEqualizerEnabled
                  ? (value) {
                      setState(() {
                        bandLevels[bandIndex] = value;
                        currentPreset = 'Custom';
                      });
                    }
                  : null,
              activeColor: TColor.primary,
              inactiveColor: TColor.primaryText28,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(label, style: TextStyle(color: TColor.primaryText80, fontSize: 12)),
      ],
    );
  }
}
