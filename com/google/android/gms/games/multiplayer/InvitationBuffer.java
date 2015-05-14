package com.google.android.gms.games.multiplayer;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.zzg;

public final class InvitationBuffer extends zzg<Invitation>
{
  public InvitationBuffer(DataHolder paramDataHolder)
  {
    super(paramDataHolder);
  }

  protected String zziB()
  {
    return "external_invitation_id";
  }

  protected Invitation zzp(int paramInt1, int paramInt2)
  {
    return new InvitationRef(this.zzMd, paramInt1, paramInt2);
  }
}