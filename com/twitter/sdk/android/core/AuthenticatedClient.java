package com.twitter.sdk.android.core;

import com.twitter.sdk.android.core.internal.TwitterRequestHeaders;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import javax.net.ssl.SSLSocketFactory;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import retrofit.client.Client;
import retrofit.client.Header;
import retrofit.client.Request;
import retrofit.client.Response;
import retrofit.mime.FormUrlEncodedTypedOutput;
import retrofit.mime.TypedOutput;

public class AuthenticatedClient extends DefaultClient
{
  private static final String FAKE_URL = "https://twitter.com";
  private final TwitterAuthConfig authConfig;
  private final Session session;

  public AuthenticatedClient(TwitterAuthConfig paramTwitterAuthConfig, Session paramSession, SSLSocketFactory paramSSLSocketFactory)
  {
    super(paramSSLSocketFactory);
    this.authConfig = paramTwitterAuthConfig;
    this.session = paramSession;
  }

  public Response execute(Request paramRequest)
    throws IOException
  {
    Request localRequest = new Request(paramRequest.getMethod(), paramRequest.getUrl(), getAuthHeaders(paramRequest), paramRequest.getBody());
    return this.wrappedClient.execute(localRequest);
  }

  protected List<Header> getAuthHeaders(Request paramRequest)
    throws IOException
  {
    TwitterRequestHeaders localTwitterRequestHeaders = new TwitterRequestHeaders(paramRequest.getMethod(), paramRequest.getUrl(), this.authConfig, this.session, null, getPostParams(paramRequest));
    ArrayList localArrayList = new ArrayList(paramRequest.getHeaders());
    Iterator localIterator = localTwitterRequestHeaders.getHeaders().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localArrayList.add(new Header((String)localEntry.getKey(), (String)localEntry.getValue()));
    }
    return localArrayList;
  }

  protected Map<String, String> getPostParams(Request paramRequest)
    throws IOException
  {
    TreeMap localTreeMap = new TreeMap();
    if ("POST".equals(paramRequest.getMethod().toUpperCase(Locale.US)))
    {
      TypedOutput localTypedOutput = paramRequest.getBody();
      if ((localTypedOutput instanceof FormUrlEncodedTypedOutput))
      {
        ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
        localTypedOutput.writeTo(localByteArrayOutputStream);
        String str = localByteArrayOutputStream.toString("UTF-8");
        if (str.length() > 0)
        {
          Iterator localIterator = URLEncodedUtils.parse(URI.create("https://twitter.com/?" + str), "UTF-8").iterator();
          while (localIterator.hasNext())
          {
            NameValuePair localNameValuePair = (NameValuePair)localIterator.next();
            localTreeMap.put(localNameValuePair.getName(), localNameValuePair.getValue());
          }
        }
      }
    }
    return localTreeMap;
  }
}