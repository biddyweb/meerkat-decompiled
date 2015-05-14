package co.getair.meerkat.facades;

import android.app.Activity;
import co.getair.meerkat.commands.addressbook_upload.AddressbookUploadStartupCommand;
import java.util.Map;

public class AddressbookUploadFacade extends BaseFacade
{
  protected AddressbookUploadFacade(Activity paramActivity)
  {
    super(paramActivity);
  }

  public static AddressbookUploadFacade getInst(Activity paramActivity)
  {
    String str = paramActivity.getClass().getName();
    if (instanceMap.get(str) == null)
      instanceMap.put(str, new AddressbookUploadFacade(paramActivity));
    return (AddressbookUploadFacade)instanceMap.get(str);
  }

  protected void initializeController()
  {
    super.initializeController();
    registerCommand("startup", new AddressbookUploadStartupCommand());
  }
}