package retrofit;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import retrofit.client.Client;
import retrofit.client.Client.Provider;
import retrofit.client.Header;
import retrofit.client.Request;
import retrofit.client.Response;
import retrofit.converter.Converter;
import retrofit.mime.MimeUtil;
import retrofit.mime.TypedByteArray;
import retrofit.mime.TypedInput;
import retrofit.mime.TypedOutput;

public class RestAdapter
{
  static final String IDLE_THREAD_NAME = "Retrofit-Idle";
  static final String THREAD_PREFIX = "Retrofit-";
  final Executor callbackExecutor;
  private final Client.Provider clientProvider;
  final Converter converter;
  final ErrorHandler errorHandler;
  final Executor httpExecutor;
  final RestAdapter.Log log;
  volatile RestAdapter.LogLevel logLevel;
  private final Profiler profiler;
  final RequestInterceptor requestInterceptor;
  private RxSupport rxSupport;
  final Endpoint server;
  private final Map<Class<?>, Map<Method, RestMethodInfo>> serviceMethodInfoCache = new LinkedHashMap();

  private RestAdapter(Endpoint paramEndpoint, Client.Provider paramProvider, Executor paramExecutor1, Executor paramExecutor2, RequestInterceptor paramRequestInterceptor, Converter paramConverter, Profiler paramProfiler, ErrorHandler paramErrorHandler, RestAdapter.Log paramLog, RestAdapter.LogLevel paramLogLevel)
  {
    this.server = paramEndpoint;
    this.clientProvider = paramProvider;
    this.httpExecutor = paramExecutor1;
    this.callbackExecutor = paramExecutor2;
    this.requestInterceptor = paramRequestInterceptor;
    this.converter = paramConverter;
    this.profiler = paramProfiler;
    this.errorHandler = paramErrorHandler;
    this.log = paramLog;
    this.logLevel = paramLogLevel;
  }

  static RestMethodInfo getMethodInfo(Map<Method, RestMethodInfo> paramMap, Method paramMethod)
  {
    try
    {
      RestMethodInfo localRestMethodInfo = (RestMethodInfo)paramMap.get(paramMethod);
      if (localRestMethodInfo == null)
      {
        localRestMethodInfo = new RestMethodInfo(paramMethod);
        paramMap.put(paramMethod, localRestMethodInfo);
      }
      return localRestMethodInfo;
    }
    finally
    {
    }
  }

  private static Profiler.RequestInformation getRequestInfo(String paramString, RestMethodInfo paramRestMethodInfo, Request paramRequest)
  {
    long l = 0L;
    TypedOutput localTypedOutput = paramRequest.getBody();
    String str = null;
    if (localTypedOutput != null)
    {
      l = localTypedOutput.length();
      str = localTypedOutput.mimeType();
    }
    return new Profiler.RequestInformation(paramRestMethodInfo.requestMethod, paramString, paramRestMethodInfo.requestUrl, l, str);
  }

  private Response logAndReplaceResponse(String paramString, Response paramResponse, long paramLong)
    throws IOException
  {
    RestAdapter.Log localLog1 = this.log;
    Object[] arrayOfObject1 = new Object[3];
    arrayOfObject1[0] = Integer.valueOf(paramResponse.getStatus());
    arrayOfObject1[1] = paramString;
    arrayOfObject1[2] = Long.valueOf(paramLong);
    localLog1.log(String.format("<--- HTTP %s %s (%sms)", arrayOfObject1));
    if (this.logLevel.ordinal() >= RestAdapter.LogLevel.HEADERS.ordinal())
    {
      Iterator localIterator = paramResponse.getHeaders().iterator();
      while (localIterator.hasNext())
      {
        Header localHeader = (Header)localIterator.next();
        this.log.log(localHeader.toString());
      }
      long l = 0L;
      TypedInput localTypedInput = paramResponse.getBody();
      if (localTypedInput != null)
      {
        l = localTypedInput.length();
        if (this.logLevel.ordinal() >= RestAdapter.LogLevel.FULL.ordinal())
        {
          if (!paramResponse.getHeaders().isEmpty())
            this.log.log("");
          if (!(localTypedInput instanceof TypedByteArray))
          {
            paramResponse = Utils.readBodyToBytesIfNecessary(paramResponse);
            localTypedInput = paramResponse.getBody();
          }
          byte[] arrayOfByte = ((TypedByteArray)localTypedInput).getBytes();
          l = arrayOfByte.length;
          String str = MimeUtil.parseCharset(localTypedInput.mimeType());
          this.log.log(new String(arrayOfByte, str));
        }
      }
      RestAdapter.Log localLog2 = this.log;
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Long.valueOf(l);
      localLog2.log(String.format("<--- END HTTP (%s-byte body)", arrayOfObject2));
    }
    return paramResponse;
  }

