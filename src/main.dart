//
// Joseph Winters
// Main execution
// Winter 2017
//


import 'dart:html';
import 'dart:math';

import 'constants.dart';


// MAIN EXECUTION


void main() {
    Element pubName = querySelector("#pub-name");
    PubNameGenerator pubNameGenerator = new PubNameGenerator();
    ButtonElement button = querySelector("#reload-button");
    bool nIsPressed = false;

    pubName.text = pubNameGenerator.getNewName();

    button.onClick.listen((e) => pubName.text = pubNameGenerator.getNewName());
    window.onKeyDown.listen((KeyboardEvent event) {
        if (event.keyCode == KeyCode.N && !nIsPressed) {
            pubName.text = pubNameGenerator.getNewName();
            nIsPressed = true;
        }
    });
    window.onKeyUp.listen((KeyboardEvent event) {
        if (event.keyCode == KeyCode.N) {
            nIsPressed = false;
        }
    });
}


// HELPER FUNCTIONS AND CLASSES


// Class to handle pub name generation
class PubNameGenerator {

    Random random;


    // Constructor
    PubNameGenerator() {
        random = new Random();
    }


    // Return a new randomly-generated name.
    String getNewName() {
        if (random.nextBool()) {
            return _getNewComboName();
        } else {
            return _getNewSingleName();
        }
    }


    // Return a new randomly-generated name of the form "<noun> & <noun>".
    String _getNewComboName() {
        int index1 = random.nextInt(THINGS.length);
        int index2;
        // Ensure index1 != index2
        do {
            index2 = random.nextInt(THINGS.length);
        } while (index2 == index1);
        return "${THINGS[index1]} & ${THINGS[index2]}";
    }


    // Return a new randomly-generated name of the form "<adjective> <noun>".
    String _getNewSingleName() {
        int index1 = random.nextInt(ADJECTIVES.length);
        int index2 = random.nextInt(ANIMALS_AND_PEOPLE.length);
        return "${ADJECTIVES[index1]} ${ANIMALS_AND_PEOPLE[index2]}";
    }

}
