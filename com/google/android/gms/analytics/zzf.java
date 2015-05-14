package com.google.android.gms.analytics;

import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;

abstract interface zzf
{
  public abstract void dispatch();

  public abstract Thread getThread();

  public abstract void zzfa();

  public abstract void zzfh();

  public abstract LinkedBlockingQueue<Runnable> zzfi();

  public abstract void zzfj();

  public abstract void zzx(Map<String, String> paramMap);
}