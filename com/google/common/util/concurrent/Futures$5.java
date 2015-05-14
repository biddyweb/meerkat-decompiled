package com.google.common.util.concurrent;

import java.util.concurrent.ConcurrentLinkedQueue;

final class Futures$5
  implements Runnable
{
  Futures$5(ConcurrentLinkedQueue paramConcurrentLinkedQueue, ListenableFuture paramListenableFuture)
  {
  }

  public void run()
  {
    ((AsyncSettableFuture)this.val$delegates.remove()).setFuture(this.val$future);
  }
}