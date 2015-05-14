package co.getair.meerkat.dtos.watch_broadcast;

public class WatchersCountParams
{
  int currentWatchersCount;
  int totalWatchersCount;

  public WatchersCountParams(int paramInt1, int paramInt2)
  {
    this.currentWatchersCount = paramInt1;
    this.totalWatchersCount = paramInt2;
  }

  public int getCurrentWatchersCount()
  {
    return this.currentWatchersCount;
  }

  public int getTotalWatchersCount()
  {
    return this.totalWatchersCount;
  }
}