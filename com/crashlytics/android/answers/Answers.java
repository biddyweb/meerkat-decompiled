package com.crashlytics.android.answers;

import io.fabric.sdk.android.Fabric;

public class Answers extends AnswersKit
{
  public static Answers getInstance()
  {
    return (Answers)Fabric.getKit(Answers.class);
  }
}