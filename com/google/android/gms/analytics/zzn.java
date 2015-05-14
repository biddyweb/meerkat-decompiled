package com.google.android.gms.analytics;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.content.res.XmlResourceParser;
import android.text.TextUtils;
import java.io.IOException;
import org.xmlpull.v1.XmlPullParserException;

abstract class zzn<T extends zzm>
{
  Context mContext;
  zza<T> zzBI;

  public zzn(Context paramContext, zza<T> paramzza)
  {
    this.mContext = paramContext;
    this.zzBI = paramzza;
  }

  private T zza(XmlResourceParser paramXmlResourceParser)
  {
    try
    {
      paramXmlResourceParser.next();
      int i = paramXmlResourceParser.getEventType();
      if (i != 1)
      {
        if (paramXmlResourceParser.getEventType() == 2)
        {
          str1 = paramXmlResourceParser.getName().toLowerCase();
          if (!str1.equals("screenname"))
            break label114;
          String str8 = paramXmlResourceParser.getAttributeValue(null, "name");
          String str9 = paramXmlResourceParser.nextText().trim();
          if ((!TextUtils.isEmpty(str8)) && (!TextUtils.isEmpty(str9)))
            this.zzBI.zzi(str8, str9);
        }
        while (true)
        {
          i = paramXmlResourceParser.next();
          break;
          label114: if (!str1.equals("string"))
            break label208;
          String str6 = paramXmlResourceParser.getAttributeValue(null, "name");
          String str7 = paramXmlResourceParser.nextText().trim();
          if ((!TextUtils.isEmpty(str6)) && (str7 != null))
            this.zzBI.zzj(str6, str7);
        }
      }
    }
    catch (XmlPullParserException localXmlPullParserException)
    {
      while (true)
      {
        zzae.zzZ("Error parsing tracker configuration file: " + localXmlPullParserException);
        return this.zzBI.zzfB();
        if (!str1.equals("bool"))
          break;
        String str4 = paramXmlResourceParser.getAttributeValue(null, "name");
        String str5 = paramXmlResourceParser.nextText().trim();
        if (!TextUtils.isEmpty(str4))
        {
          boolean bool2 = TextUtils.isEmpty(str5);
          if (!bool2)
            try
            {
              boolean bool3 = Boolean.parseBoolean(str5);
              this.zzBI.zzd(str4, bool3);
            }
            catch (NumberFormatException localNumberFormatException2)
            {
              zzae.zzZ("Error parsing bool configuration value: " + str5);
            }
        }
      }
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        String str1;
        label208: zzae.zzZ("Error parsing tracker configuration file: " + localIOException);
        continue;
        if (str1.equals("integer"))
        {
          String str2 = paramXmlResourceParser.getAttributeValue(null, "name");
          String str3 = paramXmlResourceParser.nextText().trim();
          if (!TextUtils.isEmpty(str2))
          {
            boolean bool1 = TextUtils.isEmpty(str3);
            if (!bool1)
              try
              {
                int j = Integer.parseInt(str3);
                this.zzBI.zzc(str2, j);
              }
              catch (NumberFormatException localNumberFormatException1)
              {
                zzae.zzZ("Error parsing int configuration value: " + str3);
              }
          }
        }
      }
    }
  }

  public T zzD(int paramInt)
  {
    try
    {
      zzm localzzm = zza(this.mContext.getResources().getXml(paramInt));
      return localzzm;
    }
    catch (Resources.NotFoundException localNotFoundException)
    {
      zzae.zzac("inflate() called with unknown resourceId: " + localNotFoundException);
    }
    return null;
  }

  public static abstract interface zza<U extends zzm>
  {
    public abstract void zzc(String paramString, int paramInt);

    public abstract void zzd(String paramString, boolean paramBoolean);

    public abstract U zzfB();

    public abstract void zzi(String paramString1, String paramString2);

    public abstract void zzj(String paramString1, String paramString2);
  }
}