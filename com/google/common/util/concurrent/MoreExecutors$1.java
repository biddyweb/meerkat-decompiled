package com.google.common.util.concurrent;

import java.util.concurrent.BlockingQueue;

final class MoreExecutors$1
  implements Runnable
{
  MoreExecutors$1(BlockingQueue paramBlockingQueue, ListenableFuture paramListenableFuture)
  {
  }

  public void run()
  {
    this.val$queue.add(this.val$future);
  }
}