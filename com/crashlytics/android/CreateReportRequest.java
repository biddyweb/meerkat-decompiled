package com.crashlytics.android;

class CreateReportRequest
{
  public final String apiKey;
  public final Report report;

  public CreateReportRequest(String paramString, Report paramReport)
  {
    this.apiKey = paramString;
    this.report = paramReport;
  }
}