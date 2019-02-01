package lab10example1;

/**
 *
 * @author syedmfaizan
 */

/**Modified by: Ross Robertson*/


public class UserInterface {

    void printWelcomeGreetings(){
        System.out.println("Welcome to the Artist database!");
    }

    void printMainMenu(){
        System.out.println("Select Operation from List:");
        System.out.println("1: View Artist menu");
        System.out.println("2: Update Artist's Info");
        System.out.println("3: View creations made by artist");
        System.out.println("99: Exit Application");
    }

    void printViewArtistMenu(){
        System.out.println("\tSelect Operation from List:");
        System.out.println("\t1: View All Artists");
        System.out.println("\t2: View Painting(s) by Artist name");
        System.out.println("\t99: Back");
    }

    void printEnterArtistNameText(){
        System.out.print("Enter Artist's name: ");
    }

    void printEnterArtistDob(){
        System.out.print("Enter Updated Date of Birth (use an 8-digit integer): ");
    }

    void printEnterArtistDod(){
        System.out.print("Enter Updated Date of Death (use an 8-digit integer): ");
    }

    void printInitializationError(){
        System.out.println("Application Cannot Initialize!");
    }

}
