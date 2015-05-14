package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264;

public class CharCache
{
  private char[] cache;
  private int pos;

  public CharCache(int paramInt)
  {
    this.cache = new char[paramInt];
  }

  public void append(char paramChar)
  {
    if (this.pos < -1 + this.cache.length)
    {
      this.cache[this.pos] = paramChar;
      this.pos = (1 + this.pos);
    }
  }

  public void append(String paramString)
  {
    char[] arrayOfChar = paramString.toCharArray();
    int i = this.cache.length - this.pos;
    if (arrayOfChar.length < i);
    for (int j = arrayOfChar.length; ; j = i)
    {
      System.arraycopy(arrayOfChar, 0, this.cache, this.pos, j);
      this.pos = (j + this.pos);
      return;
    }
  }

  public void clear()
  {
    this.pos = 0;
  }

  public int length()
  {
    return this.pos;
  }

  public String toString()
  {
    return new String(this.cache, 0, this.pos);
  }
}