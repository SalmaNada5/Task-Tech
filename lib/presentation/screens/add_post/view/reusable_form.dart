import 'package:task_tech/utils/exports.dart';

class ReusablePostForm extends StatelessWidget {
  const ReusablePostForm({
    super.key,
    required this.postNameController,
    required this.descriptionController,
    required this.deliveryDaysController,
    required this.salaryController,
    required this.categoryController,
    required this.stController,
    required this.difFields,
    required this.firstLabel,
    this.onPressed,
  });
  final TextEditingController postNameController;
  final TextEditingController descriptionController;
  final TextEditingController deliveryDaysController;
  final TextEditingController salaryController;
  final TextEditingController categoryController;
  final TextEditingController stController;
  final Widget difFields;
  final String firstLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    AddPostCubit addPostCubit = BlocProvider.of<AddPostCubit>(context);

    return Form(
      key: addPostCubit.formKey,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstLabel,
                textAlign: TextAlign.center,
                style: headStyle.copyWith(
                    color: Theme.of(context).textTheme.headlineSmall!.color),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: postNameController,
                style: headStyle.copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          BorderSide(color: Theme.of(context).canvasColor)),
                  filled: true,
                  fillColor: Theme.of(context).canvasColor,
                ),
                onChanged: (value) {
                  postNameController.text = value.toString();
                  postNameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: postNameController.text.length));
                },
                validator: (value) {
                  value = postNameController.text;
                  if (value.isEmpty) {
                    return 'Please fill this field';
                  } else {
                    return null;
                  }
                },
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              difFields,
              const SizedBox(
                height: 10,
              ),
              Text(
                'Delivery Days',
                textAlign: TextAlign.center,
                style: headStyle.copyWith(
                    color: Theme.of(context).textTheme.headlineSmall!.color),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: deliveryDaysController,
                //readOnly: true,
                style: headStyle.copyWith(color: Theme.of(context).hintColor),

                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 15),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).canvasColor,
                ),
                onChanged: (value) {
                  deliveryDaysController.text = value.toString();
                  deliveryDaysController.selection = TextSelection.fromPosition(
                      TextPosition(offset: deliveryDaysController.text.length));
                },
                validator: (value) {
                  value = deliveryDaysController.text;
                  if (value.isEmpty) {
                    return 'Please fill this field';
                  } else {
                    return null;
                  }
                },
                maxLines: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Salary',
                        textAlign: TextAlign.center,
                        style: headStyle.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * Constants.screenWidth,
                        child: TextFormField(
                          controller: salaryController,
                          style: headStyle.copyWith(
                              color: Theme.of(context).hintColor),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 15),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).canvasColor,
                                  )),
                              filled: true,
                              fillColor: Theme.of(context).canvasColor,
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 16,
                                color: const Color(0xffC0C0C0),
                              )),
                          onChanged: (value) {
                            salaryController.text = value.toString();
                            salaryController.selection =
                                TextSelection.fromPosition(TextPosition(
                                    offset: salaryController.text.length));
                          },
                          validator: (value) {
                            value = salaryController.text;
                            if (value.isEmpty) {
                              return 'Please fill this field';
                            } else {
                              return null;
                            }
                          },
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        textAlign: TextAlign.center,
                        style: headStyle.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .color),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 0.4 * Constants.screenWidth,
                        child: TextFormField(
                          controller: categoryController,
                          readOnly: true,
                          style: headStyle.copyWith(
                              color: Theme.of(context).hintColor),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 15),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Theme.of(context).canvasColor,
                                )),
                            filled: true,
                            fillColor: Theme.of(context).canvasColor,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 25,
                                  color: Color.fromRGBO(124, 124, 124, 1),
                                ),
                                value: addPostCubit.selectedCategory,
                                underline: const SizedBox(),
                                borderRadius: BorderRadius.circular(8.6),
                                alignment: AlignmentDirectional.center,
                                isExpanded: true,
                                items: CreateProfileCubit.categories
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  addPostCubit.selectCategoryFunction(
                                      value ?? '', categoryController.text);
                                },
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        const Color.fromRGBO(124, 124, 124, 1)),
                              ),
                            ),
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Software Tool',
                textAlign: TextAlign.center,
                style: headStyle.copyWith(
                    color: Theme.of(context).textTheme.headlineSmall!.color),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: stController,
                style: headStyle.copyWith(color: Theme.of(context).hintColor),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 15),
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Theme.of(context).canvasColor,
                        )),
                    filled: true,
                    fillColor: Theme.of(context).canvasColor,
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xffC0C0C0),
                    )),
                onChanged: (value) {
                  stController.text = value.toString();
                  stController.selection = TextSelection.fromPosition(
                      TextPosition(offset: stController.text.length));
                },
                validator: (value) {
                  value = stController.text;
                  if (value.isEmpty) {
                    return 'Please fill this field';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('correct');
                    if (onPressed != null) {
                      onPressed!();
                    }
                  },
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 80,
                        vertical: 8,
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).primaryColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Share',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
