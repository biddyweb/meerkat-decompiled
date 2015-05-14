package com.google.android.exoplayer;

import android.annotation.TargetApi;
import android.media.MediaCodecInfo;
import android.media.MediaCodecInfo.CodecCapabilities;
import android.media.MediaCodecInfo.CodecProfileLevel;
import android.media.MediaCodecList;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.google.android.exoplayer.util.Util;
import java.util.HashMap;

@TargetApi(16)
public class MediaCodecUtil
{
  private static final String TAG = "MediaCodecUtil";
  private static final HashMap<CodecKey, Pair<String, MediaCodecInfo.CodecCapabilities>> codecs = new HashMap();

  private static int avcLevelToMaxFrameSize(int paramInt)
  {
    int i = 25344;
    switch (paramInt)
    {
    default:
      i = -1;
    case 1:
    case 2:
      return i;
    case 8:
      return 101376;
    case 16:
      return 101376;
    case 32:
      return 101376;
    case 64:
      return 202752;
    case 128:
      return 414720;
    case 256:
      return 414720;
    case 512:
      return 921600;
    case 1024:
      return 1310720;
    case 2048:
      return 2097152;
    case 4096:
      return 2097152;
    case 8192:
      return 2228224;
    case 16384:
      return 5652480;
    case 32768:
    }
    return 9437184;
  }

  public static DecoderInfo getDecoderInfo(String paramString, boolean paramBoolean)
    throws MediaCodecUtil.DecoderQueryException
  {
    Pair localPair = getMediaCodecInfo(paramString, paramBoolean);
    if (localPair == null)
      return null;
    return new DecoderInfo((String)localPair.first, isAdaptive((MediaCodecInfo.CodecCapabilities)localPair.second));
  }

  private static Pair<String, MediaCodecInfo.CodecCapabilities> getMediaCodecInfo(CodecKey paramCodecKey, MediaCodecListCompat paramMediaCodecListCompat)
    throws MediaCodecUtil.DecoderQueryException
  {
    try
    {
      Pair localPair = getMediaCodecInfoInternal(paramCodecKey, paramMediaCodecListCompat);
      return localPair;
    }
    catch (Exception localException)
    {
      throw new DecoderQueryException(localException, null);
    }
  }

  private static Pair<String, MediaCodecInfo.CodecCapabilities> getMediaCodecInfo(String paramString, boolean paramBoolean)
    throws MediaCodecUtil.DecoderQueryException
  {
    while (true)
    {
      Pair localPair;
      try
      {
        CodecKey localCodecKey = new CodecKey(paramString, paramBoolean);
        if (codecs.containsKey(localCodecKey))
        {
          localObject3 = (Pair)codecs.get(localCodecKey);
          return localObject3;
        }
        Object localObject2;
        if (Util.SDK_INT >= 21)
        {
          localObject2 = new MediaCodecListCompatV21(paramBoolean);
          localPair = getMediaCodecInfo(localCodecKey, (MediaCodecListCompat)localObject2);
          if ((paramBoolean) && (localPair == null) && (Util.SDK_INT >= 21))
          {
            localPair = getMediaCodecInfo(localCodecKey, new MediaCodecListCompatV16(null));
            if (localPair != null)
              Log.w("MediaCodecUtil", "MediaCodecList API didn't list secure decoder for: " + paramString + ". Assuming: " + (String)localPair.first);
          }
        }
        else
        {
          localObject2 = new MediaCodecListCompatV16(null);
          continue;
        }
      }
      finally
      {
      }
      Object localObject3 = localPair;
    }
  }

