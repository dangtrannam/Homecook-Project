package services;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import daos.OrderDAO;
import dtos.Order;
import dtos.OrderItem;

import javax.print.attribute.standard.Media;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.SQLException;
import java.util.ArrayList;

@Path("/orders")
public class OrderServices {
    private OrderDAO service= new OrderDAO();

    @GET
    @Path("/customer/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getOrderByCustomerID(@PathParam("id") String id) throws SQLException {
        ArrayList<Order> orders= service.getOrderByCustomerID(id, 1);
        Gson gson= new GsonBuilder().setPrettyPrinting().create();
        String result= gson.toJson(orders);
        return result;
    }

    @GET
    @Path("/homecook/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getOrderByHomeCookID(@PathParam("id") String id) throws SQLException {
        ArrayList<Order> orders= service.getOrderByHomeCookID(id, 1);
        Gson gson= new GsonBuilder().setPrettyPrinting().create();
        String result= gson.toJson(orders);
        return result;
    }

    //ORDER ITEMs
    @GET
    @Path("/{orderID}")
    @Produces(MediaType.APPLICATION_JSON)
    public String getListItems(@PathParam("orderID") String id) throws SQLException {
        ArrayList<OrderItem> items= service.getListItemByOrderID(id,1);
        Gson gson= new GsonBuilder().setPrettyPrinting().create();
        String result= gson.toJson(items);
        return result;
    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response createOrder(Order ord) throws SQLException, URISyntaxException {
        service.createOrder(ord);
        service.insertOrderItems(ord);
        URI uri= new URI("/customer/");
        return Response.created(uri).build();
    }

    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/updateStatus/{id}/{status}")
    public Response updateOrder(@PathParam("id") String id, @PathParam("status") String status) throws SQLException {
        if (service.changeOrderStatus(id, status))
            return Response.ok().build();
        else return Response.notModified().build();
    }

    @DELETE
    @Path("{id}")
    public Response deleteOrder(@PathParam("id") int id) {
        if (service.deleteOrder(id)) {
            return Response.ok().build();
        }
        else return Response.notModified().build();
    }


//    @POST
//    @Path("customer")
//    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
//    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
//    public Order createOrder(Order ord) throws SQLException {
//        System.out.println(ord);
//        service.createOrder(ord);
//        return ord;
//    }
//
//    @PUT
//    @Path("customer")
//    @Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
//    @Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
//    public Order updateOrder (Order ord, String status) throws SQLException {
//        System.out.println(ord);
//        if (service.changeOrderStatus(ord.getOrderID(), "Finished") == true) return ord;
//        return null;
//    }
}