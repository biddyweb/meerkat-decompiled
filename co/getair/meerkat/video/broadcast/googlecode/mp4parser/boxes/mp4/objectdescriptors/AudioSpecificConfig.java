package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Descriptor(objectTypeIndication=64, tags={5})
public class AudioSpecificConfig extends BaseDescriptor
{
  public static Map<Integer, String> audioObjectTypeMap;
  public static Map<Integer, Integer> samplingFrequencyIndexMap = new HashMap();
  public boolean aacScalefactorDataResilienceFlag;
  public boolean aacSectionDataResilienceFlag;
  public boolean aacSpectralDataResilienceFlag;
  public int audioObjectType;
  public int channelConfiguration;
  byte[] configBytes;
  public int coreCoderDelay;
  public int dependsOnCoreCoder;
  public int directMapping;
  public AudioSpecificConfig.ELDSpecificConfig eldSpecificConfig;
  public int epConfig;
  public int erHvxcExtensionFlag;
  public int extensionAudioObjectType;
  public int extensionChannelConfiguration;
  public int extensionFlag;
  public int extensionFlag3;
  public int extensionSamplingFrequency;
  public int extensionSamplingFrequencyIndex;
  public int fillBits;
  public int frameLengthFlag;
  public boolean gaSpecificConfig;
  public int hilnContMode;
  public int hilnEnhaLayer;
  public int hilnEnhaQuantMode;
  public int hilnFrameLength;
  public int hilnMaxNumLine;
  public int hilnQuantMode;
  public int hilnSampleRateCode;
  public int hvxcRateMode;
  public int hvxcVarMode;
  public int isBaseLayer;
  public int layerNr;
  public int layer_length;
  public int numOfSubFrame;
  public int paraExtensionFlag;
  public int paraMode;
  public boolean parametricSpecificConfig;
  public boolean psPresentFlag;
  public int sacPayloadEmbedding;
  public int samplingFrequency;
  public int samplingFrequencyIndex;
  public boolean sbrPresentFlag;
  public int syncExtensionType;
  public int var_ScalableFlag;

