package com.twitter.sdk.android.core.internal.oauth;

import com.twitter.sdk.android.core.TwitterAuthConfig;
import com.twitter.sdk.android.core.TwitterAuthToken;
import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import io.fabric.sdk.android.services.network.HttpRequest.Base64;
import io.fabric.sdk.android.services.network.UrlUtils;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

class OAuth1aParameters
{
  private static final SecureRandom RAND = new SecureRandom();
  private static final String SIGNATURE_METHOD = "HMAC-SHA1";
  private static final String VERSION = "1.0";
  private final TwitterAuthConfig authConfig;
  private final TwitterAuthToken authToken;
  private final String callback;
  private final String method;
  private final Map<String, String> postParams;
  private final String url;

  public OAuth1aParameters(TwitterAuthConfig paramTwitterAuthConfig, TwitterAuthToken paramTwitterAuthToken, String paramString1, String paramString2, String paramString3, Map<String, String> paramMap)
  {
    this.authConfig = paramTwitterAuthConfig;
    this.authToken = paramTwitterAuthToken;
    this.callback = paramString1;
    this.method = paramString2;
    this.url = paramString3;
    this.postParams = paramMap;
  }

  private void appendParameter(StringBuilder paramStringBuilder, String paramString1, String paramString2)
  {
    if (paramString2 != null)
      paramStringBuilder.append(' ').append(UrlUtils.percentEncode(paramString1)).append("=\"").append(UrlUtils.percentEncode(paramString2)).append("\",");
  }

  private String getEncodedQueryParams(TreeMap<String, String> paramTreeMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramTreeMap.size();
    int j = 0;
    Iterator localIterator = paramTreeMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localStringBuilder.append(UrlUtils.percentEncode(UrlUtils.percentEncode((String)localEntry.getKey()))).append("%3D").append(UrlUtils.percentEncode(UrlUtils.percentEncode((String)localEntry.getValue())));
      j++;
      if (j < i)
        localStringBuilder.append("%26");
    }
    return localStringBuilder.toString();
  }

  private String getNonce()
  {
    return String.valueOf(System.nanoTime()) + String.valueOf(Math.abs(RAND.nextLong()));
  }

  private String getSigningKey()
  {
    if (this.authToken != null);
    for (String str = this.authToken.secret; ; str = null)
      return UrlUtils.urlEncode(this.authConfig.getConsumerSecret()) + '&' + UrlUtils.urlEncode(str);
  }

  private String getTimestamp()
  {
    return Long.toString(System.currentTimeMillis() / 1000L);
  }

  String calculateSignature(String paramString)
  {
    try
    {
      String str1 = getSigningKey();
      byte[] arrayOfByte1 = paramString.getBytes("UTF8");
      SecretKeySpec localSecretKeySpec = new SecretKeySpec(str1.getBytes("UTF8"), "HmacSHA1");
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(localSecretKeySpec);
      byte[] arrayOfByte2 = localMac.doFinal(arrayOfByte1);
      String str2 = new String(HttpRequest.Base64.encodeBytesToBytes(arrayOfByte2, 0, arrayOfByte2.length), "UTF8");
      return str2;
    }
    catch (InvalidKeyException localInvalidKeyException)
    {
      Fabric.getLogger().e("Twitter", "Failed to calculate signature", localInvalidKeyException);
      return "";
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      Fabric.getLogger().e("Twitter", "Failed to calculate signature", localNoSuchAlgorithmException);
      return "";
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      Fabric.getLogger().e("Twitter", "Failed to calculate signature", localUnsupportedEncodingException);
    }
    return "";
  }

  String constructAuthorizationHeader(String paramString1, String paramString2, String paramString3)
  {
    StringBuilder localStringBuilder = new StringBuilder("OAuth");
    appendParameter(localStringBuilder, "oauth_callback", this.callback);
    appendParameter(localStringBuilder, "oauth_consumer_key", this.authConfig.getConsumerKey());
    appendParameter(localStringBuilder, "oauth_nonce", paramString1);
    appendParameter(localStringBuilder, "oauth_signature", paramString3);
    appendParameter(localStringBuilder, "oauth_signature_method", "HMAC-SHA1");
    appendParameter(localStringBuilder, "oauth_timestamp", paramString2);
    if (this.authToken != null);
    for (String str = this.authToken.token; ; str = null)
    {
      appendParameter(localStringBuilder, "oauth_token", str);
      appendParameter(localStringBuilder, "oauth_version", "1.0");
      return localStringBuilder.substring(0, -1 + localStringBuilder.length());
    }
  }

  String constructSignatureBase(String paramString1, String paramString2)
  {
    URI localURI = URI.create(this.url);
    TreeMap localTreeMap = UrlUtils.getQueryParams(localURI, true);
    if (this.postParams != null)
      localTreeMap.putAll(this.postParams);
    if (this.callback != null)
      localTreeMap.put("oauth_callback", this.callback);
    localTreeMap.put("oauth_consumer_key", this.authConfig.getConsumerKey());
    localTreeMap.put("oauth_nonce", paramString1);
    localTreeMap.put("oauth_signature_method", "HMAC-SHA1");
    localTreeMap.put("oauth_timestamp", paramString2);
    if ((this.authToken != null) && (this.authToken.token != null))
      localTreeMap.put("oauth_token", this.authToken.token);
    localTreeMap.put("oauth_version", "1.0");
    String str = localURI.getScheme() + "://" + localURI.getHost() + localURI.getPath();
    return this.method.toUpperCase(Locale.ENGLISH) + '&' + UrlUtils.percentEncode(str) + '&' + getEncodedQueryParams(localTreeMap);
  }

  public String getAuthorizationHeader()
  {
    String str1 = getNonce();
    String str2 = getTimestamp();
    return constructAuthorizationHeader(str1, str2, calculateSignature(constructSignatureBase(str1, str2)));
  }
}