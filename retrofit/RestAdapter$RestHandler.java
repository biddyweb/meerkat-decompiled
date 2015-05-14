package retrofit;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.concurrent.Executor;

class RestAdapter$RestHandler
  implements InvocationHandler
{
  private final Map<Method, RestMethodInfo> methodDetailsCache;

  RestAdapter$RestHandler(Map<Method, RestMethodInfo> paramMap)
  {
    Object localObject;
    this.methodDetailsCache = localObject;
  }

  // ERROR //
  private Object invokeRequest(RequestInterceptor paramRequestInterceptor, RestMethodInfo paramRestMethodInfo, Object[] paramArrayOfObject)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore 4
    //   3: aload_2
    //   4: invokevirtual 39\011retrofit/RestMethodInfo:init\011()V
    //   7: aload_0
    //   8: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   11: getfield 45\011retrofit/RestAdapter:server\011Lretrofit/Endpoint;
    //   14: invokeinterface 51 1 0
    //   19: astore 9
    //   21: new 53\011retrofit/RequestBuilder
    //   24: dup
    //   25: aload 9
    //   27: aload_2
    //   28: aload_0
    //   29: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   32: getfield 57\011retrofit/RestAdapter:converter\011Lretrofit/converter/Converter;
    //   35: invokespecial 60\011retrofit/RequestBuilder:<init>\011(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/converter/Converter;)V
    //   38: astore 10
    //   40: aload 10
    //   42: aload_3
    //   43: invokevirtual 64\011retrofit/RequestBuilder:setArguments\011([Ljava/lang/Object;)V
    //   46: aload_1
    //   47: aload 10
    //   49: invokeinterface 70 2 0
    //   54: aload 10
    //   56: invokevirtual 74\011retrofit/RequestBuilder:build\011()Lretrofit/client/Request;
    //   59: astore 11
    //   61: aload 11
    //   63: invokevirtual 77\011retrofit/client/Request:getUrl\011()Ljava/lang/String;
    //   66: astore 4
    //   68: aload_2
    //   69: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   72: ifne +49 -> 121
    //   75: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   78: astore 35
    //   80: new 89\011java/lang/StringBuilder
    //   83: dup
    //   84: invokespecial 90\011java/lang/StringBuilder:<init>\011()V
    //   87: ldc 92
    //   89: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   92: astore 36
    //   94: aload 9
    //   96: invokevirtual 102\011java/lang/String:length\011()I
    //   99: istore 37
    //   101: aload 35
    //   103: aload 36
    //   105: aload 4
    //   107: iload 37
    //   109: invokevirtual 106\011java/lang/String:substring\011(I)Ljava/lang/String;
    //   112: invokevirtual 96\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: invokevirtual 109\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   118: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   121: aload_0
    //   122: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   125: getfield 117\011retrofit/RestAdapter:logLevel\011Lretrofit/RestAdapter$LogLevel;
    //   128: invokevirtual 123\011retrofit/RestAdapter$LogLevel:log\011()Z
    //   131: ifeq +16 -> 147
    //   134: aload_0
    //   135: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   138: ldc 125
    //   140: aload 11
    //   142: invokevirtual 129\011retrofit/RestAdapter:logAndReplaceRequest\011(Ljava/lang/String;Lretrofit/client/Request;)Lretrofit/client/Request;
    //   145: astore 11
    //   147: aload_0
    //   148: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   151: invokestatic 133\011retrofit/RestAdapter:access$200\011(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   154: astore 12
    //   156: aconst_null
    //   157: astore 13
    //   159: aload 12
    //   161: ifnull +17 -> 178
    //   164: aload_0
    //   165: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   168: invokestatic 133\011retrofit/RestAdapter:access$200\011(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   171: invokeinterface 139 1 0
    //   176: astore 13
    //   178: invokestatic 145\011java/lang/System:nanoTime\011()J
    //   181: lstore 14
    //   183: aload_0
    //   184: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   187: invokestatic 149\011retrofit/RestAdapter:access$300\011(Lretrofit/RestAdapter;)Lretrofit/client/Client$Provider;
    //   190: invokeinterface 155 1 0
    //   195: aload 11
    //   197: invokeinterface 161 2 0
    //   202: astore 16
    //   204: getstatic 167\011java/util/concurrent/TimeUnit:NANOSECONDS\011Ljava/util/concurrent/TimeUnit;
    //   207: invokestatic 145\011java/lang/System:nanoTime\011()J
    //   210: lload 14
    //   212: lsub
    //   213: invokevirtual 171\011java/util/concurrent/TimeUnit:toMillis\011(J)J
    //   216: lstore 17
    //   218: aload 16
    //   220: invokevirtual 176\011retrofit/client/Response:getStatus\011()I
    //   223: istore 19
    //   225: aload_0
    //   226: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   229: invokestatic 133\011retrofit/RestAdapter:access$200\011(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   232: ifnull +33 -> 265
    //   235: aload 9
    //   237: aload_2
    //   238: aload 11
    //   240: invokestatic 180\011retrofit/RestAdapter:access$400\011(Ljava/lang/String;Lretrofit/RestMethodInfo;Lretrofit/client/Request;)Lretrofit/Profiler$RequestInformation;
    //   243: astore 34
    //   245: aload_0
    //   246: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   249: invokestatic 133\011retrofit/RestAdapter:access$200\011(Lretrofit/RestAdapter;)Lretrofit/Profiler;
    //   252: aload 34
    //   254: lload 17
    //   256: iload 19
    //   258: aload 13
    //   260: invokeinterface 184 6 0
    //   265: aload_0
    //   266: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   269: getfield 117\011retrofit/RestAdapter:logLevel\011Lretrofit/RestAdapter$LogLevel;
    //   272: invokevirtual 123\011retrofit/RestAdapter$LogLevel:log\011()Z
    //   275: ifeq +18 -> 293
    //   278: aload_0
    //   279: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   282: aload 4
    //   284: aload 16
    //   286: lload 17
    //   288: invokestatic 188\011retrofit/RestAdapter:access$500\011(Lretrofit/RestAdapter;Ljava/lang/String;Lretrofit/client/Response;J)Lretrofit/client/Response;
    //   291: astore 16
    //   293: aload_2
    //   294: getfield 192\011retrofit/RestMethodInfo:responseObjectType\011Ljava/lang/reflect/Type;
    //   297: astore 20
    //   299: iload 19
    //   301: sipush 200
    //   304: if_icmplt +371 -> 675
    //   307: iload 19
    //   309: sipush 300
    //   312: if_icmpge +363 -> 675
    //   315: aload 20
    //   317: ldc 173
    //   319: invokevirtual 196\011java/lang/Object:equals\011(Ljava/lang/Object;)Z
    //   322: ifeq +81 -> 403
    //   325: aload_2
    //   326: getfield 199\011retrofit/RestMethodInfo:isStreaming\011Z
    //   329: ifne +10 -> 339
    //   332: aload 16
    //   334: invokestatic 205\011retrofit/Utils:readBodyToBytesIfNecessary\011(Lretrofit/client/Response;)Lretrofit/client/Response;
    //   337: astore 16
    //   339: aload_2
    //   340: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   343: istore 33
    //   345: iload 33
    //   347: ifeq +25 -> 372
    //   350: aload_2
    //   351: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   354: ifne +11 -> 365
    //   357: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   360: ldc 207
    //   362: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   365: aload 16
    //   367: astore 25
    //   369: aload 25
    //   371: areturn
    //   372: new 209\011retrofit/ResponseWrapper
    //   375: dup
    //   376: aload 16
    //   378: aload 16
    //   380: invokespecial 212\011retrofit/ResponseWrapper:<init>\011(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   383: astore 25
    //   385: aload_2
    //   386: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   389: ifne -20 -> 369
    //   392: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   395: ldc 207
    //   397: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   400: aload 25
    //   402: areturn
    //   403: aload 16
    //   405: invokevirtual 216\011retrofit/client/Response:getBody\011()Lretrofit/mime/TypedInput;
    //   408: astore 23
    //   410: aload 23
    //   412: ifnonnull +68 -> 480
    //   415: aload_2
    //   416: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   419: istore 24
    //   421: iload 24
    //   423: ifeq +27 -> 450
    //   426: aload_2
    //   427: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   430: istore 26
    //   432: aconst_null
    //   433: astore 25
    //   435: iload 26
    //   437: ifne -68 -> 369
    //   440: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   443: ldc 207
    //   445: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   448: aconst_null
    //   449: areturn
    //   450: new 209\011retrofit/ResponseWrapper
    //   453: dup
    //   454: aload 16
    //   456: aconst_null
    //   457: invokespecial 212\011retrofit/ResponseWrapper:<init>\011(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   460: astore 25
    //   462: aload_2
    //   463: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   466: ifne -97 -> 369
    //   469: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   472: ldc 207
    //   474: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   477: aload 25
    //   479: areturn
    //   480: new 218\011retrofit/ExceptionCatchingTypedInput
    //   483: dup
    //   484: aload 23
    //   486: invokespecial 221\011retrofit/ExceptionCatchingTypedInput:<init>\011(Lretrofit/mime/TypedInput;)V
    //   489: astore 27
    //   491: aload_0
    //   492: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   495: getfield 57\011retrofit/RestAdapter:converter\011Lretrofit/converter/Converter;
    //   498: aload 27
    //   500: aload 20
    //   502: invokeinterface 227 3 0
    //   507: astore 25
    //   509: aload_2
    //   510: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   513: istore 31
    //   515: iload 31
    //   517: ifeq +21 -> 538
    //   520: aload_2
    //   521: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   524: ifne -155 -> 369
    //   527: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   530: ldc 207
    //   532: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   535: aload 25
    //   537: areturn
    //   538: new 209\011retrofit/ResponseWrapper
    //   541: dup
    //   542: aload 16
    //   544: aload 25
    //   546: invokespecial 212\011retrofit/ResponseWrapper:<init>\011(Lretrofit/client/Response;Ljava/lang/Object;)V
    //   549: astore 32
    //   551: aload_2
    //   552: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   555: ifne +11 -> 566
    //   558: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   561: ldc 207
    //   563: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   566: aload 32
    //   568: areturn
    //   569: astore 28
    //   571: aload 27
    //   573: invokevirtual 230\011retrofit/ExceptionCatchingTypedInput:threwException\011()Z
    //   576: ifeq +34 -> 610
    //   579: aload 27
    //   581: invokevirtual 234\011retrofit/ExceptionCatchingTypedInput:getThrownException\011()Ljava/io/IOException;
    //   584: athrow
    //   585: astore 8
    //   587: aload 8
    //   589: athrow
    //   590: astore 6
    //   592: aload_2
    //   593: getfield 81\011retrofit/RestMethodInfo:isSynchronous\011Z
    //   596: ifne +11 -> 607
    //   599: invokestatic 87\011java/lang/Thread:currentThread\011()Ljava/lang/Thread;
    //   602: ldc 207
    //   604: invokevirtual 113\011java/lang/Thread:setName\011(Ljava/lang/String;)V
    //   607: aload 6
    //   609: athrow
    //   610: aload 16
    //   612: aconst_null
    //   613: invokestatic 238\011retrofit/Utils:replaceResponseBody\011(Lretrofit/client/Response;Lretrofit/mime/TypedInput;)Lretrofit/client/Response;
    //   616: astore 29
    //   618: aload_0
    //   619: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   622: getfield 57\011retrofit/RestAdapter:converter\011Lretrofit/converter/Converter;
    //   625: astore 30
    //   627: aload 4
    //   629: aload 29
    //   631: aload 30
    //   633: aload 20
    //   635: aload 28
    //   637: invokestatic 242\011retrofit/RetrofitError:conversionError\011(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;Lretrofit/converter/ConversionException;)Lretrofit/RetrofitError;
    //   640: athrow
    //   641: astore 7
    //   643: aload_0
    //   644: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   647: getfield 117\011retrofit/RestAdapter:logLevel\011Lretrofit/RestAdapter$LogLevel;
    //   650: invokevirtual 123\011retrofit/RestAdapter$LogLevel:log\011()Z
    //   653: ifeq +14 -> 667
    //   656: aload_0
    //   657: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   660: aload 7
    //   662: aload 4
    //   664: invokevirtual 246\011retrofit/RestAdapter:logException\011(Ljava/lang/Throwable;Ljava/lang/String;)V
    //   667: aload 4
    //   669: aload 7
    //   671: invokestatic 250\011retrofit/RetrofitError:networkError\011(Ljava/lang/String;Ljava/io/IOException;)Lretrofit/RetrofitError;
    //   674: athrow
    //   675: aload 16
    //   677: invokestatic 205\011retrofit/Utils:readBodyToBytesIfNecessary\011(Lretrofit/client/Response;)Lretrofit/client/Response;
    //   680: astore 21
    //   682: aload_0
    //   683: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   686: getfield 57\011retrofit/RestAdapter:converter\011Lretrofit/converter/Converter;
    //   689: astore 22
    //   691: aload 4
    //   693: aload 21
    //   695: aload 22
    //   697: aload 20
    //   699: invokestatic 254\011retrofit/RetrofitError:httpError\011(Ljava/lang/String;Lretrofit/client/Response;Lretrofit/converter/Converter;Ljava/lang/reflect/Type;)Lretrofit/RetrofitError;
    //   702: athrow
    //   703: astore 5
    //   705: aload_0
    //   706: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   709: getfield 117\011retrofit/RestAdapter:logLevel\011Lretrofit/RestAdapter$LogLevel;
    //   712: invokevirtual 123\011retrofit/RestAdapter$LogLevel:log\011()Z
    //   715: ifeq +14 -> 729
    //   718: aload_0
    //   719: getfield 15\011retrofit/RestAdapter$RestHandler:this$0\011Lretrofit/RestAdapter;
    //   722: aload 5
    //   724: aload 4
    //   726: invokevirtual 246\011retrofit/RestAdapter:logException\011(Ljava/lang/Throwable;Ljava/lang/String;)V
    //   729: aload 4
    //   731: aload 5
    //   733: invokestatic 258\011retrofit/RetrofitError:unexpectedError\011(Ljava/lang/String;Ljava/lang/Throwable;)Lretrofit/RetrofitError;
    //   736: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   491\011515\011569\011retrofit/converter/ConversionException
    //   538\011551\011569\011retrofit/converter/ConversionException
    //   3\011121\011585\011retrofit/RetrofitError
    //   121\011147\011585\011retrofit/RetrofitError
    //   147\011156\011585\011retrofit/RetrofitError
    //   164\011178\011585\011retrofit/RetrofitError
    //   178\011265\011585\011retrofit/RetrofitError
    //   265\011293\011585\011retrofit/RetrofitError
    //   293\011299\011585\011retrofit/RetrofitError
    //   315\011339\011585\011retrofit/RetrofitError
    //   339\011345\011585\011retrofit/RetrofitError
    //   372\011385\011585\011retrofit/RetrofitError
    //   403\011410\011585\011retrofit/RetrofitError
    //   415\011421\011585\011retrofit/RetrofitError
    //   450\011462\011585\011retrofit/RetrofitError
    //   480\011491\011585\011retrofit/RetrofitError
    //   491\011515\011585\011retrofit/RetrofitError
    //   538\011551\011585\011retrofit/RetrofitError
    //   571\011585\011585\011retrofit/RetrofitError
    //   610\011641\011585\011retrofit/RetrofitError
    //   675\011703\011585\011retrofit/RetrofitError
    //   3\011121\011590\011finally
    //   121\011147\011590\011finally
    //   147\011156\011590\011finally
    //   164\011178\011590\011finally
    //   178\011265\011590\011finally
    //   265\011293\011590\011finally
    //   293\011299\011590\011finally
    //   315\011339\011590\011finally
    //   339\011345\011590\011finally
    //   372\011385\011590\011finally
    //   403\011410\011590\011finally
    //   415\011421\011590\011finally
    //   450\011462\011590\011finally
    //   480\011491\011590\011finally
    //   491\011515\011590\011finally
    //   538\011551\011590\011finally
    //   571\011585\011590\011finally
    //   587\011590\011590\011finally
    //   610\011641\011590\011finally
    //   643\011667\011590\011finally
    //   667\011675\011590\011finally
    //   675\011703\011590\011finally
    //   705\011729\011590\011finally
    //   729\011737\011590\011finally
    //   3\011121\011641\011java/io/IOException
    //   121\011147\011641\011java/io/IOException
    //   147\011156\011641\011java/io/IOException
    //   164\011178\011641\011java/io/IOException
    //   178\011265\011641\011java/io/IOException
    //   265\011293\011641\011java/io/IOException
    //   293\011299\011641\011java/io/IOException
    //   315\011339\011641\011java/io/IOException
    //   339\011345\011641\011java/io/IOException
    //   372\011385\011641\011java/io/IOException
    //   403\011410\011641\011java/io/IOException
    //   415\011421\011641\011java/io/IOException
    //   450\011462\011641\011java/io/IOException
    //   480\011491\011641\011java/io/IOException
    //   491\011515\011641\011java/io/IOException
    //   538\011551\011641\011java/io/IOException
    //   571\011585\011641\011java/io/IOException
    //   610\011641\011641\011java/io/IOException
    //   675\011703\011641\011java/io/IOException
    //   3\011121\011703\011java/lang/Throwable
    //   121\011147\011703\011java/lang/Throwable
    //   147\011156\011703\011java/lang/Throwable
    //   164\011178\011703\011java/lang/Throwable
    //   178\011265\011703\011java/lang/Throwable
    //   265\011293\011703\011java/lang/Throwable
    //   293\011299\011703\011java/lang/Throwable
    //   315\011339\011703\011java/lang/Throwable
    //   339\011345\011703\011java/lang/Throwable
    //   372\011385\011703\011java/lang/Throwable
    //   403\011410\011703\011java/lang/Throwable
    //   415\011421\011703\011java/lang/Throwable
    //   450\011462\011703\011java/lang/Throwable
    //   480\011491\011703\011java/lang/Throwable
    //   491\011515\011703\011java/lang/Throwable
    //   538\011551\011703\011java/lang/Throwable
    //   571\011585\011703\011java/lang/Throwable
    //   610\011641\011703\011java/lang/Throwable
    //   675\011703\011703\011java/lang/Throwable
  }

  public Object invoke(Object paramObject, Method paramMethod, final Object[] paramArrayOfObject)
    throws Throwable
  {
    if (paramMethod.getDeclaringClass() == Object.class)
      return paramMethod.invoke(this, paramArrayOfObject);
    final RestMethodInfo localRestMethodInfo = RestAdapter.getMethodInfo(this.methodDetailsCache, paramMethod);
    if (localRestMethodInfo.isSynchronous)
      try
      {
        Object localObject = invokeRequest(this.this$0.requestInterceptor, localRestMethodInfo, paramArrayOfObject);
        return localObject;
      }
      catch (RetrofitError localRetrofitError)
      {
        Throwable localThrowable = this.this$0.errorHandler.handleError(localRetrofitError);
        if (localThrowable == null)
          throw new IllegalStateException("Error handler returned null for wrapped exception.", localRetrofitError);
        throw localThrowable;
      }
    if ((this.this$0.httpExecutor == null) || (this.this$0.callbackExecutor == null))
      throw new IllegalStateException("Asynchronous invocation requires calling setExecutors.");
    if (localRestMethodInfo.isObservable)
    {
      if (RestAdapter.access$000(this.this$0) == null)
      {
        if (Platform.HAS_RX_JAVA)
          RestAdapter.access$002(this.this$0, new RxSupport(this.this$0.httpExecutor, this.this$0.errorHandler, this.this$0.requestInterceptor));
      }
      else
        return RestAdapter.access$000(this.this$0).createRequestObservable(new RxSupport.Invoker()
        {
          public ResponseWrapper invoke(RequestInterceptor paramAnonymousRequestInterceptor)
          {
            return (ResponseWrapper)RestAdapter.RestHandler.this.invokeRequest(paramAnonymousRequestInterceptor, localRestMethodInfo, paramArrayOfObject);
          }
        });
      throw new IllegalStateException("Observable method found but no RxJava on classpath.");
    }
    final RequestInterceptorTape localRequestInterceptorTape = new RequestInterceptorTape();
    this.this$0.requestInterceptor.intercept(localRequestInterceptorTape);
    Callback localCallback = (Callback)paramArrayOfObject[(-1 + paramArrayOfObject.length)];
    this.this$0.httpExecutor.execute(new CallbackRunnable(localCallback, this.this$0.callbackExecutor, this.this$0.errorHandler)
    {
      public ResponseWrapper obtainResponse()
      {
        return (ResponseWrapper)RestAdapter.RestHandler.this.invokeRequest(localRequestInterceptorTape, localRestMethodInfo, paramArrayOfObject);
      }
    });
    return null;
  }
}