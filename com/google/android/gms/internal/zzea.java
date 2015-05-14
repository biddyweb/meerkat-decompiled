package com.google.android.gms.internal;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.Intent;
import android.provider.CalendarContract.Events;
import android.text.TextUtils;
import com.google.android.gms.R.string;
import java.util.Map;

@zzgi
public class zzea extends zzeg
{
  private final Context mContext;
  private final Map<String, String> zzsZ;
  private String zzta;
  private long zztb;
  private long zztc;
  private String zztd;
  private String zzte;

  public zzea(zzic paramzzic, Map<String, String> paramMap)
  {
    super(paramzzic, "createCalendarEvent");
    this.zzsZ = paramMap;
    this.mContext = paramzzic.zzeD();
    zzcM();
  }

  private String zzE(String paramString)
  {
    if (TextUtils.isEmpty((CharSequence)this.zzsZ.get(paramString)))
      return "";
    return (String)this.zzsZ.get(paramString);
  }

  private long zzF(String paramString)
  {
    String str = (String)this.zzsZ.get(paramString);
    if (str == null)
      return -1L;
    try
    {
      long l = Long.parseLong(str);
      return l;
    }
    catch (NumberFormatException localNumberFormatException)
    {
    }
    return -1L;
  }

  private void zzcM()
  {
    this.zzta = zzE("description");
    this.zztd = zzE("summary");
    this.zztb = zzF("start_ticks");
    this.zztc = zzF("end_ticks");
    this.zzte = zzE("location");
  }

  Intent createIntent()
  {
    Intent localIntent = new Intent("android.intent.action.EDIT").setData(CalendarContract.Events.CONTENT_URI);
    localIntent.putExtra("title", this.zzta);
    localIntent.putExtra("eventLocation", this.zzte);
    localIntent.putExtra("description", this.zztd);
    if (this.zztb > -1L)
      localIntent.putExtra("beginTime", this.zztb);
    if (this.zztc > -1L)
      localIntent.putExtra("endTime", this.zztc);
    localIntent.setFlags(268435456);
    return localIntent;
  }

  public void execute()
  {
    if (this.mContext == null)
    {
      zzH("Activity context is not available.");
      return;
    }
    if (!zzab.zzaM().zzx(this.mContext).zzbU())
    {
      zzH("This feature is not available on the device.");
      return;
    }
    AlertDialog.Builder localBuilder = zzab.zzaM().zzw(this.mContext);
    localBuilder.setTitle(zzab.zzaP().zzc(R.string.create_calendar_title, "Create calendar event"));
    localBuilder.setMessage(zzab.zzaP().zzc(R.string.create_calendar_message, "Allow Ad to create a calendar event?"));
    localBuilder.setPositiveButton(zzab.zzaP().zzc(R.string.accept, "Accept"), new zzea.1(this));
    localBuilder.setNegativeButton(zzab.zzaP().zzc(R.string.decline, "Decline"), new zzea.2(this));
    localBuilder.create().show();
  }
}