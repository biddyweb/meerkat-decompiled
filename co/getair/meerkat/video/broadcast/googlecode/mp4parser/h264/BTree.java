package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264;

public class BTree
{
  private BTree one;
  private Object value;
  private BTree zero;

  public void addString(String paramString, Object paramObject)
  {
    if (paramString.length() == 0)
    {
      this.value = paramObject;
      return;
    }
    if (paramString.charAt(0) == '0')
      if (this.zero == null)
        this.zero = new BTree();
    for (BTree localBTree = this.zero; ; localBTree = this.one)
    {
      localBTree.addString(paramString.substring(1), paramObject);
      return;
      if (this.one == null)
        this.one = new BTree();
    }
  }

  public BTree down(int paramInt)
  {
    if (paramInt == 0)
      return this.zero;
    return this.one;
  }

  public Object getValue()
  {
    return this.value;
  }
}