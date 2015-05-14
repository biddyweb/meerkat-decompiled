package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

public class AudioSpecificConfig$sbr_header
{
  public boolean bs_alter_scale;
  public boolean bs_amp_res;
  public int bs_freq_scale;
  public boolean bs_header_extra_1;
  public boolean bs_header_extra_2;
  public boolean bs_interpol_freq;
  public int bs_limiter_bands;
  public int bs_limiter_gains;
  public int bs_noise_bands;
  public int bs_reserved;
  public boolean bs_smoothing_mode;
  public int bs_start_freq;
  public int bs_stop_freq;
  public int bs_xover_band;

  public AudioSpecificConfig$sbr_header(AudioSpecificConfig paramAudioSpecificConfig, BitReaderBuffer paramBitReaderBuffer)
  {
    this.bs_amp_res = paramBitReaderBuffer.readBool();
    this.bs_start_freq = paramBitReaderBuffer.readBits(4);
    this.bs_stop_freq = paramBitReaderBuffer.readBits(4);
    this.bs_xover_band = paramBitReaderBuffer.readBits(3);
    this.bs_reserved = paramBitReaderBuffer.readBits(2);
    this.bs_header_extra_1 = paramBitReaderBuffer.readBool();
    this.bs_header_extra_2 = paramBitReaderBuffer.readBool();
    if (this.bs_header_extra_1)
    {
      this.bs_freq_scale = paramBitReaderBuffer.readBits(2);
      this.bs_alter_scale = paramBitReaderBuffer.readBool();
      this.bs_noise_bands = paramBitReaderBuffer.readBits(2);
    }
    if (this.bs_header_extra_2)
    {
      this.bs_limiter_bands = paramBitReaderBuffer.readBits(2);
      this.bs_limiter_gains = paramBitReaderBuffer.readBits(2);
      this.bs_interpol_freq = paramBitReaderBuffer.readBool();
    }
    this.bs_smoothing_mode = paramBitReaderBuffer.readBool();
  }
}