import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Core/ColorHelper.dart';
import 'package:mab_drive/Core/general_components/defult_text_form_field.dart';
import 'package:mab_drive/Features/UserHome/ViewModel/cubit/user_home_cubit.dart';

class SearchBottomSheet extends StatelessWidget {
  SearchBottomSheet(
      {super.key, required this.scrollController, required this.searchText});
  final ScrollController scrollController;
  final TextEditingController searchController = TextEditingController();
  final String searchText;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BlocConsumer<UserHomeCubit, UserHomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cupit = UserHomeCubit.get(context);
            return Container(
              decoration: BoxDecoration(
                  color: ColorHelper.darkColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  defaultTextFormFelid(
                      controller: searchController,
                      text: searchText,
                      onChange: (val) {
                        cupit.searchLocation(val);
                      },
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      fillColor: Colors.white),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListView.separated(
                        shrinkWrap: true,
                        controller: scrollController,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            if (searchText == "Destination") {
                              cupit.setDestination(cupit
                                  .searchLocationPredictions[index]
                                  .structuredFormatting!
                                  .mainText!);
                            } else {
                              cupit.setPickup(cupit
                                  .searchLocationPredictions[index]
                                  .structuredFormatting!
                                  .mainText!);
                            }
                          },
                          child: SearchCard(
                            cupit: cupit,
                            index: index,
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                        ),
                        itemCount: cupit.searchLocationPredictions.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({
    super.key,
    required this.cupit,
    required this.index,
  });

  final UserHomeCubit cupit;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cupit
              .searchLocationPredictions[index].structuredFormatting!.mainText!,
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
        Text(
            cupit.searchLocationPredictions[index].structuredFormatting!
                .secondaryText!,
            style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
      ],
    );
  }
}