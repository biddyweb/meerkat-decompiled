package co.getair.meerkat.notifications;

public class PendingNotification
{
  private String notificationText;
  private long timestamp;

  public PendingNotification(String paramString, long paramLong)
  {
    this.notificationText = paramString;
    this.timestamp = paramLong;
  }

  public String getNotificationText()
  {
    return this.notificationText;
  }

  public long getTimestamp()
  {
    return this.timestamp;
  }
}