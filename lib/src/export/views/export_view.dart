import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ship_to_naija/constants/warehouse_list.dart';
import 'package:ship_to_naija/core/apptheme.dart';
import 'package:ship_to_naija/core/sizeConfig.dart';
import 'package:ship_to_naija/custom/btn.dart';
import 'package:ship_to_naija/custom/drop_down.dart';
import 'package:ship_to_naija/custom/page_layout.dart';
import 'package:ship_to_naija/custom/txt.dart';

class ExportView extends StatefulWidget {
  ExportView({Key? key}) : super(key: key);

  @override
  _ExportViewState createState() => _ExportViewState();
}

class _ExportViewState extends State<ExportView> {
  final int totalPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // loginController.autoLogin(context);
  }

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        // title: Text("Create Export",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: AppTheme.black,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: MySize.size20),
              child: Text("Create Export", style: AppTheme.formHeaderStyle()),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: OnBoardingProgress(
                ticks: _currentPage,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MySize.size20,
                // right: MySize.size15,
                // left: MySize.size15,
              ),
              child: SizedBox(
                height: MySize.screenHeight,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    _currentPage = page;
                    setState(() {});
                  },
                  children: <Widget>[
                    senderFormWidget(),
                    receiverFormWidget(),
                    deliveryInfoWidget(),
                    addBoxWidget()
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MySize.size20,
            ),
          ],
        ),
      ),
    );
  }

  FadeInRight stepButtons() {
    return FadeInRight(
      delay: const Duration(milliseconds: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 20),
        child: Row(
          mainAxisAlignment: _currentPage == 0
              ? MainAxisAlignment.end
              : MainAxisAlignment.spaceBetween,
          children: [
            if (_currentPage != 0)
              Btn(
                  width: MySize.size100,
                  height: MySize.size40,
                  borderColor: AppTheme.primaryColor,
                  fontColor: AppTheme.primaryColor,
                  fontSize: MySize.size12,
                  text: "Previous",
                  enabledColor: AppTheme.white,
                  onPressed: () {
                    _currentPage--;
                    _pageController!.jumpToPage(_currentPage);
                    setState(() {});
                  }),
            Btn(
                width: MySize.size100,
                height: MySize.size40,
                borderColor: AppTheme.primaryColor,
                fontSize: MySize.size12,
                text: "Continue",
                onPressed: () {
                  _currentPage++;
                  _pageController!.jumpToPage(_currentPage);
                  setState(() {});
                }),
          ],
        ),
      ),
    );
  }

  Widget senderFormWidget() {
    return PageLayout(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(), // <--- change to this
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: MySize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Sender',
                style: AppTheme.exportHeaderStyle(),
              ),
              const Text(
                  'Search from your saved addresses or create a new address.'),
              const SizedBox(height: 20),
              const SearchTxt(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: AppTheme.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.close,
                    color: AppTheme.red,
                  ),
                  hint: "Search for recent or previous address",
                  onChanged: null),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Text('Enter a different address '),
                    Icon(Iconsax.add_square, size: MySize.size20)
                  ],
                ),
              ),
              const Text(
                'Address Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Full Address'),
              const Txt(
                hintText: 'Enter full address',
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  const Label(
                    label: "First Name",
                    child: Txt(
                      hintText: 'Enter first name',
                      prefixIcon: Icon(Iconsax.user, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Last Name",
                    child: Txt(
                      hintText: 'Enter last name',
                      prefixIcon: Icon(Iconsax.user, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Email Address",
                    child: Txt(
                      hintText: 'Enter email address',
                      prefixIcon:
                          Icon(Icons.email_outlined, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Phone Number",
                    child: Txt(
                      hintText: 'Enter phone number',
                      prefixIcon: Icon(
                        Iconsax.call,
                        color: AppTheme.grey,
                      ),
                    ),
                  ),
                  const Label(
                    label: "Alternate Phone(Option)",
                    child: Txt(
                      hintText: 'Enter phone number',
                      prefixIcon: Icon(
                        Iconsax.call,
                        color: AppTheme.grey,
                      ),
                    ),
                  ),
                  stepButtons(),
                  SizedBox(
                    height: MySize.size300,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget receiverFormWidget() {
    return PageLayout(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MySize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Receiver',
                style: AppTheme.exportHeaderStyle(),
              ),
              const Text(
                  'Search from your saved addresses or create a new address.'),
              const SizedBox(height: 20),
              const SearchTxt(
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: AppTheme.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.close,
                    color: AppTheme.red,
                  ),
                  hint: "Search for recent or previous address",
                  onChanged: null),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    const Text('Enter a different address '),
                    Icon(Iconsax.add_square, size: MySize.size20)
                  ],
                ),
              ),
              const Text(
                'Address Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              const Text('Full Address'),
              const Txt(
                hintText: 'Enter full address',
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  const Label(
                    label: "First Name",
                    child: Txt(
                      hintText: 'Enter first name',
                      prefixIcon: Icon(Iconsax.user, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Last Name",
                    child: Txt(
                      hintText: 'Enter last name',
                      prefixIcon: Icon(Iconsax.user, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Email Address",
                    child: Txt(
                      hintText: 'Enter email address',
                      prefixIcon:
                          Icon(Icons.email_outlined, color: AppTheme.grey),
                    ),
                  ),
                  const Label(
                    label: "Phone Number",
                    child: Txt(
                      hintText: 'Enter phone number',
                      prefixIcon: Icon(
                        Iconsax.call,
                        color: AppTheme.grey,
                      ),
                    ),
                  ),
                  const Label(
                    label: "Alternate Phone(Option)",
                    child: Txt(
                      hintText: 'Enter phone number',
                      prefixIcon:
                          Icon(Icons.person_outline, color: AppTheme.grey),
                    ),
                  ),
                  stepButtons(),
                  SizedBox(
                    height: MySize.size300,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget deliveryInfoWidget() {
    return PageLayout(
      height: MySize.size400,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.size10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Delivery info',
              style: AppTheme.exportHeaderStyle(),
            ),
            const Text('What type of delivery option do you prefer?'),
            const SizedBox(height: 20),
            Label(
              label: "Select Warehouse",
              child: MyDropDown(
                  hint: "Select warehouse",
                  value: null,
                  itemFunction: wareHouseList.map((item) {
                    return DropdownMenuItem(
                      value: item.caption.toString(),
                      child: Text("${item.caption}"),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    // productionController.selectedStage.value = newValue.toString();
                  }),
            ),
            SizedBox(height: MySize.size10),
            Label(
              label: "Delivery Type",
              child: MyDropDown(
                  hint: "Select delivery type",
                  value: null,
                  itemFunction: deliveryTypeList.map((item) {
                    return DropdownMenuItem(
                      value: item.caption.toString(),
                      child: Text("${item.caption}"),
                    );
                  }).toList(),
                  onChanged: (newValue) async {
                    // productionController.selectedStage.value = newValue.toString();
                  }),
            ),
            stepButtons(),
          ],
        ),
      ),
    );
  }

  Widget addBoxWidget() {
    return PageLayout(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MySize.size10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Boxes',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            const Text('What does your shipment contain?'),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                      'Kindly toggle the switch to add/remove dimension(s) to your box(es)'),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    onChanged: (val) {
                      setState(() {
                        isSwitched = val;
                      });
                    },
                    value: isSwitched,
                    activeColor: AppTheme.primaryColor,
                    activeTrackColor: AppTheme.primaryColor.withOpacity(0.3),
                    inactiveThumbColor: AppTheme.grey,
                    inactiveTrackColor: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            FadeInLeft(
              delay: const Duration(milliseconds: 20),
              child: SizedBox(
                height: MySize.size150,
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green[50],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              label: const Text('Box 1'),
                              icon: const Icon(Iconsax.box),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              label: const Text(
                                'Delete box',
                                style: TextStyle(color: AppTheme.red),
                              ),
                              icon: Icon(
                                Iconsax.trash,
                                size: MySize.size20,
                                color: AppTheme.red,
                              ),
                            )
                          ],
                        ),
                        const PageLayout(
                          backgroundColor: AppTheme.backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Iconsax.add), Text('Add Item')],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 80,
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green[50],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        'Click to add new box',
                        style: TextStyle(fontSize: MySize.size12),
                      ),
                      icon: const Icon(Iconsax.box_add),
                    ),
                    Btn(
                        text: 'Add new box',
                        fontSize: MySize.size12,
                        onPressed: () {},
                        height: MySize.size30,
                        width: MySize.size100)
                  ],
                ),
              ),
            ),
            stepButtons(),
          ],
        ),
      ),
    );
  }
}

