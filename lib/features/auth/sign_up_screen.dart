import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../controller/LocalizationController.dart';
import '../../controller/auth_controller.dart';
import '../../core/constants/dimensions.dart';
import '../../core/constants/images.dart';
import '../../core/constants/styles.dart';
import '../../core/helper/route_helper.dart';
import '../../core/model/school_model.dart';
import '../../core/widget/custom_button.dart';
import '../../core/widget/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).cardColor,
      body: SafeArea(child: Scrollbar(
        child: Center(
          child: Container(
            width: context.width > 700 ? 700 : context.width,
            padding: context.width > 700 ? const EdgeInsets.all(40) : EdgeInsets.all(Dimensions.paddingSizeLarge),
            margin: context.width > 700 ? const EdgeInsets.all(Dimensions.paddingSizeDefault) : null,
            decoration: context.width > 700 ? BoxDecoration(
              color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
              // boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 700 : 300]!, blurRadius: 5, spreadRadius: 1)],
            ) : null,
            child: GetBuilder<AuthController>(builder: (authController) {

              return SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [


                  Image.asset(Images.logo, width: 125),
                  // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                  // Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge))),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Sign Up'.tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraLarge)),
                  ),
                  const SizedBox(height: Dimensions.paddingSizeDefault),

                  // Row(children: [
                  //   Expanded(
                  //     child: CustomTextField(
                  //       hintText: 'First name'.tr,
                  //       controller: authController.firstNameController,
                  //       inputType: TextInputType.name,
                  //       capitalization: TextCapitalization.words,
                  //       prefixIcon: Icons.person,
                  //     ),
                  //   ),
                  //   const SizedBox(width: Dimensions.paddingSizeSmall),
                  //
                  //   Expanded(
                  //     child: CustomTextField(
                  //       hintText: 'Last name'.tr,
                  //       controller: authController.lastNameController,
                  //
                  //       inputType: TextInputType.name,
                  //       capitalization: TextCapitalization.words,
                  //       prefixIcon: Icons.person,
                  //     ),
                  //   )
                  // ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),



                  Row(children: [

                    Expanded(
                      child: CustomTextField(
                        controller: authController.phoneSignUpController,

                        inputType: TextInputType.emailAddress,

                        hintText: 'Email',
                      ),
                    ),

                  ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),


                  Row(children: [
                    Expanded(
                      child: Column(children: [
                        CustomTextField(
                          titleText: 'password'.tr,
                          hintText: 'password'.tr,
                          controller: authController.passwordSignUpController,
                          inputType: TextInputType.visiblePassword,
                          prefixIcon: Icons.lock,
                          isPassword: true,
                          onChanged: (value){
                            if(value != null && value.isNotEmpty){
                              if(!authController.showPassView){
                                authController.showHidePass();
                              }
                            }else{
                              if(authController.showPassView){
                                authController.showHidePass();
                              }
                            }
                          },
                        ),

                        // authController.showPassView ? const PassView() : const SizedBox(),
                      ]),
                    ),


                  ]),
                  const SizedBox(height: Dimensions.paddingSizeLarge),
                  Container(
                    width: double.infinity,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Text(
                              "choose".tr,
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: schoolChildrenList.map((SchoolChildrenModel value) {
                          return DropdownMenuItem<String>(
                            value: value.title,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(value.title!, style: TextStyle(fontSize: 16)),
                            ),
                          );
                        }).toList(),
                        value: authController.userbranchValue,
                        onChanged: (String? value) {
                          authController.onChangedbranchUser(value!);
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50.h,
                          width: 160,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraLarge),
                            color: Theme.of(context).cardColor,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 25.sp,
                          iconEnabledColor: Theme.of(context).hintColor,
                          iconDisabledColor: Theme.of(context).hintColor,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: context.screenWidth - 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Theme.of(context).cardColor,
                          ),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),

                      ),
                    ),
                  ),

                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  const SizedBox(height: Dimensions.paddingSizeLarge),

                  CustomButton(
                    buttonText: 'Sign Up'.tr,
                    isLoading: authController.isLoading,
                    onPressed:  () => authController.register(),
                  ),

                  const SizedBox(height: Dimensions.paddingSizeExtraLarge),

                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text('Already have account'.tr, style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),

                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteHelper.signIn);

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                        child: Text('Sign In'.tr, style: robotoMedium.copyWith(color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ]),

                ]),
              );
            }),
          ),
        ),
      )),
    );
  }

  void _register( AuthController authController){

  }
}
