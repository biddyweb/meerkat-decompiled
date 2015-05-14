package retrofit.android;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;

public final class MainThreadExecutor
  implements Executor
{
  private final Handler handler = new Handler(Looper.getMainLooper());

  public void execute(Runnable paramRunnable)
  {
    this.handler.post(paramRunnable);
  }
}