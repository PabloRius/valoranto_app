import 'package:flutter/material.dart';
import 'package:valoranto/globals.dart';
import '../../../constants.dart';
import '../../third_screen/abilities_selection.dart';





class LockInButton extends StatelessWidget {
  const LockInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final elevatedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: kRedMain,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
      ),
      fixedSize: const Size(400, 50),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: SizedBox(
        height: 65,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          top: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    color: Colors.transparent,
                    height: 20,
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        )
                    ),
                    height: 20,
                  ),
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: ElevatedButton(
                    style: elevatedButtonStyle,
                    onPressed: (){
                      print("Selected Map: $selectedMap\n");
                      print("Selected Agent: $selectedAgent\n");
                      print("Selected Ability: $selectedAbility\n");
                    },
                    child: const Text('LOCK IN')
                )
            )
          ],
        ),
      ),
    );
  }
}