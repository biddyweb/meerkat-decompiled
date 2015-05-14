package com.squareup.picasso;

import android.os.Handler;
import android.os.Process;
import java.lang.ref.ReferenceQueue;

class Picasso$CleanupThread extends Thread
{
  private final Handler handler;
  private final ReferenceQueue<?> referenceQueue;

  Picasso$CleanupThread(ReferenceQueue<?> paramReferenceQueue, Handler paramHandler)
  {
    this.referenceQueue = paramReferenceQueue;
    this.handler = paramHandler;
    setDaemon(true);
    setName("Picasso-refQueue");
  }

  public void run()
  {
    Process.setThreadPriority(10);
    try
    {
      while (true)
      {
        Action.RequestWeakReference localRequestWeakReference = (Action.RequestWeakReference)this.referenceQueue.remove();
        this.handler.sendMessage(this.handler.obtainMessage(3, localRequestWeakReference.action));
      }
    }
    catch (InterruptedException localInterruptedException)
    {
    }
    catch (Exception localException)
    {
      this.handler.post(new Runnable()
      {
        public void run()
        {
          throw new RuntimeException(localException);
        }
      });
    }
  }

  void shutdown()
  {
    interrupt();
  }
}