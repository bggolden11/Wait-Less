package com.waitless.functions;

import jdk.nashorn.internal.ir.annotations.Ignore;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.junit.jupiter.api.Test;

import java.io.IOException;

/**
 * ! These tests are to be run on dev side only. Used for verifying functions work on local host.
 */
@Ignore
public class HttpRequestTest {

  @Test
  public void getLoggedInUserTest() throws IOException {
    HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-Logged-In-Users");

    HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

    assert (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);
  }

  @Test
  public void authenticateUserTest() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Authenticate-User");
    StringEntity entity =
        new StringEntity(
            "{\n"
                + "\"employeeID\":\"2121\",\n"
                + "\"passwordtoken\":\"5z0ZYrqhDOm5nkK5oIEudg==\"\n"
                + "}");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void createTask() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Create-Task");
    StringEntity entity =
        new StringEntity(
            "{\n"
                + "\temployeeId: \"2121\",\n"
                + "\ttitle: \"Please work\",\n"
                + "\tdescription:\"PLEAH\",\n"
                + "\ttable:\"A1\"\n"
                + "}");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 201);
    client.close();
  }

  @Test
  public void createUser() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Add-User");
    StringEntity entity =
        new StringEntity(
            "{\n"
                + "    \"firstName\": \"Chris P the third.\",\n"
                + "    \"lastName\": \"Bacon the second\",\n"
                + "    \"birthday\": \"2001-12-12\",\n"
                + "    \"address\": \"123 drive\",\n"
                + "    \"phone\": \"111-111-111\",\n"
                + "    \"title\": \"Boss\",\n"
                + "        \"encryptedPassword\": \"TestPassword\"\n"
                + "}");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void getActiveTasks() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Active-Tasks-Based-On-User");
    StringEntity entity = new StringEntity("{ employeeId: \"2124\"}\n");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void getInactiveTasks() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Inactive-Tasks-Based-On-User");
    StringEntity entity = new StringEntity("{ employeeId: \"2124\"}\n");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void getUser() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Get-Employee");
    StringEntity entity = new StringEntity("{ employeeId: \"2124\"}\n");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void logUserOut() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Log-User-Out");
    StringEntity entity = new StringEntity("{ employeeId: \"2124\"}\n");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void updateTaskUser() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Update-Task-User");
    StringEntity entity =
        new StringEntity(
            "{\n" + "\ttaskId: \"1234\",\n" + "\temployeeToAssignId: \"2124\"\n" + "}");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void FinishTask() throws IOException {
    CloseableHttpClient client = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("http://localhost:7071/api/Finish-Task");
    StringEntity entity = new StringEntity("{\n" + "\ttaskID: \"1001\"\n" + "}");
    httpPost.setEntity(entity);
    httpPost.setHeader("Accept", "application/json");
    httpPost.setHeader("Content-type", "application/json");

    CloseableHttpResponse response = client.execute(httpPost);
    assert (response.getStatusLine().getStatusCode() == 200);
    client.close();
  }

  @Test
  public void getAllDiningRoomTables() throws IOException {
    HttpUriRequest request = new HttpGet("http://localhost:7071/api/Get-All-Dining-Tables");

    HttpResponse httpResponse = HttpClientBuilder.create().build().execute(request);

    assert (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK);
  }
}