  private static Pair<String, MediaCodecInfo.CodecCapabilities> getMediaCodecInfoInternal(CodecKey paramCodecKey, MediaCodecListCompat paramMediaCodecListCompat)
  {
    String str1 = paramCodecKey.mimeType;
    int i = paramMediaCodecListCompat.getCodecCount();
    boolean bool1 = paramMediaCodecListCompat.secureDecodersExplicit();
    for (int j = 0; j < i; j++)
    {
      MediaCodecInfo localMediaCodecInfo = paramMediaCodecListCompat.getCodecInfoAt(j);
      String str2 = localMediaCodecInfo.getName();
      if ((!localMediaCodecInfo.isEncoder()) && (str2.startsWith("OMX.")) && ((bool1) || (!str2.endsWith(".secure"))))
      {
        String[] arrayOfString = localMediaCodecInfo.getSupportedTypes();
        label259: label323: for (int k = 0; k < arrayOfString.length; k++)
        {
          String str3 = arrayOfString[k];
          if (str3.equalsIgnoreCase(str1))
          {
            MediaCodecInfo.CodecCapabilities localCodecCapabilities = localMediaCodecInfo.getCapabilitiesForType(str3);
            boolean bool2 = paramMediaCodecListCompat.isSecurePlaybackSupported(paramCodecKey.mimeType, localCodecCapabilities);
            if (!bool1)
            {
              HashMap localHashMap2 = codecs;
              CodecKey localCodecKey2;
              HashMap localHashMap3;
              if (paramCodecKey.secure)
              {
                localCodecKey2 = new CodecKey(str1, false);
                localHashMap2.put(localCodecKey2, Pair.create(str2, localCodecCapabilities));
                if (bool2)
                {
                  localHashMap3 = codecs;
                  if (!paramCodecKey.secure)
                    break label259;
                }
              }
              for (CodecKey localCodecKey3 = paramCodecKey; ; localCodecKey3 = new CodecKey(str1, true))
              {
                localHashMap3.put(localCodecKey3, Pair.create(str2 + ".secure", localCodecCapabilities));
                if (!codecs.containsKey(paramCodecKey))
                  break label323;
                return (Pair)codecs.get(paramCodecKey);
                localCodecKey2 = paramCodecKey;
                break;
              }
            }
            HashMap localHashMap1 = codecs;
            if (paramCodecKey.secure == bool2);
            for (CodecKey localCodecKey1 = paramCodecKey; ; localCodecKey1 = new CodecKey(str1, bool2))
            {
              localHashMap1.put(localCodecKey1, Pair.create(str2, localCodecCapabilities));
              break;
            }
          }
        }
      }
    }
    return null;
  }

  private static boolean isAdaptive(MediaCodecInfo.CodecCapabilities paramCodecCapabilities)
  {
    if (Util.SDK_INT >= 19)
      return isAdaptiveV19(paramCodecCapabilities);
    return false;
  }

  @TargetApi(19)
  private static boolean isAdaptiveV19(MediaCodecInfo.CodecCapabilities paramCodecCapabilities)
  {
    return paramCodecCapabilities.isFeatureSupported("adaptive-playback");
  }

  public static boolean isH264ProfileSupported(int paramInt1, int paramInt2)
    throws MediaCodecUtil.DecoderQueryException
  {
    Pair localPair = getMediaCodecInfo("video/avc", false);
    if (localPair == null);
    while (true)
    {
      return false;
      MediaCodecInfo.CodecCapabilities localCodecCapabilities = (MediaCodecInfo.CodecCapabilities)localPair.second;
      for (int i = 0; i < localCodecCapabilities.profileLevels.length; i++)
      {
        MediaCodecInfo.CodecProfileLevel localCodecProfileLevel = localCodecCapabilities.profileLevels[i];
        if ((localCodecProfileLevel.profile == paramInt1) && (localCodecProfileLevel.level >= paramInt2))
          return true;
      }
    }
  }

  public static int maxH264DecodableFrameSize()
    throws MediaCodecUtil.DecoderQueryException
  {
    Pair localPair = getMediaCodecInfo("video/avc", false);
    int i = 0;
    if (localPair == null);
    while (true)
    {
      return i;
      i = 0;
      MediaCodecInfo.CodecCapabilities localCodecCapabilities = (MediaCodecInfo.CodecCapabilities)localPair.second;
      for (int j = 0; j < localCodecCapabilities.profileLevels.length; j++)
        i = Math.max(avcLevelToMaxFrameSize(localCodecCapabilities.profileLevels[j].level), i);
    }
  }

