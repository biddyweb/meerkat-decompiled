package com.mixpanel.android.mpmetrics;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Point;
import android.os.Build.VERSION;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;

class DecideChecker
{
  private static final JSONArray EMPTY_JSON_ARRAY = new JSONArray();
  private static final String LOGTAG = "MixpanelAPI.DecideChecker";
  private final List<DecideMessages> mChecks;
  private final MPConfig mConfig;
  private final Context mContext;

  public DecideChecker(Context paramContext, MPConfig paramMPConfig)
  {
    this.mContext = paramContext;
    this.mConfig = paramMPConfig;
    this.mChecks = new LinkedList();
  }

  private String getDecideResponseFromServer(String paramString1, String paramString2, ServerMessage paramServerMessage)
  {
    byte[] arrayOfByte;
    while (true)
    {
      String str4;
      try
      {
        String str1 = URLEncoder.encode(paramString1, "utf-8");
        String str3;
        if (paramString2 != null)
        {
          String str2 = URLEncoder.encode(paramString2, "utf-8");
          str3 = str2;
          StringBuilder localStringBuilder = new StringBuilder().append("?version=1&lib=android&token=").append(str1);
          if (str3 != null)
            localStringBuilder.append("&distinct_id=").append(str3);
          str4 = localStringBuilder.toString();
          if (this.mConfig.getDisableFallback())
          {
            arrayOfString = new String[1];
            arrayOfString[0] = (this.mConfig.getDecideEndpoint() + str4);
            if (MPConfig.DEBUG)
            {
              Log.v("MixpanelAPI.DecideChecker", "Querying decide server at " + arrayOfString[0]);
              Log.v("MixpanelAPI.DecideChecker", "    (with fallback " + arrayOfString[1] + ")");
            }
            arrayOfByte = paramServerMessage.getUrls(this.mContext, arrayOfString);
            if (arrayOfByte != null)
              break;
            return null;
          }
        }
        else
        {
          str3 = null;
          continue;
        }
      }
      catch (UnsupportedEncodingException localUnsupportedEncodingException1)
      {
        throw new RuntimeException("Mixpanel library requires utf-8 string encoding to be available", localUnsupportedEncodingException1);
      }
      String[] arrayOfString = new String[2];
      arrayOfString[0] = (this.mConfig.getDecideEndpoint() + str4);
      arrayOfString[1] = (this.mConfig.getDecideFallbackEndpoint() + str4);
    }
    try
    {
      String str5 = new String(arrayOfByte, "UTF-8");
      return str5;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException2)
    {
      throw new RuntimeException("UTF not supported on this platform?", localUnsupportedEncodingException2);
    }
  }

  @SuppressLint({"NewApi"})
  private static int getDisplayWidth(Display paramDisplay)
  {
    if (Build.VERSION.SDK_INT < 13)
      return paramDisplay.getWidth();
    Point localPoint = new Point();
    paramDisplay.getSize(localPoint);
    return localPoint.x;
  }

