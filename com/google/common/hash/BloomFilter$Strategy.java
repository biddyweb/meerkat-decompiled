package com.google.common.hash;

import java.io.Serializable;

abstract interface BloomFilter$Strategy extends Serializable
{
  public abstract <T> boolean mightContain(T paramT, Funnel<? super T> paramFunnel, int paramInt, BloomFilterStrategies.BitArray paramBitArray);

  public abstract int ordinal();

  public abstract <T> boolean put(T paramT, Funnel<? super T> paramFunnel, int paramInt, BloomFilterStrategies.BitArray paramBitArray);
}