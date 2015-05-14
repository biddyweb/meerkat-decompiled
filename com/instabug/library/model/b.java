package com.instabug.library.model;

import android.graphics.Bitmap;
import android.os.Build.VERSION;
import com.instabug.library.Instabug;
import com.instabug.library.network.c;
import com.instabug.library.network.h;
import com.instabug.library.util.InstabugLogger;
import com.instabug.library.x;
import org.json.JSONException;

public final class b
{
  private static b a;
  private x b;
  private com.instabug.library.a c;
  private com.instabug.library.internal.device.a d;

  private b(x paramx, com.instabug.library.a parama, com.instabug.library.internal.device.a parama1)
  {
    this.b = paramx;
    this.c = parama;
    this.d = parama1;
  }

  public static b a(x paramx, com.instabug.library.a parama, com.instabug.library.internal.device.a parama1)
  {
    if (a == null)
      a = new b(paramx, parama, parama1);
    return a;
  }

  public final a a(String paramString1, String paramString2, Bitmap paramBitmap, int paramInt)
  {
    a locala = new a();
    locala.a(paramInt);
    c localc = new c();
    while (true)
    {
      try
      {
        h localh1 = localc.a("uuid", this.d.j()).a("type", locala.a()).a("token", this.b.b()).a("device", com.instabug.library.internal.device.a.a()).a("os", "SDK Level " + Integer.toString(Build.VERSION.SDK_INT)).a("email", paramString1).a("comment", paramString2).a("carrier", this.d.f()).a("appVersion", this.d.g()).a("batteryLevel", this.d.d()).a("batteryState", this.d.e()).a("createdAt", Long.toString(System.currentTimeMillis() / 1000L));
        if (!this.b.j())
          break label571;
        str1 = "1";
        h localh2 = localh1.a("hasFile", str1);
        String str2;
        if (paramBitmap != null)
        {
          str2 = "1";
          h localh3 = localh2.a("hasScreenshot", str2).a("SDKVersion", "1.3.2").a("wifi", this.d.k()).a("memoryFree", this.d.o()).a("memoryUsed", this.d.m()).a("memoryTotal", this.d.n()).a("storageFree", com.instabug.library.internal.device.a.q()).a("storageUsed", com.instabug.library.internal.device.a.p()).a("storageTotal", com.instabug.library.internal.device.a.r()).a("userData", Instabug.getInstance().getUserData()).a("consoleLog", com.instabug.library.internal.device.a.l()).a("userSteps", this.c.toString()).a("methodsLog", this.b.F().toString()).a("deviceRooted", com.instabug.library.internal.device.a.c());
          long l1 = this.b.a() / 1000L;
          StringBuilder localStringBuilder = new StringBuilder();
          int i = (int)l1 % 60;
          long l2 = l1 / 60L;
          int j = (int)l2 % 60;
          int k = (int)(l2 / 60L) % 60;
          if (k <= 9)
            localStringBuilder.append("0");
          localStringBuilder.append(k);
          localStringBuilder.append(":");
          if (j <= 9)
            localStringBuilder.append("0");
          localStringBuilder.append(j);
          localStringBuilder.append(":");
          if (i <= 9)
            localStringBuilder.append("0");
          localStringBuilder.append(i);
          localh3.a("duration", localStringBuilder.toString()).a("instabugLog", InstabugLogger.getInstabugLog());
          locala.a(localc.b());
          locala.a(paramBitmap);
          if (this.b.j())
          {
            locala.c(this.b.k());
            return locala;
          }
        }
        else
        {
          str2 = "0";
          continue;
        }
      }
      catch (JSONException localJSONException)
      {
        localJSONException.printStackTrace();
      }
      return locala;
      label571: String str1 = "0";
    }
  }
}