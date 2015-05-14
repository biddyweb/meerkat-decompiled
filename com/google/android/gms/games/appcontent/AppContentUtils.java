package com.google.android.gms.games.appcontent;

import android.os.Bundle;
import android.text.TextUtils;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.zzls;
import java.util.ArrayList;

public final class AppContentUtils
{
  public static ArrayList<AppContentAction> zza(DataHolder paramDataHolder, ArrayList<DataHolder> paramArrayList, String paramString, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    zza(paramDataHolder, 1, paramString, "action_id", paramInt, new AppContentRunner()
    {
      public void zzb(ArrayList<DataHolder> paramAnonymousArrayList, int paramAnonymousInt)
      {
        this.zzadG.add(new AppContentActionRef(paramAnonymousArrayList, paramAnonymousInt));
      }
    }
    , paramArrayList);
    return localArrayList;
  }

  private static void zza(DataHolder paramDataHolder, int paramInt1, String paramString1, String paramString2, int paramInt2, AppContentRunner paramAppContentRunner, ArrayList<DataHolder> paramArrayList)
  {
    DataHolder localDataHolder = (DataHolder)paramArrayList.get(paramInt1);
    String str1 = paramDataHolder.zzc(paramString1, paramInt2, paramDataHolder.zzax(paramInt2));
    if (!TextUtils.isEmpty(str1))
    {
      int i = localDataHolder.getCount();
      String[] arrayOfString = str1.split(",");
      for (int j = 0; j < i; j++)
      {
        String str2 = localDataHolder.zzc(paramString2, j, localDataHolder.zzax(j));
        if ((!TextUtils.isEmpty(str2)) && (zzls.zzb(arrayOfString, str2)))
          paramAppContentRunner.zzb(paramArrayList, j);
      }
    }
  }

  public static ArrayList<AppContentAnnotation> zzb(DataHolder paramDataHolder, ArrayList<DataHolder> paramArrayList, String paramString, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    zza(paramDataHolder, 2, paramString, "annotation_id", paramInt, new AppContentRunner()
    {
      public void zzb(ArrayList<DataHolder> paramAnonymousArrayList, int paramAnonymousInt)
      {
        this.zzadG.add(new AppContentAnnotationRef(paramAnonymousArrayList, paramAnonymousInt));
      }
    }
    , paramArrayList);
    return localArrayList;
  }

  public static ArrayList<AppContentCondition> zzc(DataHolder paramDataHolder, ArrayList<DataHolder> paramArrayList, String paramString, int paramInt)
  {
    ArrayList localArrayList = new ArrayList();
    zza(paramDataHolder, 4, paramString, "condition_id", paramInt, new AppContentRunner()
    {
      public void zzb(ArrayList<DataHolder> paramAnonymousArrayList, int paramAnonymousInt)
      {
        this.zzadG.add(new AppContentConditionRef(paramAnonymousArrayList, paramAnonymousInt));
      }
    }
    , paramArrayList);
    return localArrayList;
  }

  public static Bundle zzd(DataHolder paramDataHolder, ArrayList<DataHolder> paramArrayList, String paramString, int paramInt)
  {
    final Bundle localBundle = new Bundle();
    zza(paramDataHolder, 3, paramString, "tuple_id", paramInt, new AppContentRunner()
    {
      public void zzb(ArrayList<DataHolder> paramAnonymousArrayList, int paramAnonymousInt)
      {
        AppContentTupleRef localAppContentTupleRef = new AppContentTupleRef(this.zzadH, paramAnonymousInt);
        localBundle.putString(localAppContentTupleRef.getName(), localAppContentTupleRef.getValue());
      }
    }
    , paramArrayList);
    return localBundle;
  }

  private static abstract interface AppContentRunner
  {
    public abstract void zzb(ArrayList<DataHolder> paramArrayList, int paramInt);
  }
}