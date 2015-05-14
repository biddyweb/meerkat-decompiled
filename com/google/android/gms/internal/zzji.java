package com.google.android.gms.internal;

import android.accounts.Account;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.appindexing.Action;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class zzji
{
  private static zzir zza(String paramString, zzop.zzc paramzzc)
  {
    zziz localzziz = new zziz.zza(paramString).zzI(true).zzaA(paramString).zzaz("blob").zzgX();
    return new zzir(zzwy.zzf(paramzzc), localzziz);
  }

  public static zzjb zza(Action paramAction, long paramLong, String paramString, int paramInt)
  {
    Bundle localBundle1 = new Bundle();
    localBundle1.putAll(paramAction.zzgZ());
    Bundle localBundle2 = localBundle1.getBundle("object");
    if (localBundle2.containsKey("id"));
    for (Uri localUri = Uri.parse(localBundle2.getString("id")); ; localUri = null)
    {
      String str1 = localBundle2.getString("name");
      String str2 = localBundle2.getString("type");
      Intent localIntent = zzjj.zza(paramString, Uri.parse(localBundle2.getString("url")));
      zzin.zza localzza = zzjb.zza(localIntent, str1, localUri, str2, null);
      if (localBundle1.containsKey(".private:ssbContext"))
      {
        localzza.zza(zzir.zzd(localBundle1.getByteArray(".private:ssbContext")));
        paramAction.zzgZ().remove(".private:ssbContext");
      }
      if (localBundle1.containsKey(".private:accountName"))
      {
        localzza.zza(new Account(localBundle1.getString(".private:accountName"), "com.google"));
        paramAction.zzgZ().remove(".private:accountName");
      }
      if ((localBundle1.containsKey(".private:isContextOnly")) && (localBundle1.getBoolean(".private:isContextOnly")))
      {
        paramInt = 4;
        paramAction.zzgZ().remove(".private:isContextOnly");
      }
      int i = paramInt;
      boolean bool1 = localBundle1.containsKey(".private:isDeviceOnly");
      boolean bool2 = false;
      if (bool1)
      {
        bool2 = localBundle1.getBoolean(".private:isDeviceOnly", false);
        paramAction.zzgZ().remove(".private:isDeviceOnly");
      }
      localzza.zza(zza(".private:action", zzh(paramAction.zzgZ())));
      return new zzjb(zzjb.zza(paramString, localIntent), paramLong, i, null, localzza.zzgU(), bool2, -1);
    }
  }

  static zzop.zzc zzh(Bundle paramBundle)
  {
    zzop.zzc localzzc = new zzop.zzc();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramBundle.keySet().iterator();
    if (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Object localObject = paramBundle.get(str);
      zzop.zzb localzzb = new zzop.zzb();
      localzzb.name = str;
      localzzb.zzalj = new zzop.zzd();
      if ((localObject instanceof String))
        localzzb.zzalj.zzQN = ((String)localObject);
      while (true)
      {
        localArrayList.add(localzzb);
        break;
        if ((localObject instanceof Bundle))
          localzzb.zzalj.zzalo = zzh((Bundle)localObject);
        else
          Log.e("AppDataSearchClient", "Unsupported value: " + localObject);
      }
    }
    if (paramBundle.containsKey("type"))
      localzzc.type = paramBundle.getString("type");
    localzzc.zzalk = ((zzop.zzb[])localArrayList.toArray(new zzop.zzb[localArrayList.size()]));
    return localzzc;
  }
}