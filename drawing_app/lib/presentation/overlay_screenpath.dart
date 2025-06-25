import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class LiveCameraOverlayScreen2 extends StatefulWidget {
  final String overlayImagePath; 

  const LiveCameraOverlayScreen2({super.key, required this.overlayImagePath});

  @override
  State<LiveCameraOverlayScreen2> createState() => _LiveCameraOverlayScreen2State();
}

class _LiveCameraOverlayScreen2State extends State<LiveCameraOverlayScreen2> {
  CameraController? _cameraController;
  double _opacity = 0.5;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.back);

    _cameraController = CameraController(backCamera, ResolutionPreset.medium);
    await _cameraController?.initialize();

    if (mounted) setState(() {});
  }

  
  @override
  Widget build(BuildContext context) {
    if (!(_cameraController?.value.isInitialized ?? false)) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Camera + Overlay"),backgroundColor: Colors.blueAccent,),
      body: Stack(
        children: [
          
          Positioned.fill(child: CameraPreview(_cameraController!)),

          
          Positioned.fill(
            child: Center(
              child: Opacity(
                opacity: _opacity,
                child: Transform.scale(
                  scale: _scale,
                  child: Image.file(
                    File(widget.overlayImagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
          ),
        ],
      ),
    );
  }
}