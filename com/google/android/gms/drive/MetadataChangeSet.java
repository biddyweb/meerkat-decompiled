package com.google.android.gms.drive;

import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.drive.metadata.CustomPropertyKey;
import com.google.android.gms.drive.metadata.internal.AppVisibleCustomProperties;
import com.google.android.gms.drive.metadata.internal.AppVisibleCustomProperties.zza;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.zzmi;
import com.google.android.gms.internal.zzmk;
import java.util.Collections;
import java.util.Date;
import java.util.Map;

public final class MetadataChangeSet
{
  public static final int CUSTOM_PROPERTY_SIZE_LIMIT_BYTES = 124;
  public static final int INDEXABLE_TEXT_SIZE_LIMIT_BYTES = 131072;
  public static final int MAX_PRIVATE_PROPERTIES_PER_RESOURCE_PER_APP = 30;
  public static final int MAX_PUBLIC_PROPERTIES_PER_RESOURCE = 30;
  public static final int MAX_TOTAL_PROPERTIES_PER_RESOURCE = 100;
  public static final MetadataChangeSet zzSv = new MetadataChangeSet(MetadataBundle.zzkZ());
  private final MetadataBundle zzSw;

  public MetadataChangeSet(MetadataBundle paramMetadataBundle)
  {
    this.zzSw = MetadataBundle.zza(paramMetadataBundle);
  }

  public Map<CustomPropertyKey, String> getCustomPropertyChangeMap()
  {
    AppVisibleCustomProperties localAppVisibleCustomProperties = (AppVisibleCustomProperties)this.zzSw.zza(zzmi.zzVu);
    if (localAppVisibleCustomProperties == null)
      return Collections.emptyMap();
    return localAppVisibleCustomProperties.zzkV();
  }

  public String getDescription()
  {
    return (String)this.zzSw.zza(zzmi.zzVv);
  }

  public String getIndexableText()
  {
    return (String)this.zzSw.zza(zzmi.zzVA);
  }

  public Date getLastViewedByMeDate()
  {
    return (Date)this.zzSw.zza(zzmk.zzWf);
  }

  public String getMimeType()
  {
    return (String)this.zzSw.zza(zzmi.zzVM);
  }

  public String getTitle()
  {
    return (String)this.zzSw.zza(zzmi.zzVV);
  }

  public Boolean isPinned()
  {
    return (Boolean)this.zzSw.zza(zzmi.zzVF);
  }

  public Boolean isStarred()
  {
    return (Boolean)this.zzSw.zza(zzmi.zzVT);
  }

  public Boolean isViewed()
  {
    return (Boolean)this.zzSw.zza(zzmi.zzVL);
  }

  public MetadataBundle zzkx()
  {
    return this.zzSw;
  }

  public static class Builder
  {
    private final MetadataBundle zzSw = MetadataBundle.zzkZ();
    private AppVisibleCustomProperties.zza zzSx;

    private int zzbw(String paramString)
    {
      if (paramString == null)
        return 0;
      return paramString.getBytes().length;
    }

    private String zzi(String paramString, int paramInt1, int paramInt2)
    {
      Object[] arrayOfObject = new Object[3];
      arrayOfObject[0] = paramString;
      arrayOfObject[1] = Integer.valueOf(paramInt1);
      arrayOfObject[2] = Integer.valueOf(paramInt2);
      return String.format("%s must be no more than %d bytes, but is %d bytes.", arrayOfObject);
    }

    private void zzj(String paramString, int paramInt1, int paramInt2)
    {
      if (paramInt2 <= paramInt1);
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, zzi(paramString, paramInt1, paramInt2));
        return;
      }
    }

    private AppVisibleCustomProperties.zza zzky()
    {
      if (this.zzSx == null)
        this.zzSx = new AppVisibleCustomProperties.zza();
      return this.zzSx;
    }

    public MetadataChangeSet build()
    {
      if (this.zzSx != null)
        this.zzSw.zzb(zzmi.zzVu, this.zzSx.zzkW());
      return new MetadataChangeSet(this.zzSw);
    }

    public Builder deleteCustomProperty(CustomPropertyKey paramCustomPropertyKey)
    {
      zzx.zzb(paramCustomPropertyKey, "key");
      zzky().zza(paramCustomPropertyKey, null);
      return this;
    }

    public Builder setCustomProperty(CustomPropertyKey paramCustomPropertyKey, String paramString)
    {
      zzx.zzb(paramCustomPropertyKey, "key");
      zzx.zzb(paramString, "value");
      zzj("The total size of key string and value string of a custom property", 124, zzbw(paramCustomPropertyKey.getKey()) + zzbw(paramString));
      zzky().zza(paramCustomPropertyKey, paramString);
      return this;
    }

    public Builder setDescription(String paramString)
    {
      this.zzSw.zzb(zzmi.zzVv, paramString);
      return this;
    }

    public Builder setIndexableText(String paramString)
    {
      zzj("Indexable text size", 131072, zzbw(paramString));
      this.zzSw.zzb(zzmi.zzVA, paramString);
      return this;
    }

    public Builder setLastViewedByMeDate(Date paramDate)
    {
      this.zzSw.zzb(zzmk.zzWf, paramDate);
      return this;
    }

    public Builder setMimeType(String paramString)
    {
      this.zzSw.zzb(zzmi.zzVM, paramString);
      return this;
    }

    public Builder setPinned(boolean paramBoolean)
    {
      this.zzSw.zzb(zzmi.zzVF, Boolean.valueOf(paramBoolean));
      return this;
    }

    public Builder setStarred(boolean paramBoolean)
    {
      this.zzSw.zzb(zzmi.zzVT, Boolean.valueOf(paramBoolean));
      return this;
    }

    public Builder setTitle(String paramString)
    {
      this.zzSw.zzb(zzmi.zzVV, paramString);
      return this;
    }

    public Builder setViewed(boolean paramBoolean)
    {
      this.zzSw.zzb(zzmi.zzVL, Boolean.valueOf(paramBoolean));
      return this;
    }
  }
}