package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.collect.MapMaker;
import com.google.common.collect.Sets;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class CycleDetectingLockFactory$LockGraphNode
{
  final Map<LockGraphNode, CycleDetectingLockFactory.ExampleStackTrace> allowedPriorLocks = new MapMaker().weakKeys().makeMap();
  final Map<LockGraphNode, CycleDetectingLockFactory.PotentialDeadlockException> disallowedPriorLocks = new MapMaker().weakKeys().makeMap();
  final String lockName;

  CycleDetectingLockFactory$LockGraphNode(String paramString)
  {
    this.lockName = ((String)Preconditions.checkNotNull(paramString));
  }

  @Nullable
  private CycleDetectingLockFactory.ExampleStackTrace findPathTo(LockGraphNode paramLockGraphNode, Set<LockGraphNode> paramSet)
  {
    CycleDetectingLockFactory.ExampleStackTrace localExampleStackTrace1;
    if (!paramSet.add(this))
      localExampleStackTrace1 = null;
    do
    {
      return localExampleStackTrace1;
      localExampleStackTrace1 = (CycleDetectingLockFactory.ExampleStackTrace)this.allowedPriorLocks.get(paramLockGraphNode);
    }
    while (localExampleStackTrace1 != null);
    Iterator localIterator = this.allowedPriorLocks.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      LockGraphNode localLockGraphNode = (LockGraphNode)localEntry.getKey();
      CycleDetectingLockFactory.ExampleStackTrace localExampleStackTrace2 = localLockGraphNode.findPathTo(paramLockGraphNode, paramSet);
      if (localExampleStackTrace2 != null)
      {
        CycleDetectingLockFactory.ExampleStackTrace localExampleStackTrace3 = new CycleDetectingLockFactory.ExampleStackTrace(localLockGraphNode, this);
        localExampleStackTrace3.setStackTrace(((CycleDetectingLockFactory.ExampleStackTrace)localEntry.getValue()).getStackTrace());
        localExampleStackTrace3.initCause(localExampleStackTrace2);
        return localExampleStackTrace3;
      }
    }
    return null;
  }

  void checkAcquiredLock(CycleDetectingLockFactory.Policy paramPolicy, LockGraphNode paramLockGraphNode)
  {
    boolean bool;
    String str1;
    if (this != paramLockGraphNode)
    {
      bool = true;
      str1 = String.valueOf(paramLockGraphNode.getLockName());
      if (str1.length() == 0)
        break label58;
    }
    label58: for (String str2 = "Attempted to acquire multiple locks with the same rank ".concat(str1); ; str2 = new String("Attempted to acquire multiple locks with the same rank "))
    {
      Preconditions.checkState(bool, str2);
      if (!this.allowedPriorLocks.containsKey(paramLockGraphNode))
        break label72;
      return;
      bool = false;
      break;
    }
    label72: CycleDetectingLockFactory.PotentialDeadlockException localPotentialDeadlockException1 = (CycleDetectingLockFactory.PotentialDeadlockException)this.disallowedPriorLocks.get(paramLockGraphNode);
    if (localPotentialDeadlockException1 != null)
    {
      paramPolicy.handlePotentialDeadlock(new CycleDetectingLockFactory.PotentialDeadlockException(paramLockGraphNode, this, localPotentialDeadlockException1.getConflictingStackTrace(), null));
      return;
    }
    CycleDetectingLockFactory.ExampleStackTrace localExampleStackTrace = paramLockGraphNode.findPathTo(this, Sets.newIdentityHashSet());
    if (localExampleStackTrace == null)
    {
      this.allowedPriorLocks.put(paramLockGraphNode, new CycleDetectingLockFactory.ExampleStackTrace(paramLockGraphNode, this));
      return;
    }
    CycleDetectingLockFactory.PotentialDeadlockException localPotentialDeadlockException2 = new CycleDetectingLockFactory.PotentialDeadlockException(paramLockGraphNode, this, localExampleStackTrace, null);
    this.disallowedPriorLocks.put(paramLockGraphNode, localPotentialDeadlockException2);
    paramPolicy.handlePotentialDeadlock(localPotentialDeadlockException2);
  }

  void checkAcquiredLocks(CycleDetectingLockFactory.Policy paramPolicy, List<LockGraphNode> paramList)
  {
    int i = 0;
    int j = paramList.size();
    while (i < j)
    {
      checkAcquiredLock(paramPolicy, (LockGraphNode)paramList.get(i));
      i++;
    }
  }

  String getLockName()
  {
    return this.lockName;
  }
}