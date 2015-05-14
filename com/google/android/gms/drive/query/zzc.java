package com.google.android.gms.drive.query;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.zzb;
import com.google.android.gms.drive.query.internal.Operator;
import com.google.android.gms.drive.query.internal.zzf;
import java.util.Iterator;
import java.util.List;

public class zzc
  implements zzf<String>
{
  public <T> String zza(zzb<T> paramzzb, T paramT)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramzzb.getName();
    arrayOfObject[1] = paramT;
    return String.format("contains(%s,%s)", arrayOfObject);
  }

  public <T> String zza(Operator paramOperator, MetadataField<T> paramMetadataField, T paramT)
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = paramOperator.getTag();
    arrayOfObject[1] = paramMetadataField.getName();
    arrayOfObject[2] = paramT;
    return String.format("cmp(%s,%s,%s)", arrayOfObject);
  }

  public String zza(Operator paramOperator, List<String> paramList)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramOperator.getTag() + "(");
    Iterator localIterator = paramList.iterator();
    for (String str1 = ""; localIterator.hasNext(); str1 = ",")
    {
      String str2 = (String)localIterator.next();
      localStringBuilder.append(str1);
      localStringBuilder.append(str2);
    }
    return ")";
  }

  public String zzbC(String paramString)
  {
    return String.format("not(%s)", new Object[] { paramString });
  }

  public String zzbD(String paramString)
  {
    return String.format("fullTextSearch(%s)", new Object[] { paramString });
  }

  public <T> String zzc(MetadataField<T> paramMetadataField, T paramT)
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = paramMetadataField.getName();
    arrayOfObject[1] = paramT;
    return String.format("has(%s,%s)", arrayOfObject);
  }

  public String zzd(MetadataField<?> paramMetadataField)
  {
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = paramMetadataField.getName();
    return String.format("fieldOnly(%s)", arrayOfObject);
  }

  public String zzle()
  {
    return "all()";
  }
}