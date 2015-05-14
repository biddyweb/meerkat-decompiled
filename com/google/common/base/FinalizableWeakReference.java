package com.google.common.base;

import java.lang.ref.WeakReference;

public abstract class FinalizableWeakReference<T> extends WeakReference<T>
  implements FinalizableReference
{
  protected FinalizableWeakReference(T paramT, FinalizableReferenceQueue paramFinalizableReferenceQueue)
  {
    super(paramT, paramFinalizableReferenceQueue.queue);
    paramFinalizableReferenceQueue.cleanUp();
  }
}