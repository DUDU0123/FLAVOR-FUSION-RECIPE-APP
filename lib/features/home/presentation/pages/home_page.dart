import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/core/common_widgets/text_widget_common.dart';
import 'package:recipe_app/core/utils/message_show_helper.dart';
import 'package:recipe_app/features/home/presentation/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:recipe_app/features/home/presentation/widgets/recipe_card_listview.dart';

class RecipeHomePage extends StatelessWidget {
  const RecipeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidgetCommon(text: 'Flavor Fusion'),
      ),
      body: BlocConsumer<RecipeBloc, RecipeState>(
        listener: (context, state) {
          if (state is RecipeErrorState) {
            MessageShowhelper.showSnackbar(snackBarContent: state.message);
          }
        },
        builder: (context, state) {
          if (state is RecipeLoadingState) {
            return recipeCardListview(state: state);
          }
          return recipeCardListview(state: state);
        },
      ),
    );
  }

}



