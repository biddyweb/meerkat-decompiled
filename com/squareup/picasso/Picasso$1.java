package com.squareup.picasso;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.util.List;

final class Picasso$1 extends Handler
{
  Picasso$1(Looper paramLooper)
  {
    super(paramLooper);
  }

  public void handleMessage(Message paramMessage)
  {
    List localList;
    int i;
    int j;
    switch (paramMessage.what)
    {
    default:
      throw new AssertionError("Unknown handler message received: " + paramMessage.what);
    case 8:
      localList = (List)paramMessage.obj;
      i = 0;
      j = localList.size();
    case 3:
    }
    while (i < j)
    {
      BitmapHunter localBitmapHunter = (BitmapHunter)localList.get(i);
      localBitmapHunter.picasso.complete(localBitmapHunter);
      i++;
      continue;
      Action localAction = (Action)paramMessage.obj;
      Picasso.access$000(localAction.picasso, localAction.getTarget());
    }
  }
}