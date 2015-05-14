package co.getair.meerkat.notifications;

import android.app.NotificationManager;
import android.content.Context;
import co.getair.meerkat.utilities.DiskWriter;
import java.util.ArrayList;
import java.util.List;

public class PendingNotificationsManager
{
  private static PendingNotificationsManager instance;
  private final int GROUP_NOTIFICAITONS_ID = 1;
  private final String PENDING_NOTIFICATIONS_MANAGER_KEY = "PendingNotificationsManagerFile";
  private Context context;
  private List<PendingNotification> pendingNotifications;

  private PendingNotificationsManager(Context paramContext)
  {
    Object localObject = (List)DiskWriter.getInstance().loadObject(paramContext, "PendingNotificationsManagerFile");
    if (localObject != null);
    while (true)
    {
      this.pendingNotifications = ((List)localObject);
      this.context = paramContext;
      return;
      localObject = new ArrayList();
    }
  }

  public static PendingNotificationsManager getInstance(Context paramContext)
  {
    try
    {
      if (instance == null)
        instance = new PendingNotificationsManager(paramContext);
      PendingNotificationsManager localPendingNotificationsManager = instance;
      return localPendingNotificationsManager;
    }
    finally
    {
    }
  }

  public void addNotification(PendingNotification paramPendingNotification)
  {
    this.pendingNotifications.add(0, paramPendingNotification);
    DiskWriter.getInstance().saveObject(this.context, this.pendingNotifications, "PendingNotificationsManagerFile");
  }

  public void cleanNotificationCenter()
  {
    this.pendingNotifications.clear();
    ((NotificationManager)this.context.getSystemService("notification")).cancel(1);
  }

  public int getGroupNotificationsId()
  {
    return 1;
  }

  public String getGroupedNotificationTitle()
  {
    if (getPendingNotifications().size() > 1)
      return getPendingNotifications().size() + " people are live now";
    return "Live now";
  }

  public List<PendingNotification> getPendingNotifications()
  {
    return this.pendingNotifications;
  }
}