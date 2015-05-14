package com.google.android.gms.games.multiplayer.realtime;

public abstract interface RoomUpdateListener
{
  public abstract void onJoinedRoom(int paramInt, Room paramRoom);

  public abstract void onLeftRoom(int paramInt, String paramString);

  public abstract void onRoomConnected(int paramInt, Room paramRoom);

  public abstract void onRoomCreated(int paramInt, Room paramRoom);
}