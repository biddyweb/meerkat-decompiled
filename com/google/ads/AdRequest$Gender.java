package com.google.ads;

public enum AdRequest$Gender
{
  static
  {
    MALE = new Gender("MALE", 1);
    FEMALE = new Gender("FEMALE", 2);
    Gender[] arrayOfGender = new Gender[3];
    arrayOfGender[0] = UNKNOWN;
    arrayOfGender[1] = MALE;
    arrayOfGender[2] = FEMALE;
  }
}