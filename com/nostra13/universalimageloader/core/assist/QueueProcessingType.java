package com.nostra13.universalimageloader.core.assist;

public enum QueueProcessingType
{
  static
  {
    QueueProcessingType[] arrayOfQueueProcessingType = new QueueProcessingType[2];
    arrayOfQueueProcessingType[0] = FIFO;
    arrayOfQueueProcessingType[1] = LIFO;
  }
}