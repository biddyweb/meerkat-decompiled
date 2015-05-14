package com.google.android.exoplayer.upstream;

public abstract interface Allocator
{
  public abstract Allocation allocate(int paramInt);

  public abstract int getAllocatedSize();

  public abstract void trim(int paramInt);
}