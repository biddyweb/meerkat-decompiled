package com.google.android.exoplayer.text;

import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.util.Assertions;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.ByteBuffer;

public class SubtitleParserHelper
  implements Handler.Callback
{
  private IOException error;
  private final Handler handler = new Handler(paramLooper, this);
  private final SubtitleParser parser;
  private boolean parsing;
  private Subtitle result;
  private SampleHolder sampleHolder;

  public SubtitleParserHelper(Looper paramLooper, SubtitleParser paramSubtitleParser)
  {
    this.parser = paramSubtitleParser;
    flush();
  }

  public void flush()
  {
    try
    {
      this.sampleHolder = new SampleHolder(1);
      this.parsing = false;
      this.result = null;
      this.error = null;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Subtitle getAndClearResult()
    throws IOException
  {
    try
    {
      if (this.error != null)
        throw this.error;
    }
    finally
    {
      try
      {
        this.error = null;
        this.result = null;
        throw localObject1;
      }
      finally
      {
      }
      Subtitle localSubtitle = this.result;
      this.error = null;
      this.result = null;
      return localSubtitle;
    }
  }

  public SampleHolder getSampleHolder()
  {
    try
    {
      SampleHolder localSampleHolder = this.sampleHolder;
      return localSampleHolder;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean handleMessage(Message paramMessage)
  {
    SampleHolder localSampleHolder = (SampleHolder)paramMessage.obj;
    try
    {
      ByteArrayInputStream localByteArrayInputStream = new ByteArrayInputStream(localSampleHolder.data.array(), 0, localSampleHolder.size);
      Subtitle localSubtitle2 = this.parser.parse(localByteArrayInputStream, null, this.sampleHolder.timeUs);
      localSubtitle1 = localSubtitle2;
      localObject1 = null;
      try
      {
        if (this.sampleHolder != localSampleHolder);
        while (true)
        {
          return true;
          this.result = localSubtitle1;
          this.error = localObject1;
          this.parsing = false;
        }
      }
      finally
      {
      }
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        Object localObject1 = localIOException;
        Subtitle localSubtitle1 = null;
      }
    }
  }

  public boolean isParsing()
  {
    try
    {
      boolean bool = this.parsing;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void startParseOperation()
  {
    boolean bool = true;
    try
    {
      if (!this.parsing);
      while (true)
      {
        Assertions.checkState(bool);
        this.parsing = true;
        this.result = null;
        this.error = null;
        this.handler.obtainMessage(0, this.sampleHolder).sendToTarget();
        return;
        bool = false;
      }
    }
    finally
    {
    }
  }
}