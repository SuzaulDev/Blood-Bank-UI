import 'package:blood_bank_app/bloc/my_profile_bloc/my_profile_event.dart';
import 'package:blood_bank_app/ui/customView/donor_view/view_blood_request.dart';
import 'package:blood_bank_app/ui/customView/general_user_view/my_blood_request_screen.dart';
import 'package:blood_bank_app/ui/customView/general_user_view/send_blood_request_screen.dart';
import 'package:blood_bank_app/ui/customView/volunteer_view/add_donor.dart';
import 'package:blood_bank_app/ui/customView/volunteer_view/processing_blood_request.dart';
import 'package:blood_bank_app/utils/helper_funtion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/home_business_logic/home_page_bloc.dart';
import '../../bloc/home_business_logic/home_page_event.dart';
import '../../bloc/home_business_logic/home_page_state.dart';
import '../../bloc/my_profile_bloc/my_profile_bloc.dart';
import '../../utils/const/app_colors.dart';
import '../customView/general_user_view/near_by_donor_screen.dart';
import '../customView/general_user_view/user_dashboard.dart';
import '../customView/supper_admin_menu_view/app_user/application_user_view.dart';
import '../customView/supper_admin_menu_view/menu_item/menu_item_view.dart';
import '../customView/supper_admin_menu_view/password_policy/password_policy.dart';
import '../customView/supper_admin_menu_view/user_role/user_role_view.dart';
import '../customView/supper_admin_menu_view/user_role_assign/user_role_asign_view.dart';

AppBar customAppBar(double screenWidth) {
  return AppBar(
    automaticallyImplyLeading: screenWidth > 600 ? false : true,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: AppColors.redColor,
    centerTitle: true,
    title: const Text(
      'Central Blood Bank',
      style:
          TextStyle(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state)  {
            if (globalAuthToken != "" && globalAuthToken != "null") {
              return InkWell(
                onTap: () {
                  context.read<MyProfileBloc>().add(LoadMyProfile());
                  Navigator.pushNamed(context, "/profilePage");
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage("images/person.jpg"),
                ),
              );
            }
            else {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/loginPage");
                },
                child: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              );
            }
          },
        ),
      ),
    ],
  );
}

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: AppColors.redColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        onTap: (value){
          context.read<HomePageBloc>().add(ControlBottomNavigation(indexNumber: value));
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Feed", icon: Icon(Icons.feed)),
          BottomNavigationBarItem(label: "Nearby Donor", icon: Icon(Icons.person_search_rounded)),
        ]);
  }
}


Widget customBody(double screenWidth) {
  return BlocBuilder<HomePageBloc, HomePageState>(
    builder: (context, state) {
      if (state is HomePageLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomePageLoaded) {
        //TODO: return dashbordview or user list into the condition bloc
        if (state.userTypeId == 0) {
          return Container();
        }
        return  UserDashBoard(
          screenWidth: screenWidth,
          donorList: state.bloodDonorResponseModel.data!,
          bloodRequest: state.bloodRequestModelList ,
        );
      }
      if (state is ApplicationUser) {
        return ApplicationUserView(
          appUserList: state.appUserResponse.data!,
          passwordPolicyList: state.passwordPolicyResponse.data!,
        );
      }
      if (state is UserRole) {
        return UserRoleView(
          userRoleList: state.responseModel.data!,
          menuItemList: state.menuItemResponseModel.data!,
        );
      }
      if (state is UserRoleAssign) {
        return UserRoleAssignView(
          userRoleAssignList: state.userRoleAssignResponseModel.data!,
          appUserModelList: state.appUserResponseModel.data!,
          userRoleModelList: state.userRoleResponseModel.data!,
        );
      }
      if (state is PasswordPolicy) {
        //print(state.passwordPolicyList[0].);
        return PasswordPolicyView(
            passwordPolicyList: state.passwordPolicyResponse.data!);
      }
      if (state is MenuItem) {
        return MenuItemView(menuItemList: state.menuItemResponse.data!);
      }
      if (state is HomePageError) {
        return Center(
          child: Text(state.errorMessage),
        );
      }
      if(state is FeedPage){
        return const Center(child: Text("This Page is Under Constraction"));
      }
      if(state is NearByDonor){
        return NearByDonorScreen();
      }
      if(state is BloodRequest ){
        if(globalAuthToken != "" && globalAuthToken != "null"){
          return BloodRequestScreen(donorInfoModelList: state.bloodDonorResponseModel.data!,cityList: state.cityList,);
        }
        else{
          return Center(child: Text("LogIn To View Data"));
        }
      }
      if(state is AddDonor){
        return AddDonorView(donorInfoModelList: state.BloodDonorResponseModel.data!,passwordPolicy: state.passwordPolicyResponse.data!,);
      }
      if(state is ViewBloodRequest){
        return ViewBloodRequestScreen(bloodRequestList: state.bloodRequestList);

      }
      if(state is MyBloodRequest){
        //print(state.baseResponseModel.data);
        if(globalAuthToken != "" && globalAuthToken != "null"){
          return MyBloodRequestScreen(myBloodRequest: state.receiverBloodRequest);
        }
        else{
          return Center(child: Text("LogIn To View Data"));
        }
      }
      if(state is ProcessingBloodRequest){
        final list = state.bloodRequestResponseModel.data!.where((element) => element.processing == true).toList();
        return ProcessingBloodRequestView(forCompleteBloodRequestList: list,);
      }
      else {
        return Container(
        ); // Placeholder for other states if needed
      }
    },
  );
}
