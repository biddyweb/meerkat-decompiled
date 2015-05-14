package com.google.android.gms.games.multiplayer;

import com.google.android.gms.games.Player;
import java.util.ArrayList;

public final class ParticipantUtils
{
  public static String getParticipantId(ArrayList<Participant> paramArrayList, String paramString)
  {
    int i = paramArrayList.size();
    for (int j = 0; j < i; j++)
    {
      Participant localParticipant = (Participant)paramArrayList.get(j);
      Player localPlayer = localParticipant.getPlayer();
      if ((localPlayer != null) && (localPlayer.getPlayerId().equals(paramString)))
        return localParticipant.getParticipantId();
    }
    return null;
  }
}