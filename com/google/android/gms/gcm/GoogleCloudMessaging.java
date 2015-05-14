package com.google.android.gms.gcm;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.util.Log;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GoogleCloudMessaging
{
  public static final String ERROR_MAIN_THREAD = "MAIN_THREAD";
  public static final String ERROR_SERVICE_NOT_AVAILABLE = "SERVICE_NOT_AVAILABLE";
  public static final String MESSAGE_TYPE_DELETED = "deleted_messages";
  public static final String MESSAGE_TYPE_MESSAGE = "gcm";
  public static final String MESSAGE_TYPE_SEND_ERROR = "send_error";
  public static final String REGISTRATION_ID = "registration_id";
  private static String zzakT = null;
  public static int zzakU = 5000000;
  public static int zzakV = 6500000;
  public static int zzakW = 7000000;
  static GoogleCloudMessaging zzakX;
  private static final AtomicInteger zzala = new AtomicInteger(1);
  private PendingIntent zzakY;
  private Map<String, Handler> zzakZ = Collections.synchronizedMap(new HashMap());
  private final BlockingQueue<Intent> zzalb = new LinkedBlockingQueue();
  final Messenger zzalc = new Messenger(new Handler(Looper.getMainLooper())
  {
    public void handleMessage(Message paramAnonymousMessage)
    {
      if ((paramAnonymousMessage == null) || (!(paramAnonymousMessage.obj instanceof Intent)))
        Log.w("GCM", "Dropping invalid message");
      Intent localIntent = (Intent)paramAnonymousMessage.obj;
      if ("com.google.android.c2dm.intent.REGISTRATION".equals(localIntent.getAction()))
        GoogleCloudMessaging.zza(GoogleCloudMessaging.this).add(localIntent);
      while (GoogleCloudMessaging.zza(GoogleCloudMessaging.this, localIntent))
        return;
      localIntent.setPackage(GoogleCloudMessaging.zzb(GoogleCloudMessaging.this).getPackageName());
      GoogleCloudMessaging.zzb(GoogleCloudMessaging.this).sendBroadcast(localIntent);
    }
  });
  private Context zzlN;

  public static GoogleCloudMessaging getInstance(Context paramContext)
  {
    try
    {
      if (zzakX == null)
      {
        zzakX = new GoogleCloudMessaging();
        zzakX.zzlN = paramContext.getApplicationContext();
      }
      GoogleCloudMessaging localGoogleCloudMessaging = zzakX;
      return localGoogleCloudMessaging;
    }
    finally
    {
    }
  }

  public static String zzZ(Context paramContext)
  {
    if (zzakT == null)
      zzakT = "com.google.android.gms";
    return zzakT;
  }

  private String zza(Intent paramIntent, String paramString)
    throws IOException
  {
    if (paramIntent == null)
      throw new IOException("SERVICE_NOT_AVAILABLE");
    String str1 = paramIntent.getStringExtra(paramString);
    if (str1 != null)
      return str1;
    String str2 = paramIntent.getStringExtra("error");
    if (str2 != null)
      throw new IOException(str2);
    throw new IOException("SERVICE_NOT_AVAILABLE");
  }

  private void zza(String paramString1, String paramString2, long paramLong, int paramInt, Bundle paramBundle)
    throws IOException
  {
    if (paramString1 == null)
      throw new IllegalArgumentException("Missing 'to'");
    Intent localIntent = new Intent("com.google.android.gcm.intent.SEND");
    if (paramBundle != null)
      localIntent.putExtras(paramBundle);
    zzk(localIntent);
    localIntent.setPackage(zzZ(this.zzlN));
    localIntent.putExtra("google.to", paramString1);
    localIntent.putExtra("google.message_id", paramString2);
    localIntent.putExtra("google.ttl", Long.toString(paramLong));
    localIntent.putExtra("google.delay", Integer.toString(paramInt));
    this.zzlN.sendOrderedBroadcast(localIntent, "com.google.android.gtalkservice.permission.GTALK_SERVICE");
  }

  public static int zzaa(Context paramContext)
  {
    PackageManager localPackageManager = paramContext.getPackageManager();
    try
    {
      int i = localPackageManager.getPackageInfo(zzZ(paramContext), 0).versionCode;
      return i;
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
    }
    return -1;
  }

  private boolean zzj(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("In-Reply-To");
    if ((str == null) && (paramIntent.hasExtra("error")))
      str = paramIntent.getStringExtra("google.message_id");
    if (str != null)
    {
      Handler localHandler = (Handler)this.zzakZ.remove(str);
      if (localHandler != null)
      {
        Message localMessage = Message.obtain();
        localMessage.obj = paramIntent;
        return localHandler.sendMessage(localMessage);
      }
    }
    return false;
  }

  private String zzpd()
  {
    return "google.rpc" + String.valueOf(zzala.getAndIncrement());
  }

  private Intent zzt(Bundle paramBundle)
    throws IOException
  {
    if (Looper.getMainLooper() == Looper.myLooper())
      throw new IOException("MAIN_THREAD");
    if (zzaa(this.zzlN) < 0)
      throw new IOException("Google Play Services missing");
    if (paramBundle == null)
      paramBundle = new Bundle();
    Intent localIntent1 = new Intent("com.google.android.c2dm.intent.REGISTER");
    localIntent1.setPackage(zzZ(this.zzlN));
    zzk(localIntent1);
    localIntent1.putExtra("google.message_id", zzpd());
    localIntent1.putExtras(paramBundle);
    localIntent1.putExtra("google.messenger", this.zzalc);
    this.zzlN.startService(localIntent1);
    try
    {
      Intent localIntent2 = (Intent)this.zzalb.poll(30000L, TimeUnit.MILLISECONDS);
      return localIntent2;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new IOException(localInterruptedException.getMessage());
    }
  }

  public void close()
  {
    zzpe();
  }

  public String getMessageType(Intent paramIntent)
  {
    String str;
    if (!"com.google.android.c2dm.intent.RECEIVE".equals(paramIntent.getAction()))
      str = null;
    do
    {
      return str;
      str = paramIntent.getStringExtra("message_type");
    }
    while (str != null);
    return "gcm";
  }

  public String register(String[] paramArrayOfString)
    throws IOException
  {
    try
    {
      String str1 = zzd(paramArrayOfString);
      Bundle localBundle = new Bundle();
      localBundle.putString("sender", str1);
      String str2 = zza(zzt(localBundle), "registration_id");
      return str2;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void send(String paramString1, String paramString2, long paramLong, Bundle paramBundle)
    throws IOException
  {
    zza(paramString1, paramString2, paramLong, -1, paramBundle);
  }

  public void send(String paramString1, String paramString2, Bundle paramBundle)
    throws IOException
  {
    send(paramString1, paramString2, -1L, paramBundle);
  }

  public void unregister()
    throws IOException
  {
    try
    {
      if (Looper.getMainLooper() == Looper.myLooper())
        throw new IOException("MAIN_THREAD");
    }
    finally
    {
    }
    Intent localIntent1 = new Intent("com.google.android.c2dm.intent.UNREGISTER");
    localIntent1.setPackage(zzZ(this.zzlN));
    localIntent1.putExtra("google.messenger", this.zzalc);
    zzk(localIntent1);
    this.zzlN.startService(localIntent1);
    try
    {
      Intent localIntent2 = (Intent)this.zzalb.poll(30000L, TimeUnit.MILLISECONDS);
      zza(localIntent2, "unregistered");
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new IOException(localInterruptedException.getMessage());
    }
  }

  String zzd(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0))
      throw new IllegalArgumentException("No senderIds");
    StringBuilder localStringBuilder = new StringBuilder(paramArrayOfString[0]);
    for (int i = 1; i < paramArrayOfString.length; i++)
      localStringBuilder.append(',').append(paramArrayOfString[i]);
    return localStringBuilder.toString();
  }

  void zzk(Intent paramIntent)
  {
    try
    {
      if (this.zzakY == null)
      {
        Intent localIntent = new Intent();
        localIntent.setPackage("com.google.example.invalidpackage");
        this.zzakY = PendingIntent.getBroadcast(this.zzlN, 0, localIntent, 0);
      }
      paramIntent.putExtra("app", this.zzakY);
      return;
    }
    finally
    {
    }
  }

  void zzpe()
  {
    try
    {
      if (this.zzakY != null)
      {
        this.zzakY.cancel();
        this.zzakY = null;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}