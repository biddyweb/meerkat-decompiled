package com.google.android.exoplayer.upstream;

public abstract interface Allocation
{
  public abstract int capacity();

  public abstract void ensureCapacity(int paramInt);

  public abstract byte[][] getBuffers();

  public abstract int getFragmentLength(int paramInt);

  public abstract int getFragmentOffset(int paramInt);

  public abstract void release();
}