package com.google.android.exoplayer.chunk.parser;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.ParserException;
import com.google.android.exoplayer.SampleHolder;
import com.google.android.exoplayer.upstream.NonBlockingInputStream;
import java.util.Map;
import java.util.UUID;

public abstract interface Extractor
{
  public static final int RESULT_END_OF_STREAM = 2;
  public static final int RESULT_NEED_MORE_DATA = 1;
  public static final int RESULT_NEED_SAMPLE_HOLDER = 32;
  public static final int RESULT_READ_INDEX = 16;
  public static final int RESULT_READ_INIT = 8;
  public static final int RESULT_READ_SAMPLE = 4;

  public abstract long getDurationUs();

  public abstract MediaFormat getFormat();

  public abstract SegmentIndex getIndex();

  public abstract Map<UUID, byte[]> getPsshInfo();

  public abstract boolean hasRelativeIndexOffsets();

  public abstract int read(NonBlockingInputStream paramNonBlockingInputStream, SampleHolder paramSampleHolder)
    throws ParserException;

  public abstract boolean seekTo(long paramLong, boolean paramBoolean);
}