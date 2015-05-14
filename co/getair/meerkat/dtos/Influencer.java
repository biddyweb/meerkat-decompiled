package co.getair.meerkat.dtos;

import co.getair.meerkat.MeerkatApplication;
import co.getair.meerkat.facades.ApplicationFacade;
import co.getair.meerkat.proxies.GraphProxy;

public class Influencer
{
  String displayName;
  String id;
  Type type;
  String userName;

  public Influencer(String paramString)
  {
    String[] arrayOfString = paramString.split(":");
    this.type = stringToType(arrayOfString[0]);
    this.id = arrayOfString[1];
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    this.displayName = localGraphProxy.getFollowedDisplayNameForUserId(this.id);
    this.userName = localGraphProxy.getFollowedUsernameForUserId(this.id);
  }

  private Type stringToType(String paramString)
  {
    if (paramString.equals("b"))
      return Type.InfluencerTypeBroadcaster;
    if (paramString.equals("r"))
      return Type.InfluencerTypeRestreamer;
    if (paramString.equals("l"))
      return Type.InfluencerTypeLiker;
    if (paramString.equals("f"))
      return Type.InfluencerTypeFeatured;
    return Type.InfluencerTypeNone;
  }

  public String getDisplayName()
  {
    return this.displayName;
  }

  public String getId()
  {
    return this.id;
  }

  public Type getType()
  {
    return this.type;
  }

  public String getUserName()
  {
    return this.userName;
  }

  public boolean isMe()
  {
    return ((GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy")).getMyUser().getId().equals(getId());
  }

  public boolean isRelevantForMe()
  {
    GraphProxy localGraphProxy = (GraphProxy)ApplicationFacade.getInst(MeerkatApplication.getName()).retrieveProxy("graphProxy");
    return (getType() == Type.InfluencerTypeFeatured) || (localGraphProxy.amIFollowingUser(getId()));
  }

  public static enum Type
  {
    static
    {
      InfluencerTypeFeatured = new Type("InfluencerTypeFeatured", 1);
      InfluencerTypeLiker = new Type("InfluencerTypeLiker", 2);
      InfluencerTypeRestreamer = new Type("InfluencerTypeRestreamer", 3);
      InfluencerTypeBroadcaster = new Type("InfluencerTypeBroadcaster", 4);
      Type[] arrayOfType = new Type[5];
      arrayOfType[0] = InfluencerTypeNone;
      arrayOfType[1] = InfluencerTypeFeatured;
      arrayOfType[2] = InfluencerTypeLiker;
      arrayOfType[3] = InfluencerTypeRestreamer;
      arrayOfType[4] = InfluencerTypeBroadcaster;
    }
  }
}