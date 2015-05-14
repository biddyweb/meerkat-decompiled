package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read.CAVLCReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.write.CAVLCWriter;
import java.io.IOException;

public class ScalingList
{
  public int[] scalingList;
  public boolean useDefaultScalingMatrixFlag;

  public static ScalingList read(CAVLCReader paramCAVLCReader, int paramInt)
    throws IOException
  {
    ScalingList localScalingList = new ScalingList();
    localScalingList.scalingList = new int[paramInt];
    int i = 8;
    int j = 8;
    int k = 0;
    if (k < paramInt)
    {
      boolean bool;
      label67: int[] arrayOfInt;
      if (j != 0)
      {
        j = (256 + (i + paramCAVLCReader.readSE("deltaScale"))) % 256;
        if ((k == 0) && (j == 0))
        {
          bool = true;
          localScalingList.useDefaultScalingMatrixFlag = bool;
        }
      }
      else
      {
        arrayOfInt = localScalingList.scalingList;
        if (j != 0)
          break label110;
      }
      while (true)
      {
        arrayOfInt[k] = i;
        i = localScalingList.scalingList[k];
        k++;
        break;
        bool = false;
        break label67;
        label110: i = j;
      }
    }
    return localScalingList;
  }

  public String toString()
  {
    return "ScalingList{scalingList=" + this.scalingList + ", useDefaultScalingMatrixFlag=" + this.useDefaultScalingMatrixFlag + '}';
  }

  public void write(CAVLCWriter paramCAVLCWriter)
    throws IOException
  {
    if (this.useDefaultScalingMatrixFlag)
      paramCAVLCWriter.writeSE(0, "SPS: ");
    while (true)
    {
      return;
      int i = 8;
      for (int j = 0; j < this.scalingList.length; j++)
      {
        if (8 != 0)
          paramCAVLCWriter.writeSE(-256 + (this.scalingList[j] - i), "SPS: ");
        i = this.scalingList[j];
      }
    }
  }
}