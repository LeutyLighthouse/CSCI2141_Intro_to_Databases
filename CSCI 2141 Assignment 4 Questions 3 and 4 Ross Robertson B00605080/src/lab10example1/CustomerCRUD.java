package lab10example1;

import java.sql.*;

/**
 *
 * @author syedmfaizan
 */

/**Modified by: Ross Robertson*/

public class CustomerCRUD {
    private MysqlDatabaseConnection connection=null;

    CustomerCRUD(MysqlDatabaseConnection conn){
        this.connection=conn;
    }

    ResultSet getAllArtists(){
        return connection.executeQuery("SELECT * FROM ARTIST");
    }

    ResultSet getPaintingByName(String Code){
        return connection.executeQuery("SELECT * FROM PAINTING WHERE Creator='"+Code+"'");
    }

    ResultSet getArtistsCreations(String Code){
        return connection.executeQuery( "SELECT SCULPTURE.Creator, SCULPTURE.Style, SCULPTURE.Sculpture_id, PAINTING.Style, PAINTING.Painting_id FROM SCULPTURE\n" +
                "INNER JOIN PAINTING ON PAINTING.Creator = SCULPTURE.Creator\n" +
                "WHERE SCULPTURE.Creator ='"+Code+"'");
    }

    int UpdateArtist(
            String Name,
            String DateOfBirth,
            String DateOfDeath
            ){
        return connection.executeUpdate("UPDATE ARTIST SET DoB='"+DateOfBirth+"',DoD='"+DateOfDeath+"' WHERE Name='"+Name+"'");
    }

}