class OnBoardingProgress extends StatelessWidget {
  final int ticks;
  final bool alt;

  OnBoardingProgress({
    required this.ticks,
    this.alt = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        tick1(alt),
        tickLine(),
        tick2(alt),
        tickLine(),
        tick3(alt),
        tickLine(),
        tick4(alt),
      ],
    );
  }

  Container tickLine() {
    return Container(
      width: 10,
      height: 2,
      color: AppTheme.primaryColor,
    );
  }

  Widget tick(bool isChecked, bool alt) {
    return isChecked
        ? Container(
            height: alt ? MySize.size10 : MySize.size15,
            width: alt ? MySize.size10 : MySize.size15,
            // padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: alt ? AppTheme.primaryColor : AppTheme.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: alt ? AppTheme.white : AppTheme.primaryColor,
                    width: 1)),
            child: Container(
              height: MySize.size10,
              width: MySize.size10,
              decoration: BoxDecoration(
                  color: alt ? AppTheme.white : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: alt ? AppTheme.white : AppTheme.primaryColor,
                      width: 1)),
            ),
          )
        : Container(
            height: alt ? MySize.size10 : MySize.size15,
            width: alt ? MySize.size10 : MySize.size15,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
                color: alt ? AppTheme.primaryColor : AppTheme.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: alt ? AppTheme.white : AppTheme.primaryColor,
                    width: 1)),
          );
  }

  Widget tick1(bool alt) {
    return this.ticks == 0 ? tick(true, alt) : tick(false, alt);
  }

  Widget tick2(bool alt) {
    return this.ticks == 1 ? tick(true, alt) : tick(false, alt);
  }

  Widget tick3(bool alt) {
    return this.ticks == 2 ? tick(true, alt) : tick(false, alt);
  }

  Widget tick4(bool alt) {
    return this.ticks == 3 ? tick(true, alt) : tick(false, alt);
  }
}
