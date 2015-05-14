package com.twitter.sdk.android.core.models;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Entity
{
  private static final int END_INDEX = 1;
  private static final int START_INDEX;

  @SerializedName("indices")
  public final List<Integer> indices;

  public Entity(int paramInt1, int paramInt2)
  {
    ArrayList localArrayList = new ArrayList(2);
    localArrayList.add(0, Integer.valueOf(paramInt1));
    localArrayList.add(1, Integer.valueOf(paramInt2));
    this.indices = Collections.unmodifiableList(localArrayList);
  }

  public int getEnd()
  {
    return ((Integer)this.indices.get(1)).intValue();
  }

  public int getStart()
  {
    return ((Integer)this.indices.get(0)).intValue();
  }
}