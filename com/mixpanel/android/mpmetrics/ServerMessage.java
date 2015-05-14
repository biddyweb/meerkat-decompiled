package com.mixpanel.android.mpmetrics;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;

class ServerMessage
{
  private static final String LOGTAG = "MixpanelAPI.ServerMessage";

  private byte[] slurp(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte[8192];
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte, 0, arrayOfByte.length);
      if (i == -1)
        break;
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    localByteArrayOutputStream.flush();
    return localByteArrayOutputStream.toByteArray();
  }

  public byte[] getUrls(Context paramContext, String[] paramArrayOfString)
  {
    if (!isOnline(paramContext))
      return null;
    int i = paramArrayOfString.length;
    int j = 0;
    while (j < i)
    {
      String str = paramArrayOfString[j];
      try
      {
        byte[] arrayOfByte = performRequest(str, null);
        return arrayOfByte;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        Log.e("MixpanelAPI.ServerMessage", "Cannot interpret " + str + " as a URL.", localMalformedURLException);
        j++;
      }
      catch (IOException localIOException)
      {
        while (true)
          if (MPConfig.DEBUG)
            Log.v("MixpanelAPI.ServerMessage", "Cannot get " + str + ".", localIOException);
      }
      catch (OutOfMemoryError localOutOfMemoryError)
      {
        Log.e("MixpanelAPI.ServerMessage", "Out of memory when getting to " + str + ".", localOutOfMemoryError);
      }
    }
    return null;
  }

  public boolean isOnline(Context paramContext)
  {
    while (true)
    {
      try
      {
        NetworkInfo localNetworkInfo = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
        if ((localNetworkInfo == null) || (!localNetworkInfo.isConnectedOrConnecting()))
          break label106;
        bool = true;
        if (MPConfig.DEBUG)
        {
          StringBuilder localStringBuilder = new StringBuilder().append("ConnectivityManager says we ");
          if (bool)
          {
            str = "are";
            Log.v("MixpanelAPI.ServerMessage", str + " online");
            return bool;
          }
          String str = "are not";
          continue;
        }
      }
      catch (SecurityException localSecurityException)
      {
        bool = true;
        if (MPConfig.DEBUG)
          Log.v("MixpanelAPI.ServerMessage", "Don't have permission to check connectivity, will assume we are online");
      }
      return bool;
      label106: boolean bool = false;
    }
  }

  // ERROR //
  public byte[] performRequest(String paramString, java.util.List<org.apache.http.NameValuePair> paramList)
    throws IOException
  {
    // Byte code:
    //   0: getstatic 77\011com/mixpanel/android/mpmetrics/MPConfig:DEBUG\011Z
    //   3: ifeq +28 -> 31
    //   6: ldc 8
    //   8: new 52\011java/lang/StringBuilder
    //   11: dup
    //   12: invokespecial 53\011java/lang/StringBuilder:<init>\011()V
    //   15: ldc 125
    //   17: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   20: aload_1
    //   21: invokevirtual 59\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   24: invokevirtual 65\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   27: invokestatic 117\011android/util/Log:v\011(Ljava/lang/String;Ljava/lang/String;)I
    //   30: pop
    //   31: aconst_null
    //   32: astore_3
    //   33: iconst_0
    //   34: istore 4
    //   36: iconst_0
    //   37: istore 5
    //   39: iload 4
    //   41: iconst_3
    //   42: if_icmpge +299 -> 341
    //   45: iload 5
    //   47: ifne +294 -> 341
    //   50: aconst_null
    //   51: astore 7
    //   53: aconst_null
    //   54: astore 8
    //   56: aconst_null
    //   57: astore 9
    //   59: aconst_null
    //   60: astore 10
    //   62: new 127\011java/net/URL
    //   65: dup
    //   66: aload_1
    //   67: invokespecial 130\011java/net/URL:<init>\011(Ljava/lang/String;)V
    //   70: invokevirtual 134\011java/net/URL:openConnection\011()Ljava/net/URLConnection;
    //   73: checkcast 136\011java/net/HttpURLConnection
    //   76: astore 10
    //   78: aload 10
    //   80: sipush 2000
    //   83: invokevirtual 140\011java/net/HttpURLConnection:setConnectTimeout\011(I)V
    //   86: aload 10
    //   88: sipush 10000
    //   91: invokevirtual 143\011java/net/HttpURLConnection:setReadTimeout\011(I)V
    //   94: aload_2
    //   95: ifnull +80 -> 175
    //   98: aload 10
    //   100: iconst_1
    //   101: invokevirtual 147\011java/net/HttpURLConnection:setDoOutput\011(Z)V
    //   104: new 149\011org/apache/http/client/entity/UrlEncodedFormEntity
    //   107: dup
    //   108: aload_2
    //   109: ldc 151
    //   111: invokespecial 154\011org/apache/http/client/entity/UrlEncodedFormEntity:<init>\011(Ljava/util/List;Ljava/lang/String;)V
    //   114: astore 20
    //   116: aload 10
    //   118: ldc 156
    //   120: invokevirtual 159\011java/net/HttpURLConnection:setRequestMethod\011(Ljava/lang/String;)V
    //   123: aload 10
    //   125: aload 20
    //   127: invokevirtual 163\011org/apache/http/client/entity/UrlEncodedFormEntity:getContentLength\011()J
    //   130: l2i
    //   131: invokevirtual 166\011java/net/HttpURLConnection:setFixedLengthStreamingMode\011(I)V
    //   134: aload 10
    //   136: invokevirtual 170\011java/net/HttpURLConnection:getOutputStream\011()Ljava/io/OutputStream;
    //   139: astore 8
    //   141: new 172\011java/io/BufferedOutputStream
    //   144: dup
    //   145: aload 8
    //   147: invokespecial 175\011java/io/BufferedOutputStream:<init>\011(Ljava/io/OutputStream;)V
    //   150: astore 21
    //   152: aload 20
    //   154: aload 21
    //   156: invokevirtual 178\011org/apache/http/client/entity/UrlEncodedFormEntity:writeTo\011(Ljava/io/OutputStream;)V
    //   159: aload 21
    //   161: invokevirtual 181\011java/io/BufferedOutputStream:close\011()V
    //   164: aconst_null
    //   165: astore 9
    //   167: aload 8
    //   169: invokevirtual 184\011java/io/OutputStream:close\011()V
    //   172: aconst_null
    //   173: astore 8
    //   175: aload 10
    //   177: invokevirtual 188\011java/net/HttpURLConnection:getInputStream\011()Ljava/io/InputStream;
    //   180: astore 7
    //   182: aload_0
    //   183: aload 7
    //   185: invokespecial 190\011com/mixpanel/android/mpmetrics/ServerMessage:slurp\011(Ljava/io/InputStream;)[B
    //   188: astore_3
    //   189: aload 7
    //   191: invokevirtual 191\011java/io/InputStream:close\011()V
    //   194: iconst_1
    //   195: istore 5
    //   197: iconst_0
    //   198: ifeq +7 -> 205
    //   201: aconst_null
    //   202: invokevirtual 181\011java/io/BufferedOutputStream:close\011()V
    //   205: iconst_0
    //   206: ifeq +7 -> 213
    //   209: aconst_null
    //   210: invokevirtual 184\011java/io/OutputStream:close\011()V
    //   213: iconst_0
    //   214: ifeq +7 -> 221
    //   217: aconst_null
    //   218: invokevirtual 191\011java/io/InputStream:close\011()V
    //   221: aload 10
    //   223: ifnull -184 -> 39
    //   226: aload 10
    //   228: invokevirtual 194\011java/net/HttpURLConnection:disconnect\011()V
    //   231: goto -192 -> 39
    //   234: astore 15
    //   236: getstatic 77\011com/mixpanel/android/mpmetrics/MPConfig:DEBUG\011Z
    //   239: ifeq +11 -> 250
    //   242: ldc 8
    //   244: ldc 196
    //   246: invokestatic 199\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
    //   249: pop
    //   250: iinc 4 1
    //   253: aload 9
    //   255: ifnull +8 -> 263
    //   258: aload 9
    //   260: invokevirtual 181\011java/io/BufferedOutputStream:close\011()V
    //   263: aload 8
    //   265: ifnull +8 -> 273
    //   268: aload 8
    //   270: invokevirtual 184\011java/io/OutputStream:close\011()V
    //   273: aload 7
    //   275: ifnull +8 -> 283
    //   278: aload 7
    //   280: invokevirtual 191\011java/io/InputStream:close\011()V
    //   283: aload 10
    //   285: ifnull -246 -> 39
    //   288: aload 10
    //   290: invokevirtual 194\011java/net/HttpURLConnection:disconnect\011()V
    //   293: goto -254 -> 39
    //   296: astore 11
    //   298: aload 9
    //   300: ifnull +8 -> 308
    //   303: aload 9
    //   305: invokevirtual 181\011java/io/BufferedOutputStream:close\011()V
    //   308: aload 8
    //   310: ifnull +8 -> 318
    //   313: aload 8
    //   315: invokevirtual 184\011java/io/OutputStream:close\011()V
    //   318: aload 7
    //   320: ifnull +8 -> 328
    //   323: aload 7
    //   325: invokevirtual 191\011java/io/InputStream:close\011()V
    //   328: aload 10
    //   330: ifnull +8 -> 338
    //   333: aload 10
    //   335: invokevirtual 194\011java/net/HttpURLConnection:disconnect\011()V
    //   338: aload 11
    //   340: athrow
    //   341: getstatic 77\011com/mixpanel/android/mpmetrics/MPConfig:DEBUG\011Z
    //   344: ifeq +17 -> 361
    //   347: iload 4
    //   349: iconst_3
    //   350: if_icmplt +11 -> 361
    //   353: ldc 8
    //   355: ldc 201
    //   357: invokestatic 117\011android/util/Log:v\011(Ljava/lang/String;Ljava/lang/String;)I
    //   360: pop
    //   361: aload_3
    //   362: areturn
    //   363: astore 25
    //   365: goto -160 -> 205
    //   368: astore 24
    //   370: goto -157 -> 213
    //   373: astore 23
    //   375: goto -154 -> 221
    //   378: astore 18
    //   380: goto -117 -> 263
    //   383: astore 17
    //   385: goto -112 -> 273
    //   388: astore 16
    //   390: goto -107 -> 283
    //   393: astore 14
    //   395: goto -87 -> 308
    //   398: astore 13
    //   400: goto -82 -> 318
    //   403: astore 12
    //   405: goto -77 -> 328
    //   408: astore 11
    //   410: aload 21
    //   412: astore 9
    //   414: aconst_null
    //   415: astore 7
    //   417: goto -119 -> 298
    //   420: astore 22
    //   422: aload 21
    //   424: astore 9
    //   426: aconst_null
    //   427: astore 7
    //   429: goto -193 -> 236
    //
    // Exception table:
    //   from\011to\011target\011type
    //   62\01194\011234\011java/io/EOFException
    //   98\011152\011234\011java/io/EOFException
    //   167\011172\011234\011java/io/EOFException
    //   175\011194\011234\011java/io/EOFException
    //   62\01194\011296\011finally
    //   98\011152\011296\011finally
    //   167\011172\011296\011finally
    //   175\011194\011296\011finally
    //   236\011250\011296\011finally
    //   201\011205\011363\011java/io/IOException
    //   209\011213\011368\011java/io/IOException
    //   217\011221\011373\011java/io/IOException
    //   258\011263\011378\011java/io/IOException
    //   268\011273\011383\011java/io/IOException
    //   278\011283\011388\011java/io/IOException
    //   303\011308\011393\011java/io/IOException
    //   313\011318\011398\011java/io/IOException
    //   323\011328\011403\011java/io/IOException
    //   152\011164\011408\011finally
    //   152\011164\011420\011java/io/EOFException
  }
}