package com.google.android.exoplayer.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

public class SlidingPercentile
{
  private static final Comparator<Sample> INDEX_COMPARATOR = new Comparator()
  {
    public int compare(SlidingPercentile.Sample paramAnonymousSample1, SlidingPercentile.Sample paramAnonymousSample2)
    {
      return paramAnonymousSample1.index - paramAnonymousSample2.index;
    }
  };
  private static final int MAX_RECYCLED_SAMPLES = 5;
  private static final int SORT_ORDER_BY_INDEX = 1;
  private static final int SORT_ORDER_BY_VALUE = 0;
  private static final int SORT_ORDER_NONE = -1;
  private static final Comparator<Sample> VALUE_COMPARATOR = new Comparator()
  {
    public int compare(SlidingPercentile.Sample paramAnonymousSample1, SlidingPercentile.Sample paramAnonymousSample2)
    {
      if (paramAnonymousSample1.value < paramAnonymousSample2.value)
        return -1;
      if (paramAnonymousSample2.value < paramAnonymousSample1.value)
        return 1;
      return 0;
    }
  };
  private int currentSortOrder;
  private final int maxWeight;
  private int nextSampleIndex;
  private int recycledSampleCount;
  private final Sample[] recycledSamples;
  private final ArrayList<Sample> samples;
  private int totalWeight;

  public SlidingPercentile(int paramInt)
  {
    this.maxWeight = paramInt;
    this.recycledSamples = new Sample[5];
    this.samples = new ArrayList();
    this.currentSortOrder = -1;
  }

  private void ensureSortedByIndex()
  {
    if (this.currentSortOrder != 1)
    {
      Collections.sort(this.samples, INDEX_COMPARATOR);
      this.currentSortOrder = 1;
    }
  }

  private void ensureSortedByValue()
  {
    if (this.currentSortOrder != 0)
    {
      Collections.sort(this.samples, VALUE_COMPARATOR);
      this.currentSortOrder = 0;
    }
  }

  public void addSample(int paramInt, float paramFloat)
  {
    ensureSortedByIndex();
    Sample localSample1;
    if (this.recycledSampleCount > 0)
    {
      Sample[] arrayOfSample2 = this.recycledSamples;
      int m = -1 + this.recycledSampleCount;
      this.recycledSampleCount = m;
      localSample1 = arrayOfSample2[m];
      int i = this.nextSampleIndex;
      this.nextSampleIndex = (i + 1);
      localSample1.index = i;
      localSample1.weight = paramInt;
      localSample1.value = paramFloat;
      this.samples.add(localSample1);
      this.totalWeight = (paramInt + this.totalWeight);
    }
    while (true)
    {
      if (this.totalWeight <= this.maxWeight)
        return;
      int j = this.totalWeight - this.maxWeight;
      Sample localSample2 = (Sample)this.samples.get(0);
      if (localSample2.weight <= j)
      {
        this.totalWeight -= localSample2.weight;
        this.samples.remove(0);
        if (this.recycledSampleCount >= 5)
          continue;
        Sample[] arrayOfSample1 = this.recycledSamples;
        int k = this.recycledSampleCount;
        this.recycledSampleCount = (k + 1);
        arrayOfSample1[k] = localSample2;
        continue;
        localSample1 = new Sample(null);
        break;
      }
      localSample2.weight -= j;
      this.totalWeight -= j;
    }
  }

  public float getPercentile(float paramFloat)
  {
    ensureSortedByValue();
    float f = paramFloat * this.totalWeight;
    int i = 0;
    for (int j = 0; j < this.samples.size(); j++)
    {
      Sample localSample = (Sample)this.samples.get(j);
      i += localSample.weight;
      if (i >= f)
        return localSample.value;
    }
    if (this.samples.isEmpty())
      return (0.0F / 0.0F);
    return ((Sample)this.samples.get(-1 + this.samples.size())).value;
  }

  private static class Sample
  {
    public int index;
    public float value;
    public int weight;
  }
}