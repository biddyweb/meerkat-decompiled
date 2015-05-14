package rx.internal.util.unsafe;

abstract interface MessagePassingQueue<M>
{
  public abstract boolean isEmpty();

  public abstract boolean offer(M paramM);

  public abstract M peek();

  public abstract M poll();

  public abstract int size();
}