  static
  {
    audioObjectTypeMap = new HashMap();
    samplingFrequencyIndexMap.put(Integer.valueOf(0), Integer.valueOf(96000));
    samplingFrequencyIndexMap.put(Integer.valueOf(1), Integer.valueOf(88200));
    samplingFrequencyIndexMap.put(Integer.valueOf(2), Integer.valueOf(64000));
    samplingFrequencyIndexMap.put(Integer.valueOf(3), Integer.valueOf(48000));
    samplingFrequencyIndexMap.put(Integer.valueOf(4), Integer.valueOf(44100));
    samplingFrequencyIndexMap.put(Integer.valueOf(5), Integer.valueOf(32000));
    samplingFrequencyIndexMap.put(Integer.valueOf(6), Integer.valueOf(24000));
    samplingFrequencyIndexMap.put(Integer.valueOf(7), Integer.valueOf(22050));
    samplingFrequencyIndexMap.put(Integer.valueOf(8), Integer.valueOf(16000));
    samplingFrequencyIndexMap.put(Integer.valueOf(9), Integer.valueOf(12000));
    samplingFrequencyIndexMap.put(Integer.valueOf(10), Integer.valueOf(11025));
    samplingFrequencyIndexMap.put(Integer.valueOf(11), Integer.valueOf(8000));
    audioObjectTypeMap.put(Integer.valueOf(1), "AAC main");
    audioObjectTypeMap.put(Integer.valueOf(2), "AAC LC");
    audioObjectTypeMap.put(Integer.valueOf(3), "AAC SSR");
    audioObjectTypeMap.put(Integer.valueOf(4), "AAC LTP");
    audioObjectTypeMap.put(Integer.valueOf(5), "SBR");
    audioObjectTypeMap.put(Integer.valueOf(6), "AAC Scalable");
    audioObjectTypeMap.put(Integer.valueOf(7), "TwinVQ");
    audioObjectTypeMap.put(Integer.valueOf(8), "CELP");
    audioObjectTypeMap.put(Integer.valueOf(9), "HVXC");
    audioObjectTypeMap.put(Integer.valueOf(10), "(reserved)");
    audioObjectTypeMap.put(Integer.valueOf(11), "(reserved)");
    audioObjectTypeMap.put(Integer.valueOf(12), "TTSI");
    audioObjectTypeMap.put(Integer.valueOf(13), "Main synthetic");
    audioObjectTypeMap.put(Integer.valueOf(14), "Wavetable synthesis");
    audioObjectTypeMap.put(Integer.valueOf(15), "General MIDI");
    audioObjectTypeMap.put(Integer.valueOf(16), "Algorithmic Synthesis and Audio FX");
    audioObjectTypeMap.put(Integer.valueOf(17), "ER AAC LC");
    audioObjectTypeMap.put(Integer.valueOf(18), "(reserved)");
    audioObjectTypeMap.put(Integer.valueOf(19), "ER AAC LTP");
    audioObjectTypeMap.put(Integer.valueOf(20), "ER AAC Scalable");
    audioObjectTypeMap.put(Integer.valueOf(21), "ER TwinVQ");
    audioObjectTypeMap.put(Integer.valueOf(22), "ER BSAC");
    audioObjectTypeMap.put(Integer.valueOf(23), "ER AAC LD");
    audioObjectTypeMap.put(Integer.valueOf(24), "ER CELP");
    audioObjectTypeMap.put(Integer.valueOf(25), "ER HVXC");
    audioObjectTypeMap.put(Integer.valueOf(26), "ER HILN");
    audioObjectTypeMap.put(Integer.valueOf(27), "ER Parametric");
    audioObjectTypeMap.put(Integer.valueOf(28), "SSC");
    audioObjectTypeMap.put(Integer.valueOf(29), "PS");
    audioObjectTypeMap.put(Integer.valueOf(30), "MPEG Surround");
    audioObjectTypeMap.put(Integer.valueOf(31), "(escape)");
    audioObjectTypeMap.put(Integer.valueOf(32), "Layer-1");
    audioObjectTypeMap.put(Integer.valueOf(33), "Layer-2");
    audioObjectTypeMap.put(Integer.valueOf(34), "Layer-3");
    audioObjectTypeMap.put(Integer.valueOf(35), "DST");
    audioObjectTypeMap.put(Integer.valueOf(36), "ALS");
    audioObjectTypeMap.put(Integer.valueOf(37), "SLS");
    audioObjectTypeMap.put(Integer.valueOf(38), "SLS non-core");
    audioObjectTypeMap.put(Integer.valueOf(39), "ER AAC ELD");
    audioObjectTypeMap.put(Integer.valueOf(40), "SMR Simple");
    audioObjectTypeMap.put(Integer.valueOf(41), "SMR Main");
  }

  private int gaSpecificConfigSize()
  {
    return 0;
  }

  private int getAudioObjectType(BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    int i = paramBitReaderBuffer.readBits(5);
    if (i == 31)
      i = 32 + paramBitReaderBuffer.readBits(6);
    return i;
  }

