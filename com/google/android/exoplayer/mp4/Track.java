package com.google.android.exoplayer.mp4;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.chunk.parser.mp4.TrackEncryptionBox;

public final class Track
{
  public static final int TYPE_AUDIO = 1936684398;
  public static final int TYPE_HINT = 1751740020;
  public static final int TYPE_META = 1835365473;
  public static final int TYPE_TEXT = 1952807028;
  public static final int TYPE_TIME_CODE = 1953325924;
  public static final int TYPE_VIDEO = 1986618469;
  public final long durationUs;
  public final int id;
  public final MediaFormat mediaFormat;
  public final TrackEncryptionBox[] sampleDescriptionEncryptionBoxes;
  public final long timescale;
  public final int type;

  public Track(int paramInt1, int paramInt2, long paramLong1, long paramLong2, MediaFormat paramMediaFormat, TrackEncryptionBox[] paramArrayOfTrackEncryptionBox)
  {
    this.id = paramInt1;
    this.type = paramInt2;
    this.timescale = paramLong1;
    this.durationUs = paramLong2;
    this.mediaFormat = paramMediaFormat;
    this.sampleDescriptionEncryptionBoxes = paramArrayOfTrackEncryptionBox;
  }
}