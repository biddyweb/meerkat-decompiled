package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

@Immutable
final class AbstractService$StateSnapshot
{

  @Nullable
  final Throwable failure;
  final boolean shutdownWhenStartupFinishes;
  final Service.State state;

  AbstractService$StateSnapshot(Service.State paramState)
  {
    this(paramState, false, null);
  }

  AbstractService$StateSnapshot(Service.State paramState, boolean paramBoolean, @Nullable Throwable paramThrowable)
  {
    boolean bool1;
    int i;
    label40: int j;
    if ((!paramBoolean) || (paramState == Service.State.STARTING))
    {
      bool1 = true;
      Preconditions.checkArgument(bool1, "shudownWhenStartupFinishes can only be set if state is STARTING. Got %s instead.", new Object[] { paramState });
      if (paramThrowable == null)
        break label102;
      i = 1;
      if (paramState != Service.State.FAILED)
        break label108;
      j = 1;
      label50: if ((i ^ j) != 0)
        break label114;
    }
    label102: label108: label114: for (boolean bool2 = true; ; bool2 = false)
    {
      Preconditions.checkArgument(bool2, "A failure cause should be set if and only if the state is failed.  Got %s and %s instead.", new Object[] { paramState, paramThrowable });
      this.state = paramState;
      this.shutdownWhenStartupFinishes = paramBoolean;
      this.failure = paramThrowable;
      return;
      bool1 = false;
      break;
      i = 0;
      break label40;
      j = 0;
      break label50;
    }
  }

  Service.State externalState()
  {
    if ((this.shutdownWhenStartupFinishes) && (this.state == Service.State.STARTING))
      return Service.State.STOPPING;
    return this.state;
  }

  Throwable failureCause()
  {
    if (this.state == Service.State.FAILED);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = this.state;
      Preconditions.checkState(bool, "failureCause() is only valid if the service has failed, service is %s", arrayOfObject);
      return this.failure;
    }
  }
}