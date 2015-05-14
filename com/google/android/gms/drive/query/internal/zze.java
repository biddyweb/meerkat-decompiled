package com.google.android.gms.drive.query.internal;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.Iterator;
import java.util.Set;

class zze
{
  static MetadataField<?> zzb(MetadataBundle paramMetadataBundle)
  {
    Set localSet = paramMetadataBundle.zzla();
    if (localSet.size() != 1)
      throw new IllegalArgumentException("bundle should have exactly 1 populated field");
    return (MetadataField)localSet.iterator().next();
  }
}