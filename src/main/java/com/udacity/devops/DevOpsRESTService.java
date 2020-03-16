package com.udacity.devops;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/")
public class DevOpsRESTService {

    // https://howtodoinjava.com/resteasy/resteasy-tomcat-hello-world-application/
    @GET
    @Path("/devops")
    public Response getDevOps() {
        String result = "{ \"hello\" : \"java\" }";
        return Response
                .status(200)
                .entity(result)
                .build();
    }
}