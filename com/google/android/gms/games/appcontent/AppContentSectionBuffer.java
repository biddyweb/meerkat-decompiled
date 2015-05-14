package com.google.android.gms.games.appcontent;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;
import java.util.ArrayList;

public final class AppContentSectionBuffer extends zzg<AppContentSection>
{
  private final ArrayList<DataHolder> zzadC;

  public void release()
  {
    super.release();
    int i = this.zzadC.size();
    for (int j = 1; j < i; j++)
    {
      DataHolder localDataHolder = (DataHolder)this.zzadC.get(j);
      if (localDataHolder != null)
        localDataHolder.close();
    }
  }

  protected String zziB()
  {
    return "section_id";
  }

  protected String zziD()
  {
    return "card_id";
  }

  protected AppContentSection zzm(int paramInt1, int paramInt2)
  {
    return new AppContentSectionRef(this.zzadC, paramInt1, paramInt2);
  }
}