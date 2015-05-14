package co.getair.meerkat.dtos;

public class ActivationCodeParams
{
  String activationCode;
  String phoneNumber;

  public ActivationCodeParams(String paramString1, String paramString2)
  {
    this.phoneNumber = paramString1;
    this.activationCode = paramString2;
  }

  public String getActivationCode()
  {
    return this.activationCode;
  }

  public String getPhoneNumber()
  {
    return this.phoneNumber;
  }
}