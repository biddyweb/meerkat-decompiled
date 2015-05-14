package com.google.common.collect;

class TreeMultiset$1 extends Multisets.AbstractEntry<E>
{
  TreeMultiset$1(TreeMultiset paramTreeMultiset, TreeMultiset.AvlNode paramAvlNode)
  {
  }

  public int getCount()
  {
    int i = this.val$baseEntry.getCount();
    if (i == 0)
      i = this.this$0.count(getElement());
    return i;
  }

  public E getElement()
  {
    return this.val$baseEntry.getElement();
  }
}