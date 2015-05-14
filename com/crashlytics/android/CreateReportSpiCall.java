package com.crashlytics.android;

abstract interface CreateReportSpiCall
{
  public abstract boolean invoke(CreateReportRequest paramCreateReportRequest);
}