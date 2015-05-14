package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.zzb;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONException;

public class zzm extends zzb<String>
{
  public zzm(String paramString, int paramInt)
  {
    super(paramString, Collections.singleton(paramString), Collections.emptySet(), paramInt);
  }

  public static final Collection<String> zzbz(String paramString)
    throws JSONException
  {
    if (paramString == null)
      return null;
    ArrayList localArrayList = new ArrayList();
    JSONArray localJSONArray = new JSONArray(paramString);
    for (int i = 0; i < localJSONArray.length(); i++)
      localArrayList.add(localJSONArray.getString(i));
    return Collections.unmodifiableCollection(localArrayList);
  }

  protected void zza(Bundle paramBundle, Collection<String> paramCollection)
  {
    paramBundle.putStringArrayList(getName(), new ArrayList(paramCollection));
  }

  protected Collection<String> zzd(DataHolder paramDataHolder, int paramInt1, int paramInt2)
  {
    try
    {
      Collection localCollection = zzbz(paramDataHolder.zzc(getName(), paramInt1, paramInt2));
      return localCollection;
    }
    catch (JSONException localJSONException)
    {
      throw new IllegalStateException("DataHolder supplied invalid JSON", localJSONException);
    }
  }

  protected Collection<String> zzq(Bundle paramBundle)
  {
    return paramBundle.getStringArrayList(getName());
  }
}