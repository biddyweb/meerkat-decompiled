package io.fabric.sdk.android.services.network;

public enum HttpMethod
{
  static
  {
    DELETE = new HttpMethod("DELETE", 3);
    HttpMethod[] arrayOfHttpMethod = new HttpMethod[4];
    arrayOfHttpMethod[0] = GET;
    arrayOfHttpMethod[1] = POST;
    arrayOfHttpMethod[2] = PUT;
    arrayOfHttpMethod[3] = DELETE;
  }
}