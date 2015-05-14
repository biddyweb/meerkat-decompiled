package com.google.android.gms.games.multiplayer;

public abstract interface OnInvitationReceivedListener
{
  public abstract void onInvitationReceived(Invitation paramInvitation);

  public abstract void onInvitationRemoved(String paramString);
}