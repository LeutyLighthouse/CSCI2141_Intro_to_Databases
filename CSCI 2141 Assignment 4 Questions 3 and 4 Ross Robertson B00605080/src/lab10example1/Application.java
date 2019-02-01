package lab10example1;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author syedmfaizan
 */

/**Modified by: Ross Robertson*/


public class Application {
    private UserInterface UI=null;
    private MysqlDatabaseConnection dbConnection=null;
    private Scanner scanner = null;
    private Boolean isRunning=true;

    void start(){
        this.initialize();
        this.run();
    }

    void initialize(){
        this.scanner = new Scanner(System.in);
        this.UI = new UserInterface();
        MysqlDatabaseConnection dbConnection = new MysqlDatabaseConnection();
        if(dbConnection.connect())
        {
            this.dbConnection=dbConnection;
        }
        else{
            this.isRunning=false;
            this.UI.printInitializationError();
        }
    }

    void run(){
        UI.printWelcomeGreetings();
        while(this.isRunning){
            UI.printMainMenu();
            int mainOption = Integer.parseInt(scanner.nextLine());
            switch(mainOption){
                case 1: viewArtists();
                    break;
                case 2: updateArtist();
                    break;
                case 3: viewArtistCreations();
                    break;
                case 99: this.exit();
                    break;
                default: System.out.println("Invalid Option selected, please choose a number from the list and then press enter");
            }
            System.out.flush();
        }
    }

    void exit(){
        this.dbConnection.disconnect();
        this.scanner.close();
        this.isRunning=false;
    }

    void viewArtists(){
        Boolean backPressed = false;
        while(!backPressed){
            this.UI.printViewArtistMenu();
            int customerOption = Integer.parseInt(scanner.nextLine());
            switch(customerOption){
                case 1: viewAllArtists();
                    break;
                case 2: viewCustomerByCode();
                    break;
                case 99: backPressed=true;
                    break;
                default: System.out.println("Invalid Option selected, please choose a number from the list and then press enter");
            }
        }
    }

    void viewAllArtists(){
        CustomerCRUD customerService = new CustomerCRUD(dbConnection);
        ResultSet rs = customerService.getAllArtists();
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            System.out.println(rsmd.getColumnName(1) + "  " + rsmd.getColumnName(2) + "  " + rsmd.getColumnName(3));
            while(rs.next())
                System.out.println(rs.getString(1) + "  " + rs.getInt(2) + "  " + rs.getInt(3));
        } catch (SQLException ex) {
            Logger.getLogger(Application.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    void viewCustomerByCode(){
        CustomerCRUD customerService = new CustomerCRUD(dbConnection);
        UI.printEnterArtistNameText();
        String customerCode = scanner.nextLine();
        ResultSet rs = customerService.getPaintingByName(customerCode);
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            System.out.println(rsmd.getColumnName(1) + "  " + rsmd.getColumnName(2) + "  " + rsmd.getColumnName(3));
            while(rs.next())
                System.out.println(rs.getString(1) + "  " + rs.getString(2) + "  " + rs.getString(3));
        } catch (SQLException ex) {
            Logger.getLogger(Application.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    void updateArtist(){
        CustomerCRUD customerService = new CustomerCRUD(dbConnection);
        UI.printEnterArtistNameText();
        String customerCode = scanner.nextLine();
        ResultSet rs = customerService.getPaintingByName(customerCode);
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            System.out.println(rsmd.getColumnName(1) + "  " + rsmd.getColumnName(2) + "  " + rsmd.getColumnName(3));
            while(rs.next())
                System.out.println(rs.getString(1) + "  " + rs.getString(2) + "  " + rs.getString(3));

            UI.printEnterArtistDob();
            String updatedFName=scanner.nextLine();
            UI.printEnterArtistDod();
            String updatedMInitial=scanner.nextLine();

            int updated = customerService.UpdateArtist(customerCode,updatedFName,updatedMInitial);
            if(updated==1)
                System.out.println("Artist Updated!");
        } catch (SQLException ex) {
            Logger.getLogger(Application.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    void viewArtistCreations(){
        CustomerCRUD customerService = new CustomerCRUD(dbConnection);
        UI.printEnterArtistNameText();
        String customerCode = scanner.nextLine();
        ResultSet rs = customerService.getArtistsCreations(customerCode);
        try {
            ResultSetMetaData rsmd = rs.getMetaData();
            System.out.println(rsmd.getColumnName(1) + "  " + rsmd.getColumnName(2) + "  " + rsmd.getColumnName(3) + "  " + rsmd.getColumnName(4) + "  " + rsmd.getColumnName(5));
            while(rs.next())
                System.out.println(rs.getString(1) + "  " + rs.getString(2) + "  " + rs.getString(3) + "  " + rs.getString(4) + "  " + rs.getString(5));
        } catch (SQLException ex) {
            Logger.getLogger(Application.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
