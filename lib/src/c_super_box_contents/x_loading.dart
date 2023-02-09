part of super_box;

class Loading extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const Loading({
    @required this.loading,
    this.size = 50,
    this.color = Colors.black,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final double size;
  final bool loading;
  final Color color;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    /// WHEN IS LOADING => TRUE
    if (loading == true){

      return SizedBox(
        width: size,
        height: size,
        child: Center(
          child: SpinKitPulse(
            color: color ?? const Color.fromARGB(255, 0, 0, 0),
            size: size,
          )
        ),
      );

    }

    /// WHEN IS NOT LOADING => FALSE
    else {
      return const SizedBox();
    }

  }
/// --------------------------------------------------------------------------
}
