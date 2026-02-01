import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruti_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagePicked});
  final ValueChanged<File?> onImagePicked;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });

          try {
            await pickImage();
          } on Exception catch (e) {
            // TODO
          }

          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.textFieldBorderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: fileImage == null
                  ? const Icon(
                      Icons.image_outlined,
                      size: 180,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.file(
                        fileImage!,
                      ),
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      fileImage = null;
                      widget.onImagePicked(null);
                    });
                  },
                  icon: const Icon(Icons.delete, color: AppColors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      fileImage = File(image.path);
      widget.onImagePicked(fileImage!);
    }
  }
}
