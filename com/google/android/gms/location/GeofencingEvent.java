package com.google.android.gms.location;

import android.content.Intent;
import android.location.Location;
import com.google.android.gms.internal.zzpk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class GeofencingEvent
{
  private final int zzalV;
  private final List<Geofence> zzalW;
  private final Location zzalX;
  private final int zzvR;

  private GeofencingEvent(int paramInt1, int paramInt2, List<Geofence> paramList, Location paramLocation)
  {
    this.zzvR = paramInt1;
    this.zzalV = paramInt2;
    this.zzalW = paramList;
    this.zzalX = paramLocation;
  }

  public static GeofencingEvent fromIntent(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return new GeofencingEvent(paramIntent.getIntExtra("gms_error_code", -1), zzl(paramIntent), zzm(paramIntent), (Location)paramIntent.getParcelableExtra("com.google.android.location.intent.extra.triggering_location"));
  }

  private static int zzl(Intent paramIntent)
  {
    int i = paramIntent.getIntExtra("com.google.android.location.intent.extra.transition", -1);
    if (i == -1);
    while ((i != 1) && (i != 2) && (i != 4))
      return -1;
    return i;
  }

  private static List<Geofence> zzm(Intent paramIntent)
  {
    ArrayList localArrayList1 = (ArrayList)paramIntent.getSerializableExtra("com.google.android.location.intent.extra.geofence_list");
    if (localArrayList1 == null)
      return null;
    ArrayList localArrayList2 = new ArrayList(localArrayList1.size());
    Iterator localIterator = localArrayList1.iterator();
    while (localIterator.hasNext())
      localArrayList2.add(zzpk.zzi((byte[])localIterator.next()));
    return localArrayList2;
  }

  public int getErrorCode()
  {
    return this.zzvR;
  }

  public int getGeofenceTransition()
  {
    return this.zzalV;
  }

  public List<Geofence> getTriggeringGeofences()
  {
    return this.zzalW;
  }

  public Location getTriggeringLocation()
  {
    return this.zzalX;
  }

  public boolean hasError()
  {
    return this.zzvR != -1;
  }
}