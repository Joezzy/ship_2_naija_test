import 'package:animate_do/animate_do.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/constants/warehouse_list.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/drop_down.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/custom/txt.dart';
import 'package:toggle_switch/toggle_switch.dart';

class KycTabView extends StatefulWidget {
  const KycTabView({super.key});

  @override
  State<KycTabView> createState() => _KycTabViewState();
}

class _KycTabViewState extends State<KycTabView> {
  int tabIndex = 0;
  int selectedIndex = 0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kycUploadWidget(),
        const SizedBox(height: 16),
        idCardWidget(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget uploadPhotoWidget() =>      FadeInLeft(
    delay: const Duration(milliseconds: 20),
    child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.camera_alt_outlined),
                const SizedBox(width: 8),
                Text(
                  'Upload a recent photo',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, fontSize: MySize.size14),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: GestureDetector(
                onTap: () async {},
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          color: AppTheme.grey,
                        ),
                        Text('image/jpeg')
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Btn(
                    width: MySize.size100,
                    height: MySize.size30,
                    text: "Upload",
                    onPressed: () {}),
              ],
            )
          ],
        ),
  );

  Widget idCardWidget() =>      FadeInLeft(
    delay: const Duration(milliseconds: 20),
    child: PageLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uploadPhotoWidget(),
              Row(
                children: [
                  const Icon(Icons.image_outlined),
                  const SizedBox(width: 8),
                  Text(
                    'Upload a valid means of identification',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: MySize.size14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Label(
                label: "ID  Type",
                child: MyDropDown(
                    hint: "Select ID type",
                    value: null,
                    itemFunction: idTypeList.map((item) {
                      return DropdownMenuItem(
                        value: item.caption.toString(),
                        child: Text("${item.caption}"),
                      );
                    }).toList(),
                    onChanged: (newValue) async {
                      // productionController.selectedStage.value = newValue.toString();
                    }),
              ),
              const SizedBox(height: 14),
              const Text('Unique ID Identifier'),
              const Txt(
                readOnly: true,
                hintText: '12345443',
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: Container(
                      width: MySize.size130,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('ID Back'),
                            // idBack == null
                            //     ?
                            Icon(
                              Iconsax.gallery,
                              size: 100,
                              color: Colors.grey,
                            )
                            // : Image.file(File(idBack!.path), height: 130)
                          ],
                        ),
                      ),
                    ),
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: Container(
                      width: MySize.size130,
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text('ID Back'),
                            // idBack == null
                            //     ?
                            Icon(
                              Iconsax.gallery,
                              size: 100,
                              color: Colors.grey,
                            )
                            // : Image.file(File(idBack!.path), height: 130)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
  );

  Widget kycUploadWidget() {
    return      FadeInRight(
      delay: const Duration(milliseconds: 20),
      child: PageLayout(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'KYC Upload',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              ToggleSwitch(
                minWidth: MySize.size100,
                cornerRadius: 40,
                activeBgColors: [
                  [Colors.green[800]!],
                  [Colors.green[800]!],
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: AppTheme.grey,
                inactiveFgColor: Colors.white,
                initialLabelIndex: tabIndex,
                totalSwitches: 2,
                labels: const [
                  'Individual',
                  'Business',
                ],
                radiusStyle: true,
                onToggle: (index) {
                  // setState(() {
                  tabIndex = index!;
                  // });
                  print('switched to: $index');
                  print('switched to: $tabIndex');
                },
              ),
              const SizedBox(height: 16),
              const Text(
                  'Kindly make sure you have all the required documents ready to complete the verification process.'),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: selectedIndex == 0 ? Colors.green[900] : Colors.black,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Passport Photograph',
                    style: TextStyle(
                        color: selectedIndex == 0
                            ? Colors.green[900]
                            : Colors.black),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.check_circle_outline,
                    color: selectedIndex == 0 ? Colors.green[900] : Colors.black,
                  )
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: selectedIndex == 1 ? Colors.green[900] : Colors.black,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Valid means of identification\n(Int. Passport, Voter\'s Card)',
                    style: TextStyle(
                      color:
                          selectedIndex == 1 ? Colors.green[900] : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.check_circle_outline,
                    color: selectedIndex == 1 ? Colors.green[900] : Colors.black,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
