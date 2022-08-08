import 'package:climate_hackerz/utils/generate_address.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../../../../component/button.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_fonts.dart';
import '../../../../constants/app_route.dart';
import '../../../../constants/resources.dart';
import '../../../../shared/success.dart';


class IdentityVerification extends StatefulWidget {
  IdentityVerification({Key? key}) : super(key: key);

  @override
  State<IdentityVerification> createState() => _IdentityVerificationState();
}

class _IdentityVerificationState extends State<IdentityVerification> {
  XFile? _image;

  void setImage(image) {
    setState(() {
      _image = image;
    });
  }

    _imgFromGallery() async {
    XFile? image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);
    setImage(image);
  }
  String? _idType;
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop();
          return true; //  exit the app
        },
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [ Padding(
                padding: const EdgeInsets.only(left:16.0),
                child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                          Padding(
                    padding: const EdgeInsets.symmetric(vertical:8),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                    'Step 2 of 3',
                    style: AppFonts.body1,
                ),
                SizedBox(height: 4,),
                Text(
                    'Personal Details',
                    style: AppFonts.body1.copyWith(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                ),
            ],
                    ),
                  ), Container(
            width: _getSize.width,
            height: 0.5,
            color: Pallete.kSecondaryColor,
                  ),   SizedBox(height: 8,),
                 
                       
                      ],
                    ),
              ),
                 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ SizedBox(
                        height: _getSize.height * 0.02,
                      ),
                      Text(
                        'Identity Verification',
                        style: AppFonts.h1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: _getSize.width * 0.65,
                        child: Text(
                          'Please upload a good quality( not blurry) image of ONE of the following IDs:',
                          style: AppFonts.body1,
                        ),
                      ),
                      SizedBox(
                        height: _getSize.height * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1. Driver\'s license',
                            style: AppFonts.body1.copyWith(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '2. International Passport',
                            style: AppFonts.body1.copyWith(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '3. Voter\'s Card(PVC)',
                            style: AppFonts.body1.copyWith(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            '4. National ID Card',
                            style: AppFonts.body1.copyWith(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _getSize.height * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Select ID Type',
                              textAlign: TextAlign.center,
                              style: AppFonts.body1.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Pallete.shadowcolor),
                              height: 70,
                              width: double.infinity,
                              child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton(
                                  hint: const Text(
                                    'Select',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  value: _idType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _idType = newValue.toString();
                                    });
                                  },
                                  items: idType
                                      .map(
                                        (idTypeItem) => DropdownMenuItem(
                                          onTap: () {
                                            // _personalDetails['aboutUs'] =
                                            // aboutUsItem['media'];
                                          },
                                          child: Text(idTypeItem['type'],
                                              style: AppFonts.body1.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 14)),
                                          value: idTypeItem['id'].toString(),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ))),
                        ],
                      ),
                      SizedBox(
                        height: _getSize.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: (() => _imgFromGallery()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Upload ID',
                                style: AppFonts.body1.copyWith(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Pallete.shadowcolor),
                              height: 70,
                              width: _getSize.width,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Click here to upload',
                                        style: AppFonts.body1.copyWith(fontSize: 14)),
                                    const Icon(Icons.upload_rounded)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: _getSize.height * 0.1,
                      ),
                      ButtonWithFuction(
                                  text: 'Submit'.toUpperCase(),
                                  onPressed: () {
                                 GenerateUtil.generate(context);
                                   
                                  }),],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
