part of 'widgets.dart';

// ignore: must_be_immutable
class TestAppFormField extends StatefulWidget {
  TestAppFormField({
    Key? key,
    required this.controller,
    this.onChanged,
    required this.hintText,
    this.onFinish,
    this.validator,
    this.isEnabled = true,
    this.capitalization = TextCapitalization.sentences,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.send,
    this.label = '',
    this.labelError,
    this.showMaskIcon = false,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final TextCapitalization capitalization;
  final TextInputType inputType;
  final void Function()? onFinish;
  final TextInputAction inputAction;
  final String label;
  final Widget? labelError;
  final bool showMaskIcon;
  bool isPassword;

  @override
  State<TestAppFormField> createState() => _TestAppFormFieldState();
}

class _TestAppFormFieldState extends State<TestAppFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label.isNotEmpty)
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.left,
            ),
          ),
        // if (label.isNotEmpty)
        //   const SizedBox(
        //     height: Sizes.verticalLabelToFieldMargin,
        //   ),
        TextFormField(
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: CustomColors.colorBlack),
          controller: widget.controller,
          enabled: widget.isEnabled,
          decoration:
              customTextFormFieldInputDecoration(context, widget.hintText),
          onChanged: widget.onChanged,
          textCapitalization: widget.capitalization,
          keyboardType: widget.inputType,
          validator: widget.validator,
          textInputAction: widget.inputAction,
          onEditingComplete: widget.onFinish,
          obscureText: widget.isPassword,
        ),
        // const SizedBox(
        //   height: Sizes.verticalLabelToFieldMargin,
        // ),
        // labelError!,
      ],
    );
  }

  InputDecoration customTextFormFieldInputDecoration(
    BuildContext context,
    String hintText,
  ) =>
      InputDecoration(
        filled: true,
        fillColor: CustomColors.colorWhite,
        border: inputBorder(),
        focusedBorder: inputBorder(color: CustomColors.mainBlue),
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: CustomColors.colorGrey,
            ),
        errorStyle: const TextStyle(height: 0),
        hintText: hintText,
        focusColor: CustomColors.mainOrange,
        suffixIcon: widget.showMaskIcon
            ? IconButton(
                icon: const Icon(Icons.remove_red_eye_outlined),
                onPressed: () =>
                    setState(() => widget.isPassword = !widget.isPassword),
              )
            : null,
      );

  InputBorder inputBorder({Color color = Colors.transparent}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color, width: 2.0),
    );
  }
}
