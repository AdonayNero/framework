/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.udb.serviciorest;

import java.sql.SQLException;
import java.util.List;
import javafx.scene.media.Media;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import sv.edu.udb.model.RolesModel;
import sv.edu.udb.pojo.Roles;

/**
 *
 * @author Edal Bonilla
 */
@Path("roles")
public class NewClass {
    RolesModel model = new RolesModel();
    @GET
    @Path("listar")
    @Produces(MediaType.APPLICATION_JSON)
    public Response Roles() throws SQLException{
        List<Roles> roles = model.listar();
        
        return Response.status(200).entity(roles).build();
    
    }
    
}
