package com.google.android.exoplayer.upstream;

public abstract interface TransferListener
{
  public abstract void onBytesTransferred(int paramInt);

  public abstract void onTransferEnd();

  public abstract void onTransferStart();
}