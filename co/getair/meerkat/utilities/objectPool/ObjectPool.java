package co.getair.meerkat.utilities.objectPool;

import java.util.ArrayList;

public class ObjectPool<T>
{
  private ArrayList<Boolean> locked;
  private ArrayList<T> objects;

  public ObjectPool()
  {
    this(new ArrayList());
  }

  public ObjectPool(int paramInt)
  {
    this(new ArrayList(paramInt));
  }

  public ObjectPool(ArrayList<T> paramArrayList)
  {
    this.objects = paramArrayList;
    this.locked = new ArrayList(paramArrayList.size());
  }

  public void add(T paramT)
  {
    try
    {
      this.objects.add(paramT);
      this.locked.add(Boolean.valueOf(false));
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public T get()
    throws NoUnlockedObjectException
  {
    int i = 0;
    try
    {
      while (i < this.locked.size())
      {
        if (!((Boolean)this.locked.get(i)).booleanValue())
        {
          this.locked.set(i, Boolean.valueOf(true));
          Object localObject2 = this.objects.get(i);
          return localObject2;
        }
        i++;
      }
      throw new NoUnlockedObjectException();
    }
    finally
    {
    }
  }

  public void release(T paramT)
    throws UnknownObjectException
  {
    int i;
    try
    {
      i = this.objects.indexOf(paramT);
      if (i < 0)
        throw new UnknownObjectException();
    }
    finally
    {
    }
    this.locked.set(i, Boolean.valueOf(false));
  }
}