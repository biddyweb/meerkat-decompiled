package com.google.android.gms.games.request;

public abstract interface OnRequestReceivedListener
{
  public abstract void onRequestReceived(GameRequest paramGameRequest);

  public abstract void onRequestRemoved(String paramString);
}