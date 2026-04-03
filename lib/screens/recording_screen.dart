import 'package:flutter/material.dart';
import 'package:record/record.dart';
import '../utils/download_helper.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final AudioRecorder _record = AudioRecorder();
  bool _isRecording = false;

  void _toggleRecording() async {
    if (_isRecording) {
      final path = await _record.stop();
      setState(() { _isRecording = false; });
      if (path != null) {
         downloadAudio(path);
      }
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/review');
      }
    } else {
      if (await _record.hasPermission()) {
        await _record.start(
          const RecordConfig(encoder: AudioEncoder.wav), 
          path: 'audio_${DateTime.now().millisecondsSinceEpoch}.wav'
        );
        setState(() { _isRecording = true; });
      }
    }
  }

  @override
  void dispose() {
    _record.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        title: const Text('SEAL', style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF003366)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _isRecording ? const Color(0xFF42D7A5).withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: _isRecording ? const Color(0xFF42D7A5) : Colors.grey, size: 10),
                        const SizedBox(width: 6),
                        Text(_isRecording ? 'LIVE RECORDING' : 'TAP MIC TO START', style: TextStyle(color: _isRecording ? const Color(0xFF007556) : Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 10)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Capture Your\nAgreement',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF003366), height: 1.2),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Speak clearly. We are identifying terms in real-time.',
                    style: TextStyle(fontSize: 14, color: Color(0xFF6A798C)),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.g_translate, color: Color(0xFF007556), size: 16),
                        SizedBox(width: 8),
                        Text('LISTENING IN HINDI / ENGLISH', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF007556))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _toggleRecording,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isRecording ? Colors.redAccent : const Color(0xFF003366),
                        ),
                        child: Icon(_isRecording ? Icons.stop : Icons.mic, color: Colors.white, size: 64),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Mock Visualizer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(7, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 4,
                          height: _isRecording ? ((index % 2 == 0) ? 24 : 40) : 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFF007556),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFE5ECF2),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              ),
              child: const Text('REAL-TIME TRANSCRIPT', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6A798C), fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }
}
