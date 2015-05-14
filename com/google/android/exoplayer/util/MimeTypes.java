package com.google.android.exoplayer.util;

public class MimeTypes
{
  public static final String APPLICATION_EIA608 = "application/eia-608";
  public static final String APPLICATION_ID3 = "application/id3";
  public static final String APPLICATION_TTML = "application/ttml+xml";
  public static final String AUDIO_AAC = "audio/mp4a-latm";
  public static final String AUDIO_AC3 = "audio/ac3";
  public static final String AUDIO_EC3 = "audio/eac3";
  public static final String AUDIO_MP4 = "audio/mp4";
  public static final String AUDIO_OPUS = "audio/opus";
  public static final String AUDIO_VORBIS = "audio/vorbis";
  public static final String AUDIO_WEBM = "audio/webm";
  public static final String BASE_TYPE_APPLICATION = "application";
  public static final String BASE_TYPE_AUDIO = "audio";
  public static final String BASE_TYPE_TEXT = "text";
  public static final String BASE_TYPE_VIDEO = "video";
  public static final String TEXT_VTT = "text/vtt";
  public static final String VIDEO_H264 = "video/avc";
  public static final String VIDEO_MP4 = "video/mp4";
  public static final String VIDEO_MP4V = "video/mp4v-es";
  public static final String VIDEO_VP9 = "video/x-vnd.on2.vp9";
  public static final String VIDEO_WEBM = "video/webm";

  public static String getTopLevelType(String paramString)
  {
    int i = paramString.indexOf('/');
    if (i == -1)
      throw new IllegalArgumentException("Invalid mime type: " + paramString);
    return paramString.substring(0, i);
  }

  public static boolean isApplication(String paramString)
  {
    return getTopLevelType(paramString).equals("application");
  }

  public static boolean isAudio(String paramString)
  {
    return getTopLevelType(paramString).equals("audio");
  }

  public static boolean isText(String paramString)
  {
    return getTopLevelType(paramString).equals("text");
  }

  public static boolean isTtml(String paramString)
  {
    return paramString.equals("application/ttml+xml");
  }

  public static boolean isVideo(String paramString)
  {
    return getTopLevelType(paramString).equals("video");
  }
}