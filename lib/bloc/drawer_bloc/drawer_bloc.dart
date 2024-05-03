import 'package:blood_bank_app/bloc/drawer_bloc/drawer_event.dart';
import 'package:blood_bank_app/bloc/drawer_bloc/drawer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constant_value.dart';
import '../../utils/helper_funtion.dart';

class DrawerBloc extends Bloc<DrawerEvent,DrawerState>{
  DrawerBloc():super(DrawerInitial()){
    on<LoadDrawer>((event, emit) async{
      emit(DrawerLoading());
      int userTypeId = await getUserTypeId();
      emit(DrawerSuccess(userIdType: userTypeId,menuItemList: menuItemList));
    });



  }

}