  public <T> T create(Class<T> paramClass)
  {
    Utils.validateServiceClass(paramClass);
    return Proxy.newProxyInstance(paramClass.getClassLoader(), new Class[] { paramClass }, new RestAdapter.RestHandler(this, getMethodInfoCache(paramClass)));
  }

  public RestAdapter.LogLevel getLogLevel()
  {
    return this.logLevel;
  }

  Map<Method, RestMethodInfo> getMethodInfoCache(Class<?> paramClass)
  {
    synchronized (this.serviceMethodInfoCache)
    {
      Object localObject2 = (Map)this.serviceMethodInfoCache.get(paramClass);
      if (localObject2 == null)
      {
        localObject2 = new LinkedHashMap();
        this.serviceMethodInfoCache.put(paramClass, localObject2);
      }
      return localObject2;
    }
  }

  Request logAndReplaceRequest(String paramString, Request paramRequest)
    throws IOException
  {
    RestAdapter.Log localLog = this.log;
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = paramString;
    arrayOfObject[1] = paramRequest.getMethod();
    arrayOfObject[2] = paramRequest.getUrl();
    localLog.log(String.format("---> %s %s %s", arrayOfObject));
    if (this.logLevel.ordinal() >= RestAdapter.LogLevel.HEADERS.ordinal())
    {
      Iterator localIterator = paramRequest.getHeaders().iterator();
      while (localIterator.hasNext())
      {
        Header localHeader = (Header)localIterator.next();
        this.log.log(localHeader.toString());
      }
      String str1 = "no";
      TypedOutput localTypedOutput = paramRequest.getBody();
      if (localTypedOutput != null)
      {
        String str2 = localTypedOutput.mimeType();
        if (str2 != null)
          this.log.log("Content-Type: " + str2);
        long l = localTypedOutput.length();
        str1 = l + "-byte";
        if (l != -1L)
          this.log.log("Content-Length: " + l);
        if (this.logLevel.ordinal() >= RestAdapter.LogLevel.FULL.ordinal())
        {
          if (!paramRequest.getHeaders().isEmpty())
            this.log.log("");
          if (!(localTypedOutput instanceof TypedByteArray))
          {
            paramRequest = Utils.readBodyToBytesIfNecessary(paramRequest);
            localTypedOutput = paramRequest.getBody();
          }
          byte[] arrayOfByte = ((TypedByteArray)localTypedOutput).getBytes();
          String str3 = MimeUtil.parseCharset(localTypedOutput.mimeType());
          this.log.log(new String(arrayOfByte, str3));
        }
      }
      this.log.log(String.format("---> END %s (%s body)", new Object[] { paramString, str1 }));
    }
    return paramRequest;
  }

  void logException(Throwable paramThrowable, String paramString)
  {
    RestAdapter.Log localLog = this.log;
    Object[] arrayOfObject = new Object[1];
    if (paramString != null);
    while (true)
    {
      arrayOfObject[0] = paramString;
      localLog.log(String.format("---- ERROR %s", arrayOfObject));
      StringWriter localStringWriter = new StringWriter();
      paramThrowable.printStackTrace(new PrintWriter(localStringWriter));
      this.log.log(localStringWriter.toString());
      this.log.log("---- END ERROR");
      return;
      paramString = "";
    }
  }

  public void setLogLevel(RestAdapter.LogLevel paramLogLevel)
  {
    if (this.logLevel == null)
      throw new NullPointerException("Log level may not be null.");
    this.logLevel = paramLogLevel;
  }

