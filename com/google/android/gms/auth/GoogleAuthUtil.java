package com.google.android.gms.auth;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzjo;
import java.io.IOException;
import java.net.URISyntaxException;

public final class GoogleAuthUtil
{
  public static final int CHANGE_TYPE_ACCOUNT_ADDED = 1;
  public static final int CHANGE_TYPE_ACCOUNT_REMOVED = 2;
  public static final int CHANGE_TYPE_ACCOUNT_RENAMED_FROM = 3;
  public static final int CHANGE_TYPE_ACCOUNT_RENAMED_TO = 4;
  public static final String GOOGLE_ACCOUNT_TYPE = "com.google";
  public static final String KEY_ANDROID_PACKAGE_NAME;
  public static final String KEY_CALLER_UID;
  public static final String KEY_REQUEST_ACTIONS = "request_visible_actions";

  @Deprecated
  public static final String KEY_REQUEST_VISIBLE_ACTIVITIES = "request_visible_actions";
  public static final String KEY_SUPPRESS_PROGRESS_SCREEN = "suppressProgressScreen";
  private static final ComponentName zzHk;
  private static final ComponentName zzHl;

  static
  {
    String str1;
    if (Build.VERSION.SDK_INT >= 11)
    {
      str1 = "callerUid";
      KEY_CALLER_UID = str1;
      if (Build.VERSION.SDK_INT < 14)
        break label65;
    }
    label65: for (String str2 = "androidPackageName"; ; str2 = "androidPackageName")
    {
      KEY_ANDROID_PACKAGE_NAME = str2;
      zzHk = new ComponentName("com.google.android.gms", "com.google.android.gms.auth.GetToken");
      zzHl = new ComponentName("com.google.android.gms", "com.google.android.gms.recovery.RecoveryService");
      return;
      str1 = "callerUid";
      break;
    }
  }

