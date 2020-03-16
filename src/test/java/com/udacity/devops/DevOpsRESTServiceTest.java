package com.udacity.devops;

// rest-assured: https://www.baeldung.com/rest-assured-tutorial

import io.restassured.RestAssured;
import org.jboss.resteasy.core.Dispatcher;
import org.jboss.resteasy.mock.MockDispatcherFactory;
import org.jboss.resteasy.plugins.server.resourcefactory.POJOResourceFactory;
import org.junit.Before;
import org.junit.Test;

import javax.ws.rs.Path;
import java.io.IOException;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

public class DevOpsRESTServiceTest {


    @Before
    public void setUp() throws Exception {
        RestAssured.baseURI = "https://localhost";
        RestAssured.port = 8080;
    }


    @Test
    public void testServer() throws IOException {
/*
        when()
            .request("GET","/howtodoinjava")
            .then()
            .statusCode(200)
            .assertThat()
            .body("lotto.lottoId",
                    equalTo(5));
*/
    }
}