  public static class Builder
  {
    private Executor callbackExecutor;
    private Client.Provider clientProvider;
    private Converter converter;
    private Endpoint endpoint;
    private ErrorHandler errorHandler;
    private Executor httpExecutor;
    private RestAdapter.Log log;
    private RestAdapter.LogLevel logLevel = RestAdapter.LogLevel.NONE;
    private Profiler profiler;
    private RequestInterceptor requestInterceptor;

    private void ensureSaneDefaults()
    {
      if (this.converter == null)
        this.converter = Platform.get().defaultConverter();
      if (this.clientProvider == null)
        this.clientProvider = Platform.get().defaultClient();
      if (this.httpExecutor == null)
        this.httpExecutor = Platform.get().defaultHttpExecutor();
      if (this.callbackExecutor == null)
        this.callbackExecutor = Platform.get().defaultCallbackExecutor();
      if (this.errorHandler == null)
        this.errorHandler = ErrorHandler.DEFAULT;
      if (this.log == null)
        this.log = Platform.get().defaultLog();
      if (this.requestInterceptor == null)
        this.requestInterceptor = RequestInterceptor.NONE;
    }

    public RestAdapter build()
    {
      if (this.endpoint == null)
        throw new IllegalArgumentException("Endpoint may not be null.");
      ensureSaneDefaults();
      return new RestAdapter(this.endpoint, this.clientProvider, this.httpExecutor, this.callbackExecutor, this.requestInterceptor, this.converter, this.profiler, this.errorHandler, this.log, this.logLevel, null);
    }

    public Builder setClient(Client.Provider paramProvider)
    {
      if (paramProvider == null)
        throw new NullPointerException("Client provider may not be null.");
      this.clientProvider = paramProvider;
      return this;
    }

    public Builder setClient(Client paramClient)
    {
      if (paramClient == null)
        throw new NullPointerException("Client may not be null.");
      return setClient(new RestAdapter.Builder.1(this, paramClient));
    }

    public Builder setConverter(Converter paramConverter)
    {
      if (paramConverter == null)
        throw new NullPointerException("Converter may not be null.");
      this.converter = paramConverter;
      return this;
    }

    public Builder setEndpoint(String paramString)
    {
      if ((paramString == null) || (paramString.trim().length() == 0))
        throw new NullPointerException("Endpoint may not be blank.");
      this.endpoint = Endpoints.newFixedEndpoint(paramString);
      return this;
    }

    public Builder setEndpoint(Endpoint paramEndpoint)
    {
      if (paramEndpoint == null)
        throw new NullPointerException("Endpoint may not be null.");
      this.endpoint = paramEndpoint;
      return this;
    }

    public Builder setErrorHandler(ErrorHandler paramErrorHandler)
    {
      if (paramErrorHandler == null)
        throw new NullPointerException("Error handler may not be null.");
      this.errorHandler = paramErrorHandler;
      return this;
    }

    public Builder setExecutors(Executor paramExecutor1, Executor paramExecutor2)
    {
      if (paramExecutor1 == null)
        throw new NullPointerException("HTTP executor may not be null.");
      if (paramExecutor2 == null)
        paramExecutor2 = new Utils.SynchronousExecutor();
      this.httpExecutor = paramExecutor1;
      this.callbackExecutor = paramExecutor2;
      return this;
    }

    public Builder setLog(RestAdapter.Log paramLog)
    {
      if (paramLog == null)
        throw new NullPointerException("Log may not be null.");
      this.log = paramLog;
      return this;
    }

    public Builder setLogLevel(RestAdapter.LogLevel paramLogLevel)
    {
      if (paramLogLevel == null)
        throw new NullPointerException("Log level may not be null.");
      this.logLevel = paramLogLevel;
      return this;
    }

    public Builder setProfiler(Profiler paramProfiler)
    {
      if (paramProfiler == null)
        throw new NullPointerException("Profiler may not be null.");
      this.profiler = paramProfiler;
      return this;
    }

    public Builder setRequestInterceptor(RequestInterceptor paramRequestInterceptor)
    {
      if (paramRequestInterceptor == null)
        throw new NullPointerException("Request interceptor may not be null.");
      this.requestInterceptor = paramRequestInterceptor;
      return this;
    }
  }
}