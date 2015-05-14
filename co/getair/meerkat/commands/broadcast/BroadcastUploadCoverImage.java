package co.getair.meerkat.commands.broadcast;

import android.graphics.Bitmap;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.proxies.BroadcastProxy;
import org.puremvc.java.multicore.interfaces.INotification;
import org.puremvc.java.multicore.patterns.command.SimpleCommand;

public class BroadcastUploadCoverImage extends SimpleCommand
{
  private BaseFacade getBaseFacade()
  {
    return (BaseFacade)getFacade();
  }

  public void execute(INotification paramINotification)
  {
    super.execute(paramINotification);
    Bitmap localBitmap = (Bitmap)paramINotification.getBody();
    ((BroadcastProxy)getBaseFacade().retrieveProxy("broadcastProxy")).uploadCoverImage(localBitmap);
  }
}