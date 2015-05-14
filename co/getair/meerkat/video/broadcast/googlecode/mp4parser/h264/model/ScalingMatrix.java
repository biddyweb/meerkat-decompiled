package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model;

import java.util.Arrays;

public class ScalingMatrix
{
  public ScalingList[] ScalingList4x4;
  public ScalingList[] ScalingList8x8;

  public String toString()
  {
    StringBuilder localStringBuilder1 = new StringBuilder().append("ScalingMatrix{ScalingList4x4=");
    Object localObject1;
    StringBuilder localStringBuilder2;
    Object localObject2;
    if (this.ScalingList4x4 == null)
    {
      localObject1 = null;
      localStringBuilder2 = localStringBuilder1.append(localObject1).append("\n").append(", ScalingList8x8=");
      ScalingList[] arrayOfScalingList = this.ScalingList8x8;
      localObject2 = null;
      if (arrayOfScalingList != null)
        break label83;
    }
    while (true)
    {
      return localObject2 + "\n" + '}';
      localObject1 = Arrays.asList(this.ScalingList4x4);
      break;
      label83: localObject2 = Arrays.asList(this.ScalingList8x8);
    }
  }
}