  private static Bitmap getNotificationImage(InAppNotification paramInAppNotification, Context paramContext, ServerMessage paramServerMessage)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = paramInAppNotification.getImage2xUrl();
    int i = getDisplayWidth(((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay());
    if ((paramInAppNotification.getType() == InAppNotification.Type.TAKEOVER) && (i >= 720))
    {
      arrayOfString = new String[2];
      arrayOfString[0] = paramInAppNotification.getImage4xUrl();
      arrayOfString[1] = paramInAppNotification.getImage2xUrl();
    }
    byte[] arrayOfByte = paramServerMessage.getUrls(paramContext, arrayOfString);
    if (arrayOfByte != null)
      return BitmapFactory.decodeByteArray(arrayOfByte, 0, arrayOfByte.length);
    Log.i("MixpanelAPI.DecideChecker", "Failed to download images from " + Arrays.toString(arrayOfString));
    return null;
  }

  // ERROR //
  static Result parseDecideResponse(String paramString)
    throws DecideChecker.UnintelligibleMessageException
  {
    // Byte code:
    //   0: new 207\011com/mixpanel/android/mpmetrics/DecideChecker$Result
    //   3: dup
    //   4: invokespecial 208\011com/mixpanel/android/mpmetrics/DecideChecker$Result:<init>\011()V
    //   7: astore_1
    //   8: new 210\011org/json/JSONObject
    //   11: dup
    //   12: aload_0
    //   13: invokespecial 213\011org/json/JSONObject:<init>\011(Ljava/lang/String;)V
    //   16: astore_2
    //   17: aload_2
    //   18: ldc 215
    //   20: invokevirtual 219\011org/json/JSONObject:has\011(Ljava/lang/String;)Z
    //   23: istore_3
    //   24: aconst_null
    //   25: astore 4
    //   27: iload_3
    //   28: ifeq +15 -> 43
    //   31: aload_2
    //   32: ldc 215
    //   34: invokevirtual 223\011org/json/JSONObject:getJSONArray\011(Ljava/lang/String;)Lorg/json/JSONArray;
    //   37: astore 31
    //   39: aload 31
    //   41: astore 4
    //   43: aload 4
    //   45: ifnull +184 -> 229
    //   48: iconst_0
    //   49: istore 22
    //   51: iload 22
    //   53: aload 4
    //   55: invokevirtual 226\011org/json/JSONArray:length\011()I
    //   58: if_icmpge +171 -> 229
    //   61: new 228\011com/mixpanel/android/mpmetrics/Survey
    //   64: dup
    //   65: aload 4
    //   67: iload 22
    //   69: invokevirtual 232\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
    //   72: invokespecial 235\011com/mixpanel/android/mpmetrics/Survey:<init>\011(Lorg/json/JSONObject;)V
    //   75: astore 23
    //   77: aload_1
    //   78: getfield 237\011com/mixpanel/android/mpmetrics/DecideChecker$Result:surveys\011Ljava/util/List;
    //   81: aload 23
    //   83: invokeinterface 243 2 0
    //   88: pop
    //   89: iinc 22 1
    //   92: goto -41 -> 51
    //   95: astore 32
    //   97: new 199\011com/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException
    //   100: dup
    //   101: new 53\011java/lang/StringBuilder
    //   104: dup
    //   105: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   108: ldc 245
    //   110: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   113: aload_0
    //   114: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   120: aload 32
    //   122: invokespecial 248\011com/mixpanel/android/mpmetrics/DecideChecker$UnintelligibleMessageException:<init>\011(Ljava/lang/String;Lorg/json/JSONException;)V
    //   125: athrow
    //   126: astore 29
    //   128: ldc 10
    //   130: new 53\011java/lang/StringBuilder
    //   133: dup
    //   134: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   137: ldc 250
    //   139: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: aload_2
    //   143: invokevirtual 253\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   146: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   149: invokestatic 256\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   152: pop
    //   153: aconst_null
    //   154: astore 4
    //   156: goto -113 -> 43
    //   159: astore 26
    //   161: ldc 10
    //   163: new 53\011java/lang/StringBuilder
    //   166: dup
    //   167: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   170: ldc_w 258
    //   173: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   176: aload 4
    //   178: invokevirtual 259\011org/json/JSONArray:toString\011()Ljava/lang/String;
    //   181: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   184: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   187: invokestatic 256\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   190: pop
    //   191: goto -102 -> 89
    //   194: astore 24
    //   196: ldc 10
    //   198: new 53\011java/lang/StringBuilder
    //   201: dup
    //   202: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   205: ldc_w 258
    //   208: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   211: aload 4
    //   213: invokevirtual 259\011org/json/JSONArray:toString\011()Ljava/lang/String;
    //   216: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   222: invokestatic 256\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   225: pop
    //   226: goto -137 -> 89
    //   229: aload_2
    //   230: ldc_w 261
    //   233: invokevirtual 219\011org/json/JSONObject:has\011(Ljava/lang/String;)Z
    //   236: istore 5
    //   238: aconst_null
    //   239: astore 6
    //   241: iload 5
    //   243: ifeq +16 -> 259
    //   246: aload_2
    //   247: ldc_w 261
    //   250: invokevirtual 223\011org/json/JSONObject:getJSONArray\011(Ljava/lang/String;)Lorg/json/JSONArray;
    //   253: astore 21
    //   255: aload 21
    //   257: astore 6
    //   259: aload 6
    //   261: ifnull +203 -> 464
    //   264: aload 6
    //   266: invokevirtual 226\011org/json/JSONArray:length\011()I
    //   269: iconst_2
    //   270: invokestatic 267\011java/lang/Math:min\011(II)I
    //   273: istore 9
    //   275: iconst_0
    //   276: istore 10
    //   278: iload 10
    //   280: iload 9
    //   282: if_icmpge +182 -> 464
    //   285: new 147\011com/mixpanel/android/mpmetrics/InAppNotification
    //   288: dup
    //   289: aload 6
    //   291: iload 10
    //   293: invokevirtual 232\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
    //   296: invokespecial 268\011com/mixpanel/android/mpmetrics/InAppNotification:<init>\011(Lorg/json/JSONObject;)V
    //   299: astore 11
    //   301: aload_1
    //   302: getfield 270\011com/mixpanel/android/mpmetrics/DecideChecker$Result:notifications\011Ljava/util/List;
    //   305: aload 11
    //   307: invokeinterface 243 2 0
    //   312: pop
    //   313: iinc 10 1
    //   316: goto -38 -> 278
    //   319: astore 19
    //   321: ldc 10
    //   323: new 53\011java/lang/StringBuilder
    //   326: dup
    //   327: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   330: ldc_w 272
    //   333: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   336: aload_2
    //   337: invokevirtual 253\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   340: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   343: invokestatic 256\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   346: pop
    //   347: aconst_null
    //   348: astore 6
    //   350: goto -91 -> 259
    //   353: astore 16
    //   355: ldc 10
    //   357: new 53\011java/lang/StringBuilder
    //   360: dup
    //   361: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   364: ldc_w 274
    //   367: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   370: aload 6
    //   372: invokevirtual 259\011org/json/JSONArray:toString\011()Ljava/lang/String;
    //   375: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   378: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   381: aload 16
    //   383: invokestatic 277\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   386: pop
    //   387: goto -74 -> 313
    //   390: astore 14
    //   392: ldc 10
    //   394: new 53\011java/lang/StringBuilder
    //   397: dup
    //   398: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   401: ldc_w 274
    //   404: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   407: aload 6
    //   409: invokevirtual 259\011org/json/JSONArray:toString\011()Ljava/lang/String;
    //   412: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   415: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   418: aload 14
    //   420: invokestatic 277\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   423: pop
    //   424: goto -111 -> 313
    //   427: astore 12
    //   429: ldc 10
    //   431: new 53\011java/lang/StringBuilder
    //   434: dup
    //   435: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   438: ldc_w 279
    //   441: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   444: aload 6
    //   446: invokevirtual 259\011org/json/JSONArray:toString\011()Ljava/lang/String;
    //   449: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   452: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   455: aload 12
    //   457: invokestatic 277\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   460: pop
    //   461: goto -148 -> 313
    //   464: aload_2
    //   465: ldc_w 281
    //   468: invokevirtual 219\011org/json/JSONObject:has\011(Ljava/lang/String;)Z
    //   471: ifeq +14 -> 485
    //   474: aload_1
    //   475: aload_2
    //   476: ldc_w 281
    //   479: invokevirtual 223\011org/json/JSONObject:getJSONArray\011(Ljava/lang/String;)Lorg/json/JSONArray;
    //   482: putfield 284\011com/mixpanel/android/mpmetrics/DecideChecker$Result:eventBindings\011Lorg/json/JSONArray;
    //   485: aload_1
    //   486: areturn
    //   487: astore 7
    //   489: ldc 10
    //   491: new 53\011java/lang/StringBuilder
    //   494: dup
    //   495: invokespecial 54\011java/lang/StringBuilder:<init>\011()V
    //   498: ldc_w 286
    //   501: invokevirtual 60\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   504: aload_2
    //   505: invokevirtual 253\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   508: invokevirtual 66\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   511: invokestatic 256\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   514: pop
    //   515: aload_1
    //   516: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   8\01117\01195\011org/json/JSONException
    //   31\01139\011126\011org/json/JSONException
    //   61\01189\011159\011org/json/JSONException
    //   61\01189\011194\011com/mixpanel/android/mpmetrics/BadDecideObjectException
    //   246\011255\011319\011org/json/JSONException
    //   285\011313\011353\011org/json/JSONException
    //   285\011313\011390\011com/mixpanel/android/mpmetrics/BadDecideObjectException
    //   285\011313\011427\011java/lang/OutOfMemoryError
    //   474\011485\011487\011org/json/JSONException
  }

  private Result runDecideCheck(String paramString1, String paramString2, ServerMessage paramServerMessage)
    throws DecideChecker.UnintelligibleMessageException
  {
    String str = getDecideResponseFromServer(paramString1, paramString2, paramServerMessage);
    if (MPConfig.DEBUG)
      Log.v("MixpanelAPI.DecideChecker", "Mixpanel decide server response was:\n" + str);
    Result localResult = new Result();
    if (str != null)
      localResult = parseDecideResponse(str);
    Iterator localIterator = localResult.notifications.iterator();
    while (localIterator.hasNext())
    {
      InAppNotification localInAppNotification = (InAppNotification)localIterator.next();
      Bitmap localBitmap = getNotificationImage(localInAppNotification, this.mContext, paramServerMessage);
      if (localBitmap == null)
      {
        Log.i("MixpanelAPI.DecideChecker", "Could not retrieve image for notification " + localInAppNotification.getId() + ", will not show the notification.");
        localIterator.remove();
      }
      else
      {
        localInAppNotification.setImage(localBitmap);
      }
    }
    return localResult;
  }

  public void addDecideCheck(DecideMessages paramDecideMessages)
  {
    this.mChecks.add(paramDecideMessages);
  }

  public void runDecideChecks(ServerMessage paramServerMessage)
  {
    Iterator localIterator = this.mChecks.iterator();
    while (localIterator.hasNext())
    {
      DecideMessages localDecideMessages = (DecideMessages)localIterator.next();
      String str = localDecideMessages.getDistinctId();
      try
      {
        Result localResult = runDecideCheck(localDecideMessages.getToken(), str, paramServerMessage);
        localDecideMessages.reportResults(localResult.surveys, localResult.notifications, localResult.eventBindings);
      }
      catch (UnintelligibleMessageException localUnintelligibleMessageException)
      {
        Log.e("MixpanelAPI.DecideChecker", localUnintelligibleMessageException.getMessage(), localUnintelligibleMessageException);
      }
    }
  }

  static class Result
  {
    public JSONArray eventBindings = DecideChecker.EMPTY_JSON_ARRAY;
    public final List<InAppNotification> notifications = new ArrayList();
    public final List<Survey> surveys = new ArrayList();
  }

  static class UnintelligibleMessageException extends Exception
  {
    private static final long serialVersionUID = -6501269367559104957L;

    public UnintelligibleMessageException(String paramString, JSONException paramJSONException)
    {
      super(paramJSONException);
    }
  }
}