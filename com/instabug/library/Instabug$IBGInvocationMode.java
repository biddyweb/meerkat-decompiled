package com.instabug.library;

public enum Instabug$IBGInvocationMode
{
  static
  {
    IBGInvocationModeBugReporter = new IBGInvocationMode("IBGInvocationModeBugReporter", 1);
    IBGInvocationModeFeedbackSender = new IBGInvocationMode("IBGInvocationModeFeedbackSender", 2);
    IBGInvocationMode[] arrayOfIBGInvocationMode = new IBGInvocationMode[3];
    arrayOfIBGInvocationMode[0] = IBGInvocationModeNA;
    arrayOfIBGInvocationMode[1] = IBGInvocationModeBugReporter;
    arrayOfIBGInvocationMode[2] = IBGInvocationModeFeedbackSender;
  }
}