  // ERROR //
  public static void clearToken(Context paramContext, String paramString)
    throws GooglePlayServicesAvailabilityException, GoogleAuthException, IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 81\011android/content/Context:getApplicationContext\011()Landroid/content/Context;
    //   4: astore_2
    //   5: ldc 83
    //   7: invokestatic 89\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   10: aload_2
    //   11: invokestatic 93\011com/google/android/gms/auth/GoogleAuthUtil:zzI\011(Landroid/content/Context;)V
    //   14: new 95\011android/os/Bundle
    //   17: dup
    //   18: invokespecial 96\011android/os/Bundle:<init>\011()V
    //   21: astore_3
    //   22: aload_0
    //   23: invokevirtual 100\011android/content/Context:getApplicationInfo\011()Landroid/content/pm/ApplicationInfo;
    //   26: getfield 105\011android/content/pm/ApplicationInfo:packageName\011Ljava/lang/String;
    //   29: astore 4
    //   31: aload_3
    //   32: ldc 107
    //   34: aload 4
    //   36: invokevirtual 110\011android/os/Bundle:putString\011(Ljava/lang/String;Ljava/lang/String;)V
    //   39: aload_3
    //   40: getstatic 45\011com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME\011Ljava/lang/String;
    //   43: invokevirtual 114\011android/os/Bundle:containsKey\011(Ljava/lang/String;)Z
    //   46: ifne +12 -> 58
    //   49: aload_3
    //   50: getstatic 45\011com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME\011Ljava/lang/String;
    //   53: aload 4
    //   55: invokevirtual 110\011android/os/Bundle:putString\011(Ljava/lang/String;Ljava/lang/String;)V
    //   58: new 116\011com/google/android/gms/common/zza
    //   61: dup
    //   62: invokespecial 117\011com/google/android/gms/common/zza:<init>\011()V
    //   65: astore 5
    //   67: aload_2
    //   68: invokestatic 123\011com/google/android/gms/common/internal/zzm:zzP\011(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzm;
    //   71: astore 6
    //   73: aload 6
    //   75: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   78: aload 5
    //   80: ldc 125
    //   82: invokevirtual 129\011com/google/android/gms/common/internal/zzm:zza\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)Z
    //   85: ifeq +114 -> 199
    //   88: aload 5
    //   90: invokevirtual 133\011com/google/android/gms/common/zza:zzhJ\011()Landroid/os/IBinder;
    //   93: invokestatic 138\011com/google/android/gms/internal/zzr$zza:zza\011(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzr;
    //   96: aload_1
    //   97: aload_3
    //   98: invokeinterface 143 3 0
    //   103: astore 11
    //   105: aload 11
    //   107: getstatic 148\011com/google/android/gms/internal/zzjo:zzIi\011Ljava/lang/String;
    //   110: invokevirtual 152\011android/os/Bundle:getString\011(Ljava/lang/String;)Ljava/lang/String;
    //   113: astore 12
    //   115: aload 11
    //   117: ldc 154
    //   119: invokevirtual 157\011android/os/Bundle:getBoolean\011(Ljava/lang/String;)Z
    //   122: ifne +52 -> 174
    //   125: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   128: dup
    //   129: aload 12
    //   131: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   134: athrow
    //   135: astore 9
    //   137: ldc 125
    //   139: ldc 161
    //   141: aload 9
    //   143: invokestatic 167\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   146: pop
    //   147: new 71\011java/io/IOException
    //   150: dup
    //   151: ldc 169
    //   153: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   156: athrow
    //   157: astore 8
    //   159: aload 6
    //   161: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   164: aload 5
    //   166: ldc 125
    //   168: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   171: aload 8
    //   173: athrow
    //   174: aload 6
    //   176: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   179: aload 5
    //   181: ldc 125
    //   183: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   186: return
    //   187: astore 7
    //   189: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   192: dup
    //   193: ldc 176
    //   195: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   198: athrow
    //   199: new 71\011java/io/IOException
    //   202: dup
    //   203: ldc 178
    //   205: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   208: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   88\011135\011135\011android/os/RemoteException
    //   88\011135\011157\011finally
    //   137\011157\011157\011finally
    //   189\011199\011157\011finally
    //   88\011135\011187\011java/lang/InterruptedException
  }

  // ERROR //
  public static java.util.List<AccountChangeEvent> getAccountChangeEvents(Context paramContext, int paramInt, String paramString)
    throws GoogleAuthException, IOException
  {
    // Byte code:
    //   0: aload_2
    //   1: ldc 182
    //   3: invokestatic 185\011com/google/android/gms/common/internal/zzx:zzb\011(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
    //   6: pop
    //   7: ldc 83
    //   9: invokestatic 89\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   12: aload_0
    //   13: invokevirtual 81\011android/content/Context:getApplicationContext\011()Landroid/content/Context;
    //   16: astore 4
    //   18: aload 4
    //   20: invokestatic 93\011com/google/android/gms/auth/GoogleAuthUtil:zzI\011(Landroid/content/Context;)V
    //   23: new 116\011com/google/android/gms/common/zza
    //   26: dup
    //   27: invokespecial 117\011com/google/android/gms/common/zza:<init>\011()V
    //   30: astore 5
    //   32: aload 4
    //   34: invokestatic 123\011com/google/android/gms/common/internal/zzm:zzP\011(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzm;
    //   37: astore 6
    //   39: aload 6
    //   41: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   44: aload 5
    //   46: ldc 125
    //   48: invokevirtual 129\011com/google/android/gms/common/internal/zzm:zza\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)Z
    //   51: ifeq +102 -> 153
    //   54: aload 5
    //   56: invokevirtual 133\011com/google/android/gms/common/zza:zzhJ\011()Landroid/os/IBinder;
    //   59: invokestatic 138\011com/google/android/gms/internal/zzr$zza:zza\011(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzr;
    //   62: new 187\011com/google/android/gms/auth/AccountChangeEventsRequest
    //   65: dup
    //   66: invokespecial 188\011com/google/android/gms/auth/AccountChangeEventsRequest:<init>\011()V
    //   69: aload_2
    //   70: invokevirtual 192\011com/google/android/gms/auth/AccountChangeEventsRequest:setAccountName\011(Ljava/lang/String;)Lcom/google/android/gms/auth/AccountChangeEventsRequest;
    //   73: iload_1
    //   74: invokevirtual 196\011com/google/android/gms/auth/AccountChangeEventsRequest:setEventIndex\011(I)Lcom/google/android/gms/auth/AccountChangeEventsRequest;
    //   77: invokeinterface 199 2 0
    //   82: invokevirtual 205\011com/google/android/gms/auth/AccountChangeEventsResponse:getEvents\011()Ljava/util/List;
    //   85: astore 11
    //   87: aload 6
    //   89: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   92: aload 5
    //   94: ldc 125
    //   96: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   99: aload 11
    //   101: areturn
    //   102: astore 9
    //   104: ldc 125
    //   106: ldc 161
    //   108: aload 9
    //   110: invokestatic 167\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   113: pop
    //   114: new 71\011java/io/IOException
    //   117: dup
    //   118: ldc 169
    //   120: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   123: athrow
    //   124: astore 8
    //   126: aload 6
    //   128: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   131: aload 5
    //   133: ldc 125
    //   135: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   138: aload 8
    //   140: athrow
    //   141: astore 7
    //   143: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   146: dup
    //   147: ldc 176
    //   149: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   152: athrow
    //   153: new 71\011java/io/IOException
    //   156: dup
    //   157: ldc 178
    //   159: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   162: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   54\01187\011102\011android/os/RemoteException
    //   54\01187\011124\011finally
    //   104\011124\011124\011finally
    //   143\011153\011124\011finally
    //   54\01187\011141\011java/lang/InterruptedException
  }

  public static String getAccountId(Context paramContext, String paramString)
    throws GoogleAuthException, IOException
  {
    zzx.zzb(paramString, "accountName must be provided");
    zzx.zzbe("Calling this from your main thread can lead to deadlock");
    zzI(paramContext.getApplicationContext());
    return getToken(paramContext, paramString, "^^_account_id_^^", new Bundle());
  }

  public static String getToken(Context paramContext, Account paramAccount, String paramString)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    return getToken(paramContext, paramAccount, paramString, new Bundle());
  }

  public static String getToken(Context paramContext, Account paramAccount, String paramString, Bundle paramBundle)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    return zza(paramContext, paramAccount, paramString, paramBundle, null);
  }

  @Deprecated
  public static String getToken(Context paramContext, String paramString1, String paramString2)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    return getToken(paramContext, new Account(paramString1, "com.google"), paramString2);
  }

  @Deprecated
  public static String getToken(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    return getToken(paramContext, new Account(paramString1, "com.google"), paramString2, paramBundle);
  }

  public static String getTokenWithNotification(Context paramContext, Account paramAccount, String paramString, Bundle paramBundle)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    if (paramBundle == null)
      paramBundle = new Bundle();
    paramBundle.putBoolean("handle_notification", true);
    return zza(paramContext, paramAccount, paramString, paramBundle);
  }

  public static String getTokenWithNotification(Context paramContext, Account paramAccount, String paramString, Bundle paramBundle, Intent paramIntent)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    zzh(paramIntent);
    if (paramBundle == null)
      paramBundle = new Bundle();
    paramBundle.putParcelable("callback_intent", paramIntent);
    paramBundle.putBoolean("handle_notification", true);
    return zza(paramContext, paramAccount, paramString, paramBundle);
  }

  public static String getTokenWithNotification(Context paramContext, Account paramAccount, String paramString1, Bundle paramBundle1, String paramString2, Bundle paramBundle2)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    if (TextUtils.isEmpty(paramString2))
      throw new IllegalArgumentException("Authority cannot be empty or null.");
    if (paramBundle1 == null)
      paramBundle1 = new Bundle();
    if (paramBundle2 == null)
      paramBundle2 = new Bundle();
    ContentResolver.validateSyncExtrasBundle(paramBundle2);
    paramBundle1.putString("authority", paramString2);
    paramBundle1.putBundle("sync_extras", paramBundle2);
    paramBundle1.putBoolean("handle_notification", true);
    return zza(paramContext, paramAccount, paramString1, paramBundle1);
  }

  @Deprecated
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    return getTokenWithNotification(paramContext, new Account(paramString1, "com.google"), paramString2, paramBundle);
  }

  @Deprecated
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle, Intent paramIntent)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    return getTokenWithNotification(paramContext, new Account(paramString1, "com.google"), paramString2, paramBundle, paramIntent);
  }

  @Deprecated
  public static String getTokenWithNotification(Context paramContext, String paramString1, String paramString2, Bundle paramBundle1, String paramString3, Bundle paramBundle2)
    throws IOException, UserRecoverableNotifiedException, GoogleAuthException
  {
    return getTokenWithNotification(paramContext, new Account(paramString1, "com.google"), paramString2, paramBundle1, paramString3, paramBundle2);
  }

  @Deprecated
  public static void invalidateToken(Context paramContext, String paramString)
  {
    AccountManager.get(paramContext).invalidateAuthToken("com.google", paramString);
  }

  private static void zzI(Context paramContext)
    throws GoogleAuthException
  {
    try
    {
      GooglePlayServicesUtil.zzI(paramContext);
      return;
    }
    catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
    {
      throw new GooglePlayServicesAvailabilityException(localGooglePlayServicesRepairableException.getConnectionStatusCode(), localGooglePlayServicesRepairableException.getMessage(), localGooglePlayServicesRepairableException.getIntent());
    }
    catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
    {
      throw new GoogleAuthException(localGooglePlayServicesNotAvailableException.getMessage());
    }
  }

  private static String zza(Context paramContext, Account paramAccount, String paramString, Bundle paramBundle)
    throws IOException, GoogleAuthException
  {
    if (paramBundle == null)
      paramBundle = new Bundle();
    try
    {
      String str = getToken(paramContext, paramAccount, paramString, paramBundle);
      return str;
    }
    catch (GooglePlayServicesAvailabilityException localGooglePlayServicesAvailabilityException)
    {
      GooglePlayServicesUtil.showErrorNotification(localGooglePlayServicesAvailabilityException.getConnectionStatusCode(), paramContext);
      throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
    }
    catch (UserRecoverableAuthException localUserRecoverableAuthException)
    {
    }
    throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
  }

  // ERROR //
  public static String zza(Context paramContext, Account paramAccount, String paramString, Bundle paramBundle, java.lang.Boolean paramBoolean)
    throws IOException, UserRecoverableAuthException, GoogleAuthException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 81\011android/content/Context:getApplicationContext\011()Landroid/content/Context;
    //   4: astore 5
    //   6: ldc 83
    //   8: invokestatic 89\011com/google/android/gms/common/internal/zzx:zzbe\011(Ljava/lang/String;)V
    //   11: aload 5
    //   13: invokestatic 93\011com/google/android/gms/auth/GoogleAuthUtil:zzI\011(Landroid/content/Context;)V
    //   16: aload_3
    //   17: ifnonnull +183 -> 200
    //   20: new 95\011android/os/Bundle
    //   23: dup
    //   24: invokespecial 96\011android/os/Bundle:<init>\011()V
    //   27: astore 6
    //   29: aload_0
    //   30: invokevirtual 100\011android/content/Context:getApplicationInfo\011()Landroid/content/pm/ApplicationInfo;
    //   33: getfield 105\011android/content/pm/ApplicationInfo:packageName\011Ljava/lang/String;
    //   36: astore 7
    //   38: aload 6
    //   40: ldc 107
    //   42: aload 7
    //   44: invokevirtual 110\011android/os/Bundle:putString\011(Ljava/lang/String;Ljava/lang/String;)V
    //   47: aload 6
    //   49: getstatic 45\011com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME\011Ljava/lang/String;
    //   52: invokevirtual 114\011android/os/Bundle:containsKey\011(Ljava/lang/String;)Z
    //   55: ifne +13 -> 68
    //   58: aload 6
    //   60: getstatic 45\011com/google/android/gms/auth/GoogleAuthUtil:KEY_ANDROID_PACKAGE_NAME\011Ljava/lang/String;
    //   63: aload 7
    //   65: invokevirtual 110\011android/os/Bundle:putString\011(Ljava/lang/String;Ljava/lang/String;)V
    //   68: aload 4
    //   70: ifnull +16 -> 86
    //   73: aload 6
    //   75: ldc_w 327
    //   78: aload 4
    //   80: invokevirtual 333\011java/lang/Boolean:booleanValue\011()Z
    //   83: invokevirtual 237\011android/os/Bundle:putBoolean\011(Ljava/lang/String;Z)V
    //   86: new 116\011com/google/android/gms/common/zza
    //   89: dup
    //   90: invokespecial 117\011com/google/android/gms/common/zza:<init>\011()V
    //   93: astore 8
    //   95: aload 5
    //   97: invokestatic 123\011com/google/android/gms/common/internal/zzm:zzP\011(Landroid/content/Context;)Lcom/google/android/gms/common/internal/zzm;
    //   100: astore 9
    //   102: aload 9
    //   104: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   107: aload 8
    //   109: ldc 125
    //   111: invokevirtual 129\011com/google/android/gms/common/internal/zzm:zza\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)Z
    //   114: ifeq +219 -> 333
    //   117: aload 8
    //   119: invokevirtual 133\011com/google/android/gms/common/zza:zzhJ\011()Landroid/os/IBinder;
    //   122: invokestatic 138\011com/google/android/gms/internal/zzr$zza:zza\011(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzr;
    //   125: aload_1
    //   126: aload_2
    //   127: aload 6
    //   129: invokeinterface 336 4 0
    //   134: astore 14
    //   136: aload 14
    //   138: ifnonnull +75 -> 213
    //   141: ldc 125
    //   143: ldc_w 338
    //   146: invokestatic 342\011android/util/Log:w\011(Ljava/lang/String;Ljava/lang/String;)I
    //   149: pop
    //   150: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   153: dup
    //   154: ldc_w 344
    //   157: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   160: athrow
    //   161: astore 12
    //   163: ldc 125
    //   165: ldc 161
    //   167: aload 12
    //   169: invokestatic 167\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   172: pop
    //   173: new 71\011java/io/IOException
    //   176: dup
    //   177: ldc 169
    //   179: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   182: athrow
    //   183: astore 11
    //   185: aload 9
    //   187: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   190: aload 8
    //   192: ldc 125
    //   194: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   197: aload 11
    //   199: athrow
    //   200: new 95\011android/os/Bundle
    //   203: dup
    //   204: aload_3
    //   205: invokespecial 346\011android/os/Bundle:<init>\011(Landroid/os/Bundle;)V
    //   208: astore 6
    //   210: goto -181 -> 29
    //   213: aload 14
    //   215: ldc_w 348
    //   218: invokevirtual 152\011android/os/Bundle:getString\011(Ljava/lang/String;)Ljava/lang/String;
    //   221: astore 16
    //   223: aload 16
    //   225: invokestatic 257\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   228: istore 17
    //   230: iload 17
    //   232: ifne +18 -> 250
    //   235: aload 9
    //   237: getstatic 57\011com/google/android/gms/auth/GoogleAuthUtil:zzHk\011Landroid/content/ComponentName;
    //   240: aload 8
    //   242: ldc 125
    //   244: invokevirtual 174\011com/google/android/gms/common/internal/zzm:zzb\011(Landroid/content/ComponentName;Landroid/content/ServiceConnection;Ljava/lang/String;)V
    //   247: aload 16
    //   249: areturn
    //   250: aload 14
    //   252: ldc_w 350
    //   255: invokevirtual 152\011android/os/Bundle:getString\011(Ljava/lang/String;)Ljava/lang/String;
    //   258: astore 18
    //   260: aload 14
    //   262: ldc_w 352
    //   265: invokevirtual 356\011android/os/Bundle:getParcelable\011(Ljava/lang/String;)Landroid/os/Parcelable;
    //   268: checkcast 358\011android/content/Intent
    //   271: astore 19
    //   273: aload 18
    //   275: invokestatic 361\011com/google/android/gms/auth/GoogleAuthUtil:zzaD\011(Ljava/lang/String;)Z
    //   278: ifeq +27 -> 305
    //   281: new 216\011com/google/android/gms/auth/UserRecoverableAuthException
    //   284: dup
    //   285: aload 18
    //   287: aload 19
    //   289: invokespecial 364\011com/google/android/gms/auth/UserRecoverableAuthException:<init>\011(Ljava/lang/String;Landroid/content/Intent;)V
    //   292: athrow
    //   293: astore 10
    //   295: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   298: dup
    //   299: ldc 176
    //   301: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   304: athrow
    //   305: aload 18
    //   307: invokestatic 367\011com/google/android/gms/auth/GoogleAuthUtil:zzaC\011(Ljava/lang/String;)Z
    //   310: ifeq +13 -> 323
    //   313: new 71\011java/io/IOException
    //   316: dup
    //   317: aload 18
    //   319: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   322: athrow
    //   323: new 69\011com/google/android/gms/auth/GoogleAuthException
    //   326: dup
    //   327: aload 18
    //   329: invokespecial 159\011com/google/android/gms/auth/GoogleAuthException:<init>\011(Ljava/lang/String;)V
    //   332: athrow
    //   333: new 71\011java/io/IOException
    //   336: dup
    //   337: ldc 178
    //   339: invokespecial 170\011java/io/IOException:<init>\011(Ljava/lang/String;)V
    //   342: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   117\011136\011161\011android/os/RemoteException
    //   141\011161\011161\011android/os/RemoteException
    //   213\011230\011161\011android/os/RemoteException
    //   250\011293\011161\011android/os/RemoteException
    //   305\011323\011161\011android/os/RemoteException
    //   323\011333\011161\011android/os/RemoteException
    //   117\011136\011183\011finally
    //   141\011161\011183\011finally
    //   163\011183\011183\011finally
    //   213\011230\011183\011finally
    //   250\011293\011183\011finally
    //   295\011305\011183\011finally
    //   305\011323\011183\011finally
    //   323\011333\011183\011finally
    //   117\011136\011293\011java/lang/InterruptedException
    //   141\011161\011293\011java/lang/InterruptedException
    //   213\011230\011293\011java/lang/InterruptedException
    //   250\011293\011293\011java/lang/InterruptedException
    //   305\011323\011293\011java/lang/InterruptedException
    //   323\011333\011293\011java/lang/InterruptedException
  }

  private static boolean zzaC(String paramString)
  {
    return ("NetworkError".equals(paramString)) || ("ServiceUnavailable".equals(paramString)) || ("Timeout".equals(paramString));
  }

  private static boolean zzaD(String paramString)
  {
    return ("BadAuthentication".equals(paramString)) || ("CaptchaRequired".equals(paramString)) || ("DeviceManagementRequiredOrSyncDisabled".equals(paramString)) || ("NeedPermission".equals(paramString)) || ("NeedsBrowser".equals(paramString)) || ("UserCancel".equals(paramString)) || ("AppDownloadRequired".equals(paramString)) || (zzjo.zzHG.zzhg().equals(paramString)) || (zzjo.zzHH.zzhg().equals(paramString)) || (zzjo.zzHI.zzhg().equals(paramString)) || (zzjo.zzHJ.zzhg().equals(paramString)) || (zzjo.zzHK.zzhg().equals(paramString)) || (zzjo.zzHL.zzhg().equals(paramString)) || (zzjo.zzHE.zzhg().equals(paramString));
  }

  private static void zzh(Intent paramIntent)
  {
    if (paramIntent == null)
      throw new IllegalArgumentException("Callback cannot be null.");
    String str = paramIntent.toUri(1);
    try
    {
      Intent.parseUri(str, 1);
      return;
    }
    catch (URISyntaxException localURISyntaxException)
    {
    }
    throw new IllegalArgumentException("Parameter callback contains invalid data. It must be serializable using toUri() and parseUri().");
  }
}