package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.model;

public class ChromaFormat
{
  public static ChromaFormat MONOCHROME = new ChromaFormat(0, 0, 0);
  public static ChromaFormat YUV_420 = new ChromaFormat(1, 2, 2);
  public static ChromaFormat YUV_422 = new ChromaFormat(2, 2, 1);
  public static ChromaFormat YUV_444 = new ChromaFormat(3, 1, 1);
  private int id;
  private int subHeight;
  private int subWidth;

  public ChromaFormat(int paramInt1, int paramInt2, int paramInt3)
  {
    this.id = paramInt1;
    this.subWidth = paramInt2;
    this.subHeight = paramInt3;
  }

  public static ChromaFormat fromId(int paramInt)
  {
    if (paramInt == MONOCHROME.id)
      return MONOCHROME;
    if (paramInt == YUV_420.id)
      return YUV_420;
    if (paramInt == YUV_422.id)
      return YUV_422;
    if (paramInt == YUV_444.id)
      return YUV_444;
    return null;
  }

  public int getId()
  {
    return this.id;
  }

  public int getSubHeight()
  {
    return this.subHeight;
  }

  public int getSubWidth()
  {
    return this.subWidth;
  }

  public String toString()
  {
    return "ChromaFormat{\nid=" + this.id + ",\n" + " subWidth=" + this.subWidth + ",\n" + " subHeight=" + this.subHeight + '}';
  }
}