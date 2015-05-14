package co.getair.meerkat.dtos.feed;

import com.google.common.base.Optional;
import java.util.ArrayList;
import java.util.List;

public class ScheduledBroadcastSummary extends BroadcastSummary
{
  private ScheduledBroadcastSummary.Location location;
  private ArrayList<String> subscribers;

  public Optional<String> getLocation()
  {
    Optional localOptional = Optional.fromNullable(this.location);
    if (localOptional.isPresent())
      return Optional.of(ScheduledBroadcastSummary.Location.access$100((ScheduledBroadcastSummary.Location)localOptional.get()) + ", " + ScheduledBroadcastSummary.Location.access$000((ScheduledBroadcastSummary.Location)localOptional.get()));
    return Optional.absent();
  }

  public List<String> getSubscribers()
  {
    return this.subscribers;
  }
}