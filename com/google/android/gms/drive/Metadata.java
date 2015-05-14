package com.google.android.gms.drive;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.drive.metadata.CustomPropertyKey;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.AppVisibleCustomProperties;
import com.google.android.gms.internal.zzmi;
import com.google.android.gms.internal.zzmk;
import com.google.android.gms.internal.zzmm;
import java.util.Collections;
import java.util.Date;
import java.util.Map;

public abstract class Metadata
  implements Freezable<Metadata>
{
  public static final int CONTENT_AVAILABLE_LOCALLY = 1;
  public static final int CONTENT_NOT_AVAILABLE_LOCALLY;

  public String getAlternateLink()
  {
    return (String)zza(zzmi.zzVt);
  }

  public int getContentAvailability()
  {
    Integer localInteger = (Integer)zza(zzmm.zzWk);
    if (localInteger == null)
      return 0;
    return localInteger.intValue();
  }

  public Date getCreatedDate()
  {
    return (Date)zza(zzmk.zzWe);
  }

  public Map<CustomPropertyKey, String> getCustomProperties()
  {
    AppVisibleCustomProperties localAppVisibleCustomProperties = (AppVisibleCustomProperties)zza(zzmi.zzVu);
    if (localAppVisibleCustomProperties == null)
      return Collections.emptyMap();
    return localAppVisibleCustomProperties.zzkV();
  }

  public String getDescription()
  {
    return (String)zza(zzmi.zzVv);
  }

  public DriveId getDriveId()
  {
    return (DriveId)zza(zzmi.zzVs);
  }

  public String getEmbedLink()
  {
    return (String)zza(zzmi.zzVw);
  }

  public String getFileExtension()
  {
    return (String)zza(zzmi.zzVx);
  }

  public long getFileSize()
  {
    return ((Long)zza(zzmi.zzVy)).longValue();
  }

  public Date getLastViewedByMeDate()
  {
    return (Date)zza(zzmk.zzWf);
  }

  public String getMimeType()
  {
    return (String)zza(zzmi.zzVM);
  }

  public Date getModifiedByMeDate()
  {
    return (Date)zza(zzmk.zzWh);
  }

  public Date getModifiedDate()
  {
    return (Date)zza(zzmk.zzWg);
  }

  public String getOriginalFilename()
  {
    return (String)zza(zzmi.zzVN);
  }

  public long getQuotaBytesUsed()
  {
    return ((Long)zza(zzmi.zzVS)).longValue();
  }

  public Date getSharedWithMeDate()
  {
    return (Date)zza(zzmk.zzWi);
  }

  public String getTitle()
  {
    return (String)zza(zzmi.zzVV);
  }

  public String getWebContentLink()
  {
    return (String)zza(zzmi.zzVX);
  }

  public String getWebViewLink()
  {
    return (String)zza(zzmi.zzVY);
  }

  public boolean isEditable()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVD);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isExplicitlyTrashed()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVE);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isFolder()
  {
    return "application/vnd.google-apps.folder".equals(getMimeType());
  }

  public boolean isInAppFolder()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVB);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isPinnable()
  {
    Boolean localBoolean = (Boolean)zza(zzmm.zzWl);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isPinned()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVF);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isRestricted()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVG);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isShared()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVH);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isStarred()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVT);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isTrashable()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVK);
    if (localBoolean == null)
      return true;
    return localBoolean.booleanValue();
  }

  public boolean isTrashed()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVW);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public boolean isViewed()
  {
    Boolean localBoolean = (Boolean)zza(zzmi.zzVL);
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public abstract <T> T zza(MetadataField<T> paramMetadataField);
}