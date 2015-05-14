package com.twitter.sdk.android.core.internal.scribe;

import android.content.Context;
import android.text.TextUtils;
import com.twitter.sdk.android.core.AuthenticatedClient;
import com.twitter.sdk.android.core.Session;
import com.twitter.sdk.android.core.SessionManager;
import com.twitter.sdk.android.core.TwitterAuthConfig;
import io.fabric.sdk.android.services.common.CommonUtils;
import io.fabric.sdk.android.services.common.IdManager;
import io.fabric.sdk.android.services.common.QueueFile.ElementReader;
import io.fabric.sdk.android.services.events.FilesSender;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicReference;
import javax.net.ssl.SSLSocketFactory;
import retrofit.RequestInterceptor;
import retrofit.RequestInterceptor.RequestFacade;
import retrofit.RestAdapter;
import retrofit.RestAdapter.Builder;
import retrofit.RetrofitError;
import retrofit.android.MainThreadExecutor;
import retrofit.client.Response;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.Headers;
import retrofit.http.POST;
import retrofit.http.Path;

class ScribeFilesSender
  implements FilesSender
{
  private static final byte[] COMMA = { 44 };
  private static final byte[] END_JSON_ARRAY = { 93 };
  private static final String SEND_FILE_FAILURE_ERROR = "Failed sending files";
  private static final byte[] START_JSON_ARRAY = { 91 };
  private final AtomicReference<RestAdapter> apiAdapter;
  private final TwitterAuthConfig authConfig;
  private final Context context;
  private final ExecutorService executorService;
  private final IdManager idManager;
  private final long ownerId;
  private final ScribeConfig scribeConfig;
  private final List<SessionManager<? extends Session>> sessionManagers;
  private final SSLSocketFactory sslSocketFactory;

  public ScribeFilesSender(Context paramContext, ScribeConfig paramScribeConfig, long paramLong, TwitterAuthConfig paramTwitterAuthConfig, List<SessionManager<? extends Session>> paramList, SSLSocketFactory paramSSLSocketFactory, ExecutorService paramExecutorService, IdManager paramIdManager)
  {
    this.context = paramContext;
    this.scribeConfig = paramScribeConfig;
    this.ownerId = paramLong;
    this.authConfig = paramTwitterAuthConfig;
    this.sessionManagers = paramList;
    this.sslSocketFactory = paramSSLSocketFactory;
    this.executorService = paramExecutorService;
    this.idManager = paramIdManager;
    this.apiAdapter = new AtomicReference();
  }

  private Session getSession(long paramLong)
  {
    Session localSession = null;
    Iterator localIterator = this.sessionManagers.iterator();
    do
    {
      if (!localIterator.hasNext())
        break;
      localSession = ((SessionManager)localIterator.next()).getSession(paramLong);
    }
    while (localSession == null);
    return localSession;
  }

  private boolean hasApiAdapter()
  {
    return getApiAdapter() != null;
  }

  private boolean isValidSession(Session paramSession)
  {
    return (paramSession != null) && (paramSession.getAuthToken() != null);
  }

  RestAdapter getApiAdapter()
  {
    try
    {
      if (this.apiAdapter.get() == null)
      {
        Session localSession = getSession(this.ownerId);
        ConfigRequestInterceptor localConfigRequestInterceptor = new ConfigRequestInterceptor(this.scribeConfig, this.idManager);
        if (!isValidSession(localSession))
          break label128;
        this.apiAdapter.compareAndSet(null, new RestAdapter.Builder().setEndpoint(this.scribeConfig.baseUrl).setExecutors(this.executorService, new MainThreadExecutor()).setRequestInterceptor(localConfigRequestInterceptor).setClient(new AuthenticatedClient(this.authConfig, localSession, this.sslSocketFactory)).build());
      }
      while (true)
      {
        RestAdapter localRestAdapter = (RestAdapter)this.apiAdapter.get();
        return localRestAdapter;
        label128: CommonUtils.logControlled(this.context, "No valid session at this time");
      }
    }
    finally
    {
    }
  }

  // ERROR //
  String getScribeEventsAsJsonArrayString(List<File> paramList)
    throws IOException
  {
    // Byte code:
    //   0: new 170\011java/io/ByteArrayOutputStream
    //   3: dup
    //   4: sipush 1024
    //   7: invokespecial 173\011java/io/ByteArrayOutputStream:<init>\011(I)V
    //   10: astore_2
    //   11: iconst_1
    //   12: newarray boolean
    //   14: astore_3
    //   15: aload_2
    //   16: getstatic 38\011com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender:START_JSON_ARRAY\011[B
    //   19: invokevirtual 177\011java/io/ByteArrayOutputStream:write\011([B)V
    //   22: aload_1
    //   23: invokeinterface 77 1 0
    //   28: astore 4
    //   30: aload 4
    //   32: invokeinterface 83 1 0
    //   37: ifeq +62 -> 99
    //   40: aload 4
    //   42: invokeinterface 87 1 0
    //   47: checkcast 179\011java/io/File
    //   50: astore 5
    //   52: aconst_null
    //   53: astore 6
    //   55: new 181\011io/fabric/sdk/android/services/common/QueueFile
    //   58: dup
    //   59: aload 5
    //   61: invokespecial 184\011io/fabric/sdk/android/services/common/QueueFile:<init>\011(Ljava/io/File;)V
    //   64: astore 7
    //   66: aload 7
    //   68: new 186\011com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1
    //   71: dup
    //   72: aload_0
    //   73: aload_3
    //   74: aload_2
    //   75: invokespecial 189\011com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1:<init>\011(Lcom/twitter/sdk/android/core/internal/scribe/ScribeFilesSender;[ZLjava/io/ByteArrayOutputStream;)V
    //   78: invokevirtual 193\011io/fabric/sdk/android/services/common/QueueFile:forEach\011(Lio/fabric/sdk/android/services/common/QueueFile$ElementReader;)V
    //   81: aload 7
    //   83: invokestatic 197\011io/fabric/sdk/android/services/common/CommonUtils:closeQuietly\011(Ljava/io/Closeable;)V
    //   86: goto -56 -> 30
    //   89: astore 8
    //   91: aload 6
    //   93: invokestatic 197\011io/fabric/sdk/android/services/common/CommonUtils:closeQuietly\011(Ljava/io/Closeable;)V
    //   96: aload 8
    //   98: athrow
    //   99: aload_2
    //   100: getstatic 42\011com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender:END_JSON_ARRAY\011[B
    //   103: invokevirtual 177\011java/io/ByteArrayOutputStream:write\011([B)V
    //   106: aload_2
    //   107: ldc 199
    //   109: invokevirtual 203\011java/io/ByteArrayOutputStream:toString\011(Ljava/lang/String;)Ljava/lang/String;
    //   112: areturn
    //   113: astore 8
    //   115: aload 7
    //   117: astore 6
    //   119: goto -28 -> 91
    //
    // Exception table:
    //   from\011to\011target\011type
    //   55\01166\01189\011finally
    //   66\01181\011113\011finally
  }

  public boolean send(List<File> paramList)
  {
    if (hasApiAdapter());
    while (true)
    {
      try
      {
        String str = getScribeEventsAsJsonArrayString(paramList);
        CommonUtils.logControlled(this.context, str);
        if (upload(str).getStatus() == 200)
          return true;
        CommonUtils.logControlledError(this.context, "Failed sending files", null);
        return false;
      }
      catch (RetrofitError localRetrofitError)
      {
        CommonUtils.logControlledError(this.context, "Failed sending files", localRetrofitError);
        if (localRetrofitError.getResponse() == null)
          continue;
        if (localRetrofitError.getResponse().getStatus() == 500)
          break;
        if (localRetrofitError.getResponse().getStatus() != 400)
          continue;
        return true;
      }
      catch (IOException localIOException)
      {
        CommonUtils.logControlledError(this.context, "Failed sending files", localIOException);
        continue;
      }
      CommonUtils.logControlled(this.context, "Cannot attempt upload at this time");
    }
    return true;
  }

  void setApiAdapter(RestAdapter paramRestAdapter)
  {
    this.apiAdapter.set(paramRestAdapter);
  }

  Response upload(String paramString)
  {
    ScribeService localScribeService = (ScribeService)((RestAdapter)this.apiAdapter.get()).create(ScribeService.class);
    if (!TextUtils.isEmpty(this.scribeConfig.sequence))
      return localScribeService.uploadSequence(this.scribeConfig.sequence, paramString);
    return localScribeService.upload(this.scribeConfig.pathVersion, this.scribeConfig.pathType, paramString);
  }

  static class ConfigRequestInterceptor
    implements RequestInterceptor
  {
    private static final String CLIENT_UUID_HEADER = "X-Client-UUID";
    private static final String POLLING_HEADER = "X-Twitter-Polling";
    private static final String POLLING_HEADER_VALUE = "true";
    private static final String USER_AGENT_HEADER = "User-Agent";
    private final IdManager idManager;
    private final ScribeConfig scribeConfig;

    ConfigRequestInterceptor(ScribeConfig paramScribeConfig, IdManager paramIdManager)
    {
      this.scribeConfig = paramScribeConfig;
      this.idManager = paramIdManager;
    }

    public void intercept(RequestInterceptor.RequestFacade paramRequestFacade)
    {
      if (!TextUtils.isEmpty(this.scribeConfig.userAgent))
        paramRequestFacade.addHeader("User-Agent", this.scribeConfig.userAgent);
      if (!TextUtils.isEmpty(this.idManager.getDeviceUUID()))
        paramRequestFacade.addHeader("X-Client-UUID", this.idManager.getDeviceUUID());
      paramRequestFacade.addHeader("X-Twitter-Polling", "true");
    }
  }

  static abstract interface ScribeService
  {
    @FormUrlEncoded
    @Headers({"Content-Type: application/x-www-form-urlencoded;charset=UTF-8"})
    @POST("/{version}/jot/{type}")
    public abstract Response upload(@Path("version") String paramString1, @Path("type") String paramString2, @Field("log[]") String paramString3);

    @FormUrlEncoded
    @Headers({"Content-Type: application/x-www-form-urlencoded;charset=UTF-8"})
    @POST("/scribe/{sequence}")
    public abstract Response uploadSequence(@Path("sequence") String paramString1, @Field("log[]") String paramString2);
  }
}