  private void parseErHvxcConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.hvxcVarMode = paramBitReaderBuffer.readBits(1);
    this.hvxcRateMode = paramBitReaderBuffer.readBits(2);
    this.erHvxcExtensionFlag = paramBitReaderBuffer.readBits(1);
    if (this.erHvxcExtensionFlag == 1)
      this.var_ScalableFlag = paramBitReaderBuffer.readBits(1);
  }

  private void parseGaSpecificConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.frameLengthFlag = paramBitReaderBuffer.readBits(1);
    this.dependsOnCoreCoder = paramBitReaderBuffer.readBits(1);
    if (this.dependsOnCoreCoder == 1)
      this.coreCoderDelay = paramBitReaderBuffer.readBits(14);
    this.extensionFlag = paramBitReaderBuffer.readBits(1);
    if (paramInt2 == 0)
      throw new UnsupportedOperationException("can't parse program_config_element yet");
    if ((paramInt3 == 6) || (paramInt3 == 20))
      this.layerNr = paramBitReaderBuffer.readBits(3);
    if (this.extensionFlag == 1)
    {
      if (paramInt3 == 22)
      {
        this.numOfSubFrame = paramBitReaderBuffer.readBits(5);
        this.layer_length = paramBitReaderBuffer.readBits(11);
      }
      if ((paramInt3 == 17) || (paramInt3 == 19) || (paramInt3 == 20) || (paramInt3 == 23))
      {
        this.aacSectionDataResilienceFlag = paramBitReaderBuffer.readBool();
        this.aacScalefactorDataResilienceFlag = paramBitReaderBuffer.readBool();
        this.aacSpectralDataResilienceFlag = paramBitReaderBuffer.readBool();
      }
      this.extensionFlag3 = paramBitReaderBuffer.readBits(1);
      if (this.extensionFlag3 != 1);
    }
    this.gaSpecificConfig = true;
  }

  private void parseHilnConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.hilnQuantMode = paramBitReaderBuffer.readBits(1);
    this.hilnMaxNumLine = paramBitReaderBuffer.readBits(8);
    this.hilnSampleRateCode = paramBitReaderBuffer.readBits(4);
    this.hilnFrameLength = paramBitReaderBuffer.readBits(12);
    this.hilnContMode = paramBitReaderBuffer.readBits(2);
  }

  private void parseHilnEnexConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.hilnEnhaLayer = paramBitReaderBuffer.readBits(1);
    if (this.hilnEnhaLayer == 1)
      this.hilnEnhaQuantMode = paramBitReaderBuffer.readBits(2);
  }

  private void parseParaConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.paraMode = paramBitReaderBuffer.readBits(2);
    if (this.paraMode != 1)
      parseErHvxcConfig(paramInt1, paramInt2, paramInt3, paramBitReaderBuffer);
    if (this.paraMode != 0)
      parseHilnConfig(paramInt1, paramInt2, paramInt3, paramBitReaderBuffer);
    this.paraExtensionFlag = paramBitReaderBuffer.readBits(1);
    this.parametricSpecificConfig = true;
  }

  private void parseParametricSpecificConfig(int paramInt1, int paramInt2, int paramInt3, BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    this.isBaseLayer = paramBitReaderBuffer.readBits(1);
    if (this.isBaseLayer == 1)
    {
      parseParaConfig(paramInt1, paramInt2, paramInt3, paramBitReaderBuffer);
      return;
    }
    parseHilnEnexConfig(paramInt1, paramInt2, paramInt3, paramBitReaderBuffer);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    AudioSpecificConfig localAudioSpecificConfig;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localAudioSpecificConfig = (AudioSpecificConfig)paramObject;
      if (this.aacScalefactorDataResilienceFlag != localAudioSpecificConfig.aacScalefactorDataResilienceFlag)
        return false;
      if (this.aacSectionDataResilienceFlag != localAudioSpecificConfig.aacSectionDataResilienceFlag)
        return false;
      if (this.aacSpectralDataResilienceFlag != localAudioSpecificConfig.aacSpectralDataResilienceFlag)
        return false;
      if (this.audioObjectType != localAudioSpecificConfig.audioObjectType)
        return false;
      if (this.channelConfiguration != localAudioSpecificConfig.channelConfiguration)
        return false;
      if (this.coreCoderDelay != localAudioSpecificConfig.coreCoderDelay)
        return false;
      if (this.dependsOnCoreCoder != localAudioSpecificConfig.dependsOnCoreCoder)
        return false;
      if (this.directMapping != localAudioSpecificConfig.directMapping)
        return false;
      if (this.epConfig != localAudioSpecificConfig.epConfig)
        return false;
      if (this.erHvxcExtensionFlag != localAudioSpecificConfig.erHvxcExtensionFlag)
        return false;
      if (this.extensionAudioObjectType != localAudioSpecificConfig.extensionAudioObjectType)
        return false;
      if (this.extensionChannelConfiguration != localAudioSpecificConfig.extensionChannelConfiguration)
        return false;
      if (this.extensionFlag != localAudioSpecificConfig.extensionFlag)
        return false;
      if (this.extensionFlag3 != localAudioSpecificConfig.extensionFlag3)
        return false;
      if (this.extensionSamplingFrequency != localAudioSpecificConfig.extensionSamplingFrequency)
        return false;
      if (this.extensionSamplingFrequencyIndex != localAudioSpecificConfig.extensionSamplingFrequencyIndex)
        return false;
      if (this.fillBits != localAudioSpecificConfig.fillBits)
        return false;
      if (this.frameLengthFlag != localAudioSpecificConfig.frameLengthFlag)
        return false;
      if (this.gaSpecificConfig != localAudioSpecificConfig.gaSpecificConfig)
        return false;
      if (this.hilnContMode != localAudioSpecificConfig.hilnContMode)
        return false;
      if (this.hilnEnhaLayer != localAudioSpecificConfig.hilnEnhaLayer)
        return false;
      if (this.hilnEnhaQuantMode != localAudioSpecificConfig.hilnEnhaQuantMode)
        return false;
      if (this.hilnFrameLength != localAudioSpecificConfig.hilnFrameLength)
        return false;
      if (this.hilnMaxNumLine != localAudioSpecificConfig.hilnMaxNumLine)
        return false;
      if (this.hilnQuantMode != localAudioSpecificConfig.hilnQuantMode)
        return false;
      if (this.hilnSampleRateCode != localAudioSpecificConfig.hilnSampleRateCode)
        return false;
      if (this.hvxcRateMode != localAudioSpecificConfig.hvxcRateMode)
        return false;
      if (this.hvxcVarMode != localAudioSpecificConfig.hvxcVarMode)
        return false;
      if (this.isBaseLayer != localAudioSpecificConfig.isBaseLayer)
        return false;
      if (this.layerNr != localAudioSpecificConfig.layerNr)
        return false;
      if (this.layer_length != localAudioSpecificConfig.layer_length)
        return false;
      if (this.numOfSubFrame != localAudioSpecificConfig.numOfSubFrame)
        return false;
      if (this.paraExtensionFlag != localAudioSpecificConfig.paraExtensionFlag)
        return false;
      if (this.paraMode != localAudioSpecificConfig.paraMode)
        return false;
      if (this.parametricSpecificConfig != localAudioSpecificConfig.parametricSpecificConfig)
        return false;
      if (this.psPresentFlag != localAudioSpecificConfig.psPresentFlag)
        return false;
      if (this.sacPayloadEmbedding != localAudioSpecificConfig.sacPayloadEmbedding)
        return false;
      if (this.samplingFrequency != localAudioSpecificConfig.samplingFrequency)
        return false;
      if (this.samplingFrequencyIndex != localAudioSpecificConfig.samplingFrequencyIndex)
        return false;
      if (this.sbrPresentFlag != localAudioSpecificConfig.sbrPresentFlag)
        return false;
      if (this.syncExtensionType != localAudioSpecificConfig.syncExtensionType)
        return false;
      if (this.var_ScalableFlag != localAudioSpecificConfig.var_ScalableFlag)
        return false;
    }
    while (Arrays.equals(this.configBytes, localAudioSpecificConfig.configBytes));
    return false;
  }

  public int getAudioObjectType()
  {
    return this.audioObjectType;
  }

  public int getChannelConfiguration()
  {
    return this.channelConfiguration;
  }

  public byte[] getConfigBytes()
  {
    return this.configBytes;
  }

  public int getExtensionAudioObjectType()
  {
    return this.extensionAudioObjectType;
  }

  public int getSamplingFrequency()
  {
    if (this.samplingFrequencyIndex == 15)
      return this.samplingFrequency;
    return ((Integer)samplingFrequencyIndexMap.get(Integer.valueOf(this.samplingFrequencyIndex))).intValue();
  }

  public int hashCode()
  {
    int i = 1;
    int j;
    int m;
    label72: int i1;
    label91: int i3;
    label231: int i5;
    label251: int i7;
    label271: int i9;
    label299: int i10;
    if (this.configBytes != null)
    {
      j = Arrays.hashCode(this.configBytes);
      int k = 31 * (31 * (31 * (31 * (31 * (j * 31 + this.audioObjectType) + this.samplingFrequencyIndex) + this.samplingFrequency) + this.channelConfiguration) + this.extensionAudioObjectType);
      if (!this.sbrPresentFlag)
        break label438;
      m = i;
      int n = 31 * (k + m);
      if (!this.psPresentFlag)
        break label444;
      i1 = i;
      int i2 = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (n + i1) + this.extensionSamplingFrequencyIndex) + this.extensionSamplingFrequency) + this.extensionChannelConfiguration) + this.sacPayloadEmbedding) + this.fillBits) + this.epConfig) + this.directMapping) + this.syncExtensionType) + this.frameLengthFlag) + this.dependsOnCoreCoder) + this.coreCoderDelay) + this.extensionFlag) + this.layerNr) + this.numOfSubFrame) + this.layer_length);
      if (!this.aacSectionDataResilienceFlag)
        break label450;
      i3 = i;
      int i4 = 31 * (i2 + i3);
      if (!this.aacScalefactorDataResilienceFlag)
        break label456;
      i5 = i;
      int i6 = 31 * (i4 + i5);
      if (!this.aacSpectralDataResilienceFlag)
        break label462;
      i7 = i;
      int i8 = 31 * (31 * (i6 + i7) + this.extensionFlag3);
      if (!this.gaSpecificConfig)
        break label468;
      i9 = i;
      i10 = 31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (31 * (i8 + i9) + this.isBaseLayer) + this.paraMode) + this.paraExtensionFlag) + this.hvxcVarMode) + this.hvxcRateMode) + this.erHvxcExtensionFlag) + this.var_ScalableFlag) + this.hilnQuantMode) + this.hilnMaxNumLine) + this.hilnSampleRateCode) + this.hilnFrameLength) + this.hilnContMode) + this.hilnEnhaLayer) + this.hilnEnhaQuantMode);
      if (!this.parametricSpecificConfig)
        break label474;
    }
    while (true)
    {
      return i10 + i;
      j = 0;
      break;
      label438: m = 0;
      break label72;
      label444: i1 = 0;
      break label91;
      label450: i3 = 0;
      break label231;
      label456: i5 = 0;
      break label251;
      label462: i7 = 0;
      break label271;
      label468: i9 = 0;
      break label299;
      label474: i = 0;
    }
  }

  public void parseDetail(ByteBuffer paramByteBuffer)
    throws IOException
  {
    ByteBuffer localByteBuffer = paramByteBuffer.slice();
    localByteBuffer.limit(this.sizeOfInstance);
    paramByteBuffer.position(paramByteBuffer.position() + this.sizeOfInstance);
    this.configBytes = new byte[this.sizeOfInstance];
    localByteBuffer.get(this.configBytes);
    localByteBuffer.rewind();
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(localByteBuffer);
    this.audioObjectType = getAudioObjectType(localBitReaderBuffer);
    this.samplingFrequencyIndex = localBitReaderBuffer.readBits(4);
    if (this.samplingFrequencyIndex == 15)
      this.samplingFrequency = localBitReaderBuffer.readBits(24);
    this.channelConfiguration = localBitReaderBuffer.readBits(4);
    if ((this.audioObjectType == 5) || (this.audioObjectType == 29))
    {
      this.extensionAudioObjectType = 5;
      this.sbrPresentFlag = true;
      if (this.audioObjectType == 29)
        this.psPresentFlag = true;
      this.extensionSamplingFrequencyIndex = localBitReaderBuffer.readBits(4);
      if (this.extensionSamplingFrequencyIndex == 15)
        this.extensionSamplingFrequency = localBitReaderBuffer.readBits(24);
      this.audioObjectType = getAudioObjectType(localBitReaderBuffer);
      if (this.audioObjectType == 22)
        this.extensionChannelConfiguration = localBitReaderBuffer.readBits(4);
      switch (this.audioObjectType)
      {
      case 5:
      case 10:
      case 11:
      case 18:
      case 29:
      case 31:
      default:
        label396: switch (this.audioObjectType)
        {
        case 18:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        default:
        case 17:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 39:
        }
        break;
      case 1:
      case 2:
      case 3:
      case 4:
      case 6:
      case 7:
      case 17:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 8:
      case 9:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 30:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      }
    }
    do
    {
      do
      {
        if ((this.extensionAudioObjectType != 5) && (localBitReaderBuffer.remainingBits() >= 16))
        {
          this.syncExtensionType = localBitReaderBuffer.readBits(11);
          if (this.syncExtensionType == 695)
          {
            this.extensionAudioObjectType = getAudioObjectType(localBitReaderBuffer);
            if (this.extensionAudioObjectType == 5)
            {
              this.sbrPresentFlag = localBitReaderBuffer.readBool();
              if (this.sbrPresentFlag)
              {
                this.extensionSamplingFrequencyIndex = localBitReaderBuffer.readBits(4);
                if (this.extensionSamplingFrequencyIndex == 15)
                  this.extensionSamplingFrequency = localBitReaderBuffer.readBits(24);
                if (localBitReaderBuffer.remainingBits() >= 12)
                {
                  this.syncExtensionType = localBitReaderBuffer.readBits(11);
                  if (this.syncExtensionType == 1352)
                    this.psPresentFlag = localBitReaderBuffer.readBool();
                }
              }
            }
            if (this.extensionAudioObjectType == 22)
            {
              this.sbrPresentFlag = localBitReaderBuffer.readBool();
              if (this.sbrPresentFlag)
              {
                this.extensionSamplingFrequencyIndex = localBitReaderBuffer.readBits(4);
                if (this.extensionSamplingFrequencyIndex == 15)
                  this.extensionSamplingFrequency = localBitReaderBuffer.readBits(24);
              }
              this.extensionChannelConfiguration = localBitReaderBuffer.readBits(4);
            }
          }
        }
        return;
        this.extensionAudioObjectType = 0;
        break;
        parseGaSpecificConfig(this.samplingFrequencyIndex, this.channelConfiguration, this.audioObjectType, localBitReaderBuffer);
        break label396;
        throw new UnsupportedOperationException("can't parse CelpSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse HvxcSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse TTSSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse StructuredAudioSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse ErrorResilientCelpSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse ErrorResilientHvxcSpecificConfig yet");
        parseParametricSpecificConfig(this.samplingFrequencyIndex, this.channelConfiguration, this.audioObjectType, localBitReaderBuffer);
        break label396;
        throw new UnsupportedOperationException("can't parse SSCSpecificConfig yet");
        this.sacPayloadEmbedding = localBitReaderBuffer.readBits(1);
        throw new UnsupportedOperationException("can't parse SpatialSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse MPEG_1_2_SpecificConfig yet");
        throw new UnsupportedOperationException("can't parse DSTSpecificConfig yet");
        this.fillBits = localBitReaderBuffer.readBits(5);
        throw new UnsupportedOperationException("can't parse ALSSpecificConfig yet");
        throw new UnsupportedOperationException("can't parse SLSSpecificConfig yet");
        this.eldSpecificConfig = new AudioSpecificConfig.ELDSpecificConfig(this, this.channelConfiguration, localBitReaderBuffer);
        break label396;
        throw new UnsupportedOperationException("can't parse SymbolicMusicSpecificConfig yet");
        this.epConfig = localBitReaderBuffer.readBits(2);
        if ((this.epConfig == 2) || (this.epConfig == 3))
          throw new UnsupportedOperationException("can't parse ErrorProtectionSpecificConfig yet");
      }
      while (this.epConfig != 3);
      this.directMapping = localBitReaderBuffer.readBits(1);
    }
    while (this.directMapping != 0);
    throw new RuntimeException("not implemented");
  }

  public ByteBuffer serialize()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(serializedSize());
    IsoTypeWriter.writeUInt8(localByteBuffer, 5);
    IsoTypeWriter.writeUInt8(localByteBuffer, -2 + serializedSize());
    BitWriterBuffer localBitWriterBuffer = new BitWriterBuffer(localByteBuffer);
    localBitWriterBuffer.writeBits(this.audioObjectType, 5);
    localBitWriterBuffer.writeBits(this.samplingFrequencyIndex, 4);
    if (this.samplingFrequencyIndex == 15)
      throw new UnsupportedOperationException("can't serialize that yet");
    localBitWriterBuffer.writeBits(this.channelConfiguration, 4);
    return localByteBuffer;
  }

  public int serializedSize()
  {
    if (this.audioObjectType == 2)
      return 4 + gaSpecificConfigSize();
    throw new UnsupportedOperationException("can't serialize that yet");
  }

  public void setAudioObjectType(int paramInt)
  {
    this.audioObjectType = paramInt;
  }

  public void setChannelConfiguration(int paramInt)
  {
    this.channelConfiguration = paramInt;
  }

  public void setSamplingFrequency(int paramInt)
  {
    this.samplingFrequency = paramInt;
  }

  public void setSamplingFrequencyIndex(int paramInt)
  {
    this.samplingFrequencyIndex = paramInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("AudioSpecificConfig");
    localStringBuilder.append("{configBytes=").append(Hex.encodeHex(this.configBytes));
    localStringBuilder.append(", audioObjectType=").append(this.audioObjectType).append(" (").append((String)audioObjectTypeMap.get(Integer.valueOf(this.audioObjectType))).append(")");
    localStringBuilder.append(", samplingFrequencyIndex=").append(this.samplingFrequencyIndex).append(" (").append(samplingFrequencyIndexMap.get(Integer.valueOf(this.samplingFrequencyIndex))).append(")");
    localStringBuilder.append(", samplingFrequency=").append(this.samplingFrequency);
    localStringBuilder.append(", channelConfiguration=").append(this.channelConfiguration);
    if (this.extensionAudioObjectType > 0)
    {
      localStringBuilder.append(", extensionAudioObjectType=").append(this.extensionAudioObjectType).append(" (").append((String)audioObjectTypeMap.get(Integer.valueOf(this.extensionAudioObjectType))).append(")");
      localStringBuilder.append(", sbrPresentFlag=").append(this.sbrPresentFlag);
      localStringBuilder.append(", psPresentFlag=").append(this.psPresentFlag);
      localStringBuilder.append(", extensionSamplingFrequencyIndex=").append(this.extensionSamplingFrequencyIndex).append(" (").append(samplingFrequencyIndexMap.get(Integer.valueOf(this.extensionSamplingFrequencyIndex))).append(")");
      localStringBuilder.append(", extensionSamplingFrequency=").append(this.extensionSamplingFrequency);
      localStringBuilder.append(", extensionChannelConfiguration=").append(this.extensionChannelConfiguration);
    }
    localStringBuilder.append(", syncExtensionType=").append(this.syncExtensionType);
    if (this.gaSpecificConfig)
    {
      localStringBuilder.append(", frameLengthFlag=").append(this.frameLengthFlag);
      localStringBuilder.append(", dependsOnCoreCoder=").append(this.dependsOnCoreCoder);
      localStringBuilder.append(", coreCoderDelay=").append(this.coreCoderDelay);
      localStringBuilder.append(", extensionFlag=").append(this.extensionFlag);
      localStringBuilder.append(", layerNr=").append(this.layerNr);
      localStringBuilder.append(", numOfSubFrame=").append(this.numOfSubFrame);
      localStringBuilder.append(", layer_length=").append(this.layer_length);
      localStringBuilder.append(", aacSectionDataResilienceFlag=").append(this.aacSectionDataResilienceFlag);
      localStringBuilder.append(", aacScalefactorDataResilienceFlag=").append(this.aacScalefactorDataResilienceFlag);
      localStringBuilder.append(", aacSpectralDataResilienceFlag=").append(this.aacSpectralDataResilienceFlag);
      localStringBuilder.append(", extensionFlag3=").append(this.extensionFlag3);
    }
    if (this.parametricSpecificConfig)
    {
      localStringBuilder.append(", isBaseLayer=").append(this.isBaseLayer);
      localStringBuilder.append(", paraMode=").append(this.paraMode);
      localStringBuilder.append(", paraExtensionFlag=").append(this.paraExtensionFlag);
      localStringBuilder.append(", hvxcVarMode=").append(this.hvxcVarMode);
      localStringBuilder.append(", hvxcRateMode=").append(this.hvxcRateMode);
      localStringBuilder.append(", erHvxcExtensionFlag=").append(this.erHvxcExtensionFlag);
      localStringBuilder.append(", var_ScalableFlag=").append(this.var_ScalableFlag);
      localStringBuilder.append(", hilnQuantMode=").append(this.hilnQuantMode);
      localStringBuilder.append(", hilnMaxNumLine=").append(this.hilnMaxNumLine);
      localStringBuilder.append(", hilnSampleRateCode=").append(this.hilnSampleRateCode);
      localStringBuilder.append(", hilnFrameLength=").append(this.hilnFrameLength);
      localStringBuilder.append(", hilnContMode=").append(this.hilnContMode);
      localStringBuilder.append(", hilnEnhaLayer=").append(this.hilnEnhaLayer);
      localStringBuilder.append(", hilnEnhaQuantMode=").append(this.hilnEnhaQuantMode);
    }
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}