  public static void warmCodec(String paramString, boolean paramBoolean)
  {
    try
    {
      getMediaCodecInfo(paramString, paramBoolean);
      return;
    }
    catch (DecoderQueryException localDecoderQueryException)
    {
      while (true)
        Log.e("MediaCodecUtil", "Codec warming failed", localDecoderQueryException);
    }
    finally
    {
    }
  }

  private static final class CodecKey
  {
    public final String mimeType;
    public final boolean secure;

    public CodecKey(String paramString, boolean paramBoolean)
    {
      this.mimeType = paramString;
      this.secure = paramBoolean;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      CodecKey localCodecKey;
      do
      {
        return true;
        if ((paramObject == null) || (paramObject.getClass() != CodecKey.class))
          return false;
        localCodecKey = (CodecKey)paramObject;
      }
      while ((TextUtils.equals(this.mimeType, localCodecKey.mimeType)) && (this.secure == localCodecKey.secure));
      return false;
    }

    public int hashCode()
    {
      int i;
      int j;
      if (this.mimeType == null)
      {
        i = 0;
        j = 31 * (i + 31);
        if (!this.secure)
          break label43;
      }
      label43: for (int k = 1231; ; k = 1237)
      {
        return j + k;
        i = this.mimeType.hashCode();
        break;
      }
    }
  }

  public static class DecoderQueryException extends Exception
  {
    private DecoderQueryException(Throwable paramThrowable)
    {
      super(paramThrowable);
    }
  }

  private static abstract interface MediaCodecListCompat
  {
    public abstract int getCodecCount();

    public abstract MediaCodecInfo getCodecInfoAt(int paramInt);

    public abstract boolean isSecurePlaybackSupported(String paramString, MediaCodecInfo.CodecCapabilities paramCodecCapabilities);

    public abstract boolean secureDecodersExplicit();
  }

  private static final class MediaCodecListCompatV16
    implements MediaCodecUtil.MediaCodecListCompat
  {
    public int getCodecCount()
    {
      return MediaCodecList.getCodecCount();
    }

    public MediaCodecInfo getCodecInfoAt(int paramInt)
    {
      return MediaCodecList.getCodecInfoAt(paramInt);
    }

    public boolean isSecurePlaybackSupported(String paramString, MediaCodecInfo.CodecCapabilities paramCodecCapabilities)
    {
      return "video/avc".equals(paramString);
    }

    public boolean secureDecodersExplicit()
    {
      return false;
    }
  }

  @TargetApi(21)
  private static final class MediaCodecListCompatV21
    implements MediaCodecUtil.MediaCodecListCompat
  {
    private final int codecKind;
    private MediaCodecInfo[] mediaCodecInfos;

    public MediaCodecListCompatV21(boolean paramBoolean)
    {
      if (paramBoolean);
      for (int i = 1; ; i = 0)
      {
        this.codecKind = i;
        return;
      }
    }

    private void ensureMediaCodecInfosInitialized()
    {
      if (this.mediaCodecInfos == null)
        this.mediaCodecInfos = new MediaCodecList(this.codecKind).getCodecInfos();
    }

    public int getCodecCount()
    {
      ensureMediaCodecInfosInitialized();
      return this.mediaCodecInfos.length;
    }

    public MediaCodecInfo getCodecInfoAt(int paramInt)
    {
      ensureMediaCodecInfosInitialized();
      return this.mediaCodecInfos[paramInt];
    }

    public boolean isSecurePlaybackSupported(String paramString, MediaCodecInfo.CodecCapabilities paramCodecCapabilities)
    {
      return paramCodecCapabilities.isFeatureSupported("secure-playback");
    }

    public boolean secureDecodersExplicit()
    {
      return true;
    }
  }
}