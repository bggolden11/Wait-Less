package Service;

import DBO.Queries.DiningTablesDBO;
import com.microsoft.azure.functions.HttpRequestMessage;
import com.microsoft.azure.functions.HttpResponseMessage;
import com.microsoft.azure.functions.HttpStatus;

import java.sql.SQLException;
import java.util.Optional;

public class DiningTablesService {
    DiningTablesDBO diningTablesDBO = new DiningTablesDBO();

    /**
     *
     * @param request http request to send and receive
     * @return list of all dining room tables
     */
    public HttpResponseMessage getAllDiningTables(HttpRequestMessage<Optional<String>> request){
        try{
            return request.createResponseBuilder(HttpStatus.OK).body(diningTablesDBO.getAllDiningTables()).build();
        } catch (SQLException e) {
            return request.createResponseBuilder(HttpStatus.INTERNAL_SERVER_ERROR).body("Error connecting to SQL database").build();
        }
    }
}
