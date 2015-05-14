package co.getair.meerkat.dtos.watch_broadcast;

public class StreamStats
{
  int commentsCount = 0;
  int likesCount = 0;
  int restreamsCount = 0;
  int watchersCount = 0;

  public StreamStats()
  {
  }

  public StreamStats(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    this.commentsCount = paramInt1;
    this.likesCount = paramInt2;
    this.restreamsCount = paramInt3;
    this.watchersCount = paramInt4;
  }

  public int getCommentsCount()
  {
    return this.commentsCount;
  }

  public int getLikesCount()
  {
    return this.likesCount;
  }

  public int getRestreamsCount()
  {
    return this.restreamsCount;
  }

  public int getWatchersCount()
  {
    return this.watchersCount;
  }
}