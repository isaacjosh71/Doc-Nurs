
import 'package:docs_and_nurs/Patient Authentications/create_patient_account.dart';
import 'package:docs_and_nurs/Helpers/designs.dart';
import 'package:docs_and_nurs/Physician/Auth/select_plan.dart';
import 'package:docs_and_nurs/Screens/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class CompletePhysRegistration extends StatefulWidget {
  const CompletePhysRegistration({Key? key}) : super(key: key);

  @override
  State<CompletePhysRegistration> createState() => _CompletePhysRegistrationState();
}

class _CompletePhysRegistrationState extends State<CompletePhysRegistration> {
  String _selectedGender = 'Select Gender';
  String _selectedProfession = 'Select Profession';
  String _selectedYearOfExperience = 'Select Years';
  String _selectedSpecialization= 'Select Specialization';
  String _selectedDay = 'DD';
  String _selectedMonth = 'MM';
  String _selectedYear = 'YYYY';
  List<String> genderList= [
    'Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Designs.scaffoldTheme,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context, MaterialPageRoute(
                builder: (builder)=> const CreateAccount()));
          },
          child: Icon(Icons.arrow_back_ios_new,
            size: 24.sp, color: const Color(0xFF000000),),
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 39.w),
          child: Text('Complete Registration',
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 0.33,
              color: const Color(0xFF1F1F1F),
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              Text('Profession', style: Designs.labelFont),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: DropDown(
                        showUnderline: false,
                        isExpanded: true,
                        items: const ["Doctor", "Nurse"],
                        hint: Text('$_selectedProfession', style: Designs.hintFont,),
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 45.sp, color: Colors.black87,),
                        onChanged: (String? newValue){
                          setState((){
                            _selectedGender = newValue!;
                          });},)
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text('Years of experience', style: Designs.labelFont),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: DropDown(
                        showUnderline: false,
                        isExpanded: true,
                        items: const ["1-3", "4-7", "8-11", "12+"],
                        hint: Text('$_selectedYearOfExperience', style: Designs.hintFont,),
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 45.sp, color: Colors.black87,),
                        onChanged: (String? newValue){
                          setState((){
                            _selectedGender = newValue!;
                          });},)
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text('Specialization', style: Designs.labelFont),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: DropDown(
                        showUnderline: false,
                        isExpanded: true,
                        items: const ["Hepatologist", "Pharmacist", "General Practitioner"],
                        hint: Text('$_selectedSpecialization', style: Designs.hintFont,),
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 45.sp, color: Colors.black87,),
                        onChanged: (String? newValue){
                          setState((){
                            _selectedGender = newValue!;
                          });},)
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text('Gender', style: Designs.labelFont),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: DropDown(
                        showUnderline: false,
                        isExpanded: true,
                        items: const ["Male", "Female", "Other"],
                        hint: Text('$_selectedGender', style: Designs.hintFont,),
                        icon: Icon(Icons.arrow_drop_down_rounded, size: 45.sp, color: Colors.black87,),
                        onChanged: (String? newValue){
                          setState((){
                            _selectedGender = newValue!;
                          });},)
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Text('Date of Birth', style: Designs.labelFont),
              DropdownDatePicker(
                icon: Icon(Icons.arrow_drop_down_rounded, size: 25.sp, color: Colors.black87,),
                isExpanded: true,
                isDropdownHideUnderline: false,
                isFormValidator: true,
                startYear: 1950,
                endYear: 2030,
                width: 12.sp,
                onChangedDay: (String? newValue){
                  setState((){
                    _selectedDay = newValue!;});},
                onChangedMonth: (String? newValue){
                  setState((){
                    _selectedMonth = newValue!;});},
                onChangedYear: (String? newValue){
                  setState((){
                    _selectedYear = newValue!;});},
                hintDay: '$_selectedDay',
                hintMonth: '$_selectedMonth',
                hintYear: '$_selectedYear',
                hintTextStyle:Designs.hintFont,
                monthFlex: 3,
                dayFlex: 2,
                errorDay: 'Please select date',
                errorMonth: 'Please select month',
                errorYear: 'Please select year',
              ),
              SizedBox(height: 25.h),
              Text('Address', style: Designs.labelFont),
              SizedBox(
                width: 325.w,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Address',
                    hintStyle: Designs.hintFont,
                    suffixIcon: InkWell(
                        onTap: (){},
                        child: Icon(Icons.gps_fixed_rounded, size: 22.sp, color: Colors.black87,)),
                  ),
                ),
              ),
              SizedBox(height: 85.h,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  height: 55.h,
                  width: 296.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Designs.primaryColor),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 49.w, vertical: 17.h)),
                        textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal
                        ),)
                    ),
                    onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                        builder: (builder)=> const SelectPlan()), (route) => false);},
                    child: const Text('Continue'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
