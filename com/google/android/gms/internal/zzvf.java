package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbf;
import com.google.android.gms.tagmanager.zzde;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class zzvf
{
  static zzd.zza zza(int paramInt, JSONArray paramJSONArray, zzd.zza[] paramArrayOfzza, Set<Integer> paramSet)
    throws zzvl.zzg, JSONException
  {
    int i = 0;
    if (paramSet.contains(Integer.valueOf(paramInt)))
      zzdw("Value cycle detected. Current value reference: " + paramInt + "." + "  Previous value references: " + paramSet + ".");
    Object localObject = zza(paramJSONArray, paramInt, "values");
    if (paramArrayOfzza[paramInt] != null)
      return paramArrayOfzza[paramInt];
    paramSet.add(Integer.valueOf(paramInt));
    zzd.zza localzza = new zzd.zza();
    if ((localObject instanceof JSONArray))
    {
      JSONArray localJSONArray3 = (JSONArray)localObject;
      localzza.type = 2;
      localzza.zzgF = true;
      localzza.zzgw = new zzd.zza[localJSONArray3.length()];
      while (i < localzza.zzgw.length)
      {
        localzza.zzgw[i] = zza(localJSONArray3.getInt(i), paramJSONArray, paramArrayOfzza, paramSet);
        i++;
      }
    }
    JSONObject localJSONObject;
    if ((localObject instanceof JSONObject))
    {
      localJSONObject = (JSONObject)localObject;
      JSONArray localJSONArray1 = localJSONObject.optJSONArray("escaping");
      if (localJSONArray1 != null)
      {
        localzza.zzgE = new int[localJSONArray1.length()];
        for (int m = 0; m < localzza.zzgE.length; m++)
          localzza.zzgE[m] = localJSONArray1.getInt(m);
      }
      if (localJSONObject.has("function_id"))
      {
        localzza.type = 5;
        localzza.zzgA = localJSONObject.getString("function_id");
      }
    }
    while (true)
    {
      paramArrayOfzza[paramInt] = localzza;
      paramSet.remove(Integer.valueOf(paramInt));
      return localzza;
      if (localJSONObject.has("macro_reference"))
      {
        localzza.type = 4;
        localzza.zzgF = true;
        localzza.zzgz = zzde.zzg(zza(localJSONObject.getInt("macro_reference"), paramJSONArray, paramArrayOfzza, paramSet));
      }
      else if (localJSONObject.has("template_token"))
      {
        localzza.type = 7;
        localzza.zzgF = true;
        JSONArray localJSONArray2 = localJSONObject.getJSONArray("template_token");
        localzza.zzgD = new zzd.zza[localJSONArray2.length()];
        while (i < localzza.zzgD.length)
        {
          localzza.zzgD[i] = zza(localJSONArray2.getInt(i), paramJSONArray, paramArrayOfzza, paramSet);
          i++;
        }
      }
      else
      {
        localzza.type = 3;
        localzza.zzgF = true;
        int j = localJSONObject.length();
        localzza.zzgx = new zzd.zza[j];
        localzza.zzgy = new zzd.zza[j];
        Iterator localIterator = localJSONObject.keys();
        for (int k = 0; localIterator.hasNext(); k++)
        {
          String str = (String)localIterator.next();
          localzza.zzgx[k] = zza(new Integer(str).intValue(), paramJSONArray, paramArrayOfzza, paramSet);
          localzza.zzgy[k] = zza(localJSONObject.getInt(str), paramJSONArray, paramArrayOfzza, paramSet);
        }
        continue;
        if ((localObject instanceof String))
        {
          localzza.zzgv = ((String)localObject);
          localzza.type = 1;
        }
        else if ((localObject instanceof Boolean))
        {
          localzza.zzgC = ((Boolean)localObject).booleanValue();
          localzza.type = 8;
        }
        else if ((localObject instanceof Integer))
        {
          localzza.zzgB = ((Integer)localObject).intValue();
          localzza.type = 6;
        }
        else
        {
          zzdw("Invalid value type: " + localObject);
        }
      }
    }
  }

  static zzvl.zza zza(JSONObject paramJSONObject, JSONArray paramJSONArray1, JSONArray paramJSONArray2, zzd.zza[] paramArrayOfzza, int paramInt)
    throws zzvl.zzg, JSONException
  {
    zzvl.zzb localzzb = zzvl.zza.zzuu();
    JSONArray localJSONArray = paramJSONObject.getJSONArray("property");
    int i = 0;
    if (i < localJSONArray.length())
    {
      JSONObject localJSONObject = (JSONObject)zza(paramJSONArray1, localJSONArray.getInt(i), "properties");
      String str = (String)zza(paramJSONArray2, localJSONObject.getInt("key"), "key");
      zzd.zza localzza = (zzd.zza)zza(paramArrayOfzza, localJSONObject.getInt("value"), "value");
      if (zzb.zzec.toString().equals(str))
        localzzb.zzq(localzza);
      while (true)
      {
        i++;
        break;
        localzzb.zzb(str, localzza);
      }
    }
    return localzzb.zzuw();
  }

  static zzvl.zze zza(JSONObject paramJSONObject, List<zzvl.zza> paramList1, List<zzvl.zza> paramList2, List<zzvl.zza> paramList3, zzd.zza[] paramArrayOfzza)
    throws JSONException
  {
    zzvl.zzf localzzf = zzvl.zze.zzuB();
    JSONArray localJSONArray1 = paramJSONObject.optJSONArray("positive_predicate");
    JSONArray localJSONArray2 = paramJSONObject.optJSONArray("negative_predicate");
    JSONArray localJSONArray3 = paramJSONObject.optJSONArray("add_tag");
    JSONArray localJSONArray4 = paramJSONObject.optJSONArray("remove_tag");
    JSONArray localJSONArray5 = paramJSONObject.optJSONArray("add_tag_rule_name");
    JSONArray localJSONArray6 = paramJSONObject.optJSONArray("remove_tag_rule_name");
    JSONArray localJSONArray7 = paramJSONObject.optJSONArray("add_macro");
    JSONArray localJSONArray8 = paramJSONObject.optJSONArray("remove_macro");
    JSONArray localJSONArray9 = paramJSONObject.optJSONArray("add_macro_rule_name");
    JSONArray localJSONArray10 = paramJSONObject.optJSONArray("remove_macro_rule_name");
    if (localJSONArray1 != null)
      for (int i5 = 0; i5 < localJSONArray1.length(); i5++)
        localzzf.zzd((zzvl.zza)paramList3.get(localJSONArray1.getInt(i5)));
    if (localJSONArray2 != null)
      for (int i4 = 0; i4 < localJSONArray2.length(); i4++)
        localzzf.zze((zzvl.zza)paramList3.get(localJSONArray2.getInt(i4)));
    if (localJSONArray3 != null)
      for (int i3 = 0; i3 < localJSONArray3.length(); i3++)
        localzzf.zzf((zzvl.zza)paramList1.get(localJSONArray3.getInt(i3)));
    if (localJSONArray4 != null)
      for (int i2 = 0; i2 < localJSONArray4.length(); i2++)
        localzzf.zzg((zzvl.zza)paramList1.get(localJSONArray4.getInt(i2)));
    if (localJSONArray5 != null)
      for (int i1 = 0; i1 < localJSONArray5.length(); i1++)
        localzzf.zzdz(paramArrayOfzza[localJSONArray5.getInt(i1)].zzgv);
    if (localJSONArray6 != null)
      for (int n = 0; n < localJSONArray6.length(); n++)
        localzzf.zzdA(paramArrayOfzza[localJSONArray6.getInt(n)].zzgv);
    if (localJSONArray7 != null)
      for (int m = 0; m < localJSONArray7.length(); m++)
        localzzf.zzh((zzvl.zza)paramList2.get(localJSONArray7.getInt(m)));
    if (localJSONArray8 != null)
      for (int k = 0; k < localJSONArray8.length(); k++)
        localzzf.zzi((zzvl.zza)paramList2.get(localJSONArray8.getInt(k)));
    if (localJSONArray9 != null)
      for (int j = 0; j < localJSONArray9.length(); j++)
        localzzf.zzdB(paramArrayOfzza[localJSONArray9.getInt(j)].zzgv);
    if (localJSONArray10 != null)
      for (int i = 0; i < localJSONArray10.length(); i++)
        localzzf.zzdC(paramArrayOfzza[localJSONArray10.getInt(i)].zzgv);
    return localzzf.zzuM();
  }

  private static <T> T zza(JSONArray paramJSONArray, int paramInt, String paramString)
    throws zzvl.zzg
  {
    if ((paramInt >= 0) && (paramInt < paramJSONArray.length()))
      try
      {
        Object localObject = paramJSONArray.get(paramInt);
        return localObject;
      }
      catch (JSONException localJSONException)
      {
      }
    zzdw("Index out of bounds detected: " + paramInt + " in " + paramString);
    return null;
  }

  private static <T> T zza(T[] paramArrayOfT, int paramInt, String paramString)
    throws zzvl.zzg
  {
    if ((paramInt < 0) || (paramInt >= paramArrayOfT.length))
      zzdw("Index out of bounds detected: " + paramInt + " in " + paramString);
    return paramArrayOfT[paramInt];
  }

  static List<zzvl.zza> zza(JSONArray paramJSONArray1, JSONArray paramJSONArray2, JSONArray paramJSONArray3, zzd.zza[] paramArrayOfzza)
    throws JSONException, zzvl.zzg
  {
    ArrayList localArrayList = new ArrayList();
    for (int i = 0; i < paramJSONArray1.length(); i++)
      localArrayList.add(zza(paramJSONArray1.getJSONObject(i), paramJSONArray2, paramJSONArray3, paramArrayOfzza, i));
    return localArrayList;
  }

  static zzvl.zzc zzdd(String paramString)
    throws JSONException, zzvl.zzg
  {
    JSONObject localJSONObject1 = new JSONObject(paramString);
    Object localObject = localJSONObject1.get("resource");
    JSONObject localJSONObject2;
    zzvl.zzd localzzd;
    zzd.zza[] arrayOfzza;
    List localList1;
    List localList2;
    List localList3;
    if ((localObject instanceof JSONObject))
    {
      localJSONObject2 = (JSONObject)localObject;
      localzzd = zzvl.zzc.zzux();
      arrayOfzza = zzf(localJSONObject2);
      JSONArray localJSONArray1 = localJSONObject2.getJSONArray("properties");
      JSONArray localJSONArray2 = localJSONObject2.getJSONArray("key");
      localList1 = zza(localJSONObject2.getJSONArray("tags"), localJSONArray1, localJSONArray2, arrayOfzza);
      localList2 = zza(localJSONObject2.getJSONArray("predicates"), localJSONArray1, localJSONArray2, arrayOfzza);
      localList3 = zza(localJSONObject2.getJSONArray("macros"), localJSONArray1, localJSONArray2, arrayOfzza);
      Iterator localIterator = localList3.iterator();
      while (localIterator.hasNext())
        localzzd.zzc((zzvl.zza)localIterator.next());
    }
    throw new zzvl.zzg("Resource map not found");
    JSONArray localJSONArray3 = localJSONObject2.getJSONArray("rules");
    for (int i = 0; i < localJSONArray3.length(); i++)
      localzzd.zzb(zza(localJSONArray3.getJSONObject(i), localList1, localList3, localList2, arrayOfzza));
    localzzd.zzdy("1");
    localzzd.zzhk(1);
    if (localJSONObject1.optJSONArray("runtime") != null);
    return localzzd.zzuA();
  }

  private static void zzdw(String paramString)
    throws zzvl.zzg
  {
    zzbf.zzZ(paramString);
    throw new zzvl.zzg(paramString);
  }

  static zzd.zza[] zzf(JSONObject paramJSONObject)
    throws JSONException, zzvl.zzg
  {
    Object localObject = paramJSONObject.opt("values");
    zzd.zza[] arrayOfzza;
    if ((localObject instanceof JSONArray))
    {
      JSONArray localJSONArray = (JSONArray)localObject;
      arrayOfzza = new zzd.zza[localJSONArray.length()];
      for (int i = 0; i < arrayOfzza.length; i++)
        zza(i, localJSONArray, arrayOfzza, new HashSet(0));
    }
    throw new zzvl.zzg("Missing Values list");
    return arrayOfzza;
  }
}