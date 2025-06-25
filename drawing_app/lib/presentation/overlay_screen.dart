
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LiveCameraOverlayScreen extends StatefulWidget {
  final String overlayImagePath;

  const LiveCameraOverlayScreen({super.key, required this.overlayImagePath});

  @override
  State<LiveCameraOverlayScreen> createState() => _LiveCameraOverlayScreenState();
}

class _LiveCameraOverlayScreenState extends State<LiveCameraOverlayScreen> {
  CameraController? _cameraController;
  double _opacity = 0.5;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere((cam) => cam.lensDirection == CameraLensDirection.back);

    _cameraController = CameraController(backCamera, ResolutionPreset.ultraHigh);
    await _cameraController!.initialize();
    if (mounted) setState(() {});
  }

  

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Live Overlay"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          
          Positioned.fill(
            child: CameraPreview(_cameraController!),
          ),

          
          Positioned.fill(
            child: Center(
              child: Opacity(
                opacity: _opacity,
                child: Transform.scale(
                  scale: _scale,
                  child: Image.asset(widget.overlayImagePath),
                ),
              ),
            ),
          ),

         
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text("Opacity: ${_opacity.toStringAsFixed(2)}"),
                Slider(
                  value: _opacity,
                  min: 0,
                  max: 1,
                  onChanged: (val) => setState(() => _opacity = val),
                ),
                const SizedBox(height: 10),
                Text("Scale: ${_scale.toStringAsFixed(2)}x"),
                Slider(
                  value: _scale,
                  min: 0.5,
                  max: 2.5,
                  onChanged: (val) => setState(() => _scale = val),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
