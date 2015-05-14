package com.google.android.gms.internal;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.app.DownloadManager.Request;
import android.content.Context;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.webkit.URLUtil;
import com.google.android.gms.R.string;
import java.util.Map;

@zzgi
public class zzed extends zzeg
{
  private final Context mContext;
  private final Map<String, String> zzsZ;

  public zzed(zzic paramzzic, Map<String, String> paramMap)
  {
    super(paramzzic, "storePicture");
    this.zzsZ = paramMap;
    this.mContext = paramzzic.zzeD();
  }

  public void execute()
  {
    if (this.mContext == null)
    {
      zzH("Activity context is not available");
      return;
    }
    if (!zzab.zzaM().zzx(this.mContext).zzbR())
    {
      zzH("Feature is not supported by the device.");
      return;
    }
    String str1 = (String)this.zzsZ.get("iurl");
    if (TextUtils.isEmpty(str1))
    {
      zzH("Image url cannot be empty.");
      return;
    }
    if (!URLUtil.isValidUrl(str1))
    {
      zzH("Invalid image url: " + str1);
      return;
    }
    String str2 = zzG(str1);
    if (!zzab.zzaM().zzU(str2))
    {
      zzH("Image type not recognized: " + str2);
      return;
    }
    AlertDialog.Builder localBuilder = zzab.zzaM().zzw(this.mContext);
    localBuilder.setTitle(zzab.zzaP().zzc(R.string.store_picture_title, "Save image"));
    localBuilder.setMessage(zzab.zzaP().zzc(R.string.store_picture_message, "Allow Ad to store image in Picture gallery?"));
    localBuilder.setPositiveButton(zzab.zzaP().zzc(R.string.accept, "Accept"), new zzed.1(this, str1, str2));
    localBuilder.setNegativeButton(zzab.zzaP().zzc(R.string.decline, "Decline"), new zzed.2(this));
    localBuilder.create().show();
  }

  String zzG(String paramString)
  {
    return Uri.parse(paramString).getLastPathSegment();
  }

  DownloadManager.Request zzf(String paramString1, String paramString2)
  {
    DownloadManager.Request localRequest = new DownloadManager.Request(Uri.parse(paramString1));
    localRequest.setDestinationInExternalPublicDir(Environment.DIRECTORY_PICTURES, paramString2);
    zzab.zzaO().zza(localRequest);
    return localRequest;
  }
}