package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

public class AudioSpecificConfig$ELDSpecificConfig
{
  private static final int ELDEXT_TERM;
  public boolean aacScalefactorDataResilienceFlag;
  public boolean aacSectionDataResilienceFlag;
  public boolean aacSpectralDataResilienceFlag;
  public boolean frameLengthFlag;
  public boolean ldSbrCrcFlag;
  public boolean ldSbrPresentFlag;
  public boolean ldSbrSamplingRate;

  public AudioSpecificConfig$ELDSpecificConfig(AudioSpecificConfig paramAudioSpecificConfig, int paramInt, BitReaderBuffer paramBitReaderBuffer)
  {
    this.frameLengthFlag = paramBitReaderBuffer.readBool();
    this.aacSectionDataResilienceFlag = paramBitReaderBuffer.readBool();
    this.aacScalefactorDataResilienceFlag = paramBitReaderBuffer.readBool();
    this.aacSpectralDataResilienceFlag = paramBitReaderBuffer.readBool();
    this.ldSbrPresentFlag = paramBitReaderBuffer.readBool();
    if (this.ldSbrPresentFlag)
    {
      this.ldSbrSamplingRate = paramBitReaderBuffer.readBool();
      this.ldSbrCrcFlag = paramBitReaderBuffer.readBool();
      ld_sbr_header(paramInt, paramBitReaderBuffer);
    }
    while (paramBitReaderBuffer.readBits(4) != 0)
    {
      int i = paramBitReaderBuffer.readBits(4);
      int j = i;
      int k = 0;
      if (i == 15)
      {
        k = paramBitReaderBuffer.readBits(8);
        j += k;
      }
      if (k == 255)
        j += paramBitReaderBuffer.readBits(16);
      for (int m = 0; m < j; m++)
        paramBitReaderBuffer.readBits(8);
    }
  }

  public void ld_sbr_header(int paramInt, BitReaderBuffer paramBitReaderBuffer)
  {
    int i;
    switch (paramInt)
    {
    default:
      i = 0;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    }
    while (true)
    {
      for (int j = 0; j < i; j++)
        new AudioSpecificConfig.sbr_header(this.this$0, paramBitReaderBuffer);
      i = 1;
      continue;
      i = 2;
      continue;
      i = 3;
      continue;
      i = 4;
    }
  }
}