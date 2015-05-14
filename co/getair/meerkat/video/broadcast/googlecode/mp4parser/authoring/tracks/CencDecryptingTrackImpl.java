package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.OriginalFormatBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SchemeTypeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AbstractSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.MemoryDataSourceImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.cenc.CencDecryptingSampleList;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.CencSampleEncryptionInformationGroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Path;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.RangeStartMap;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.channels.Channels;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import javax.crypto.SecretKey;

public class CencDecryptingTrackImpl extends AbstractTrack
{
  RangeStartMap<Integer, SecretKey> indexToKey = new RangeStartMap();
  Track original;
  CencDecryptingSampleList samples;

  public CencDecryptingTrackImpl(CencEncryptedTrack paramCencEncryptedTrack, Map<UUID, SecretKey> paramMap)
  {
    super("dec(" + paramCencEncryptedTrack.getName() + ")");
    this.original = paramCencEncryptedTrack;
    SchemeTypeBox localSchemeTypeBox = (SchemeTypeBox)Path.getPath(paramCencEncryptedTrack.getSampleDescriptionBox(), "enc./sinf/schm");
    if ((!"cenc".equals(localSchemeTypeBox.getSchemeType())) && (!"cbc1".equals(localSchemeTypeBox.getSchemeType())))
      throw new RuntimeException("You can only use the CencDecryptingTrackImpl with CENC (cenc or cbc1) encrypted tracks");
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = paramCencEncryptedTrack.getSampleGroups().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if ((localEntry.getKey() instanceof CencSampleEncryptionInformationGroupEntry))
        localArrayList.add((CencSampleEncryptionInformationGroupEntry)localEntry.getKey());
      else
        getSampleGroups().put(localEntry.getKey(), localEntry.getValue());
    }
    int i = -1;
    int j = 0;
    if (j < paramCencEncryptedTrack.getSamples().size())
    {
      int k = 0;
      for (int m = 0; m < localArrayList.size(); m++)
      {
        GroupEntry localGroupEntry = (GroupEntry)localArrayList.get(m);
        if (Arrays.binarySearch((long[])paramCencEncryptedTrack.getSampleGroups().get(localGroupEntry), j) >= 0)
          k = m + 1;
      }
      if (i != k)
      {
        if (k != 0)
          break label346;
        this.indexToKey.put(Integer.valueOf(j), paramMap.get(paramCencEncryptedTrack.getDefaultKeyId()));
      }
      while (true)
      {
        i = k;
        j++;
        break;
        label346: if (((CencSampleEncryptionInformationGroupEntry)localArrayList.get(k - 1)).isEncrypted())
        {
          SecretKey localSecretKey = (SecretKey)paramMap.get(((CencSampleEncryptionInformationGroupEntry)localArrayList.get(k - 1)).getKid());
          if (localSecretKey == null)
            throw new RuntimeException("Key " + ((CencSampleEncryptionInformationGroupEntry)localArrayList.get(k - 1)).getKid() + " was not supplied for decryption");
          this.indexToKey.put(Integer.valueOf(j), localSecretKey);
        }
        else
        {
          this.indexToKey.put(Integer.valueOf(j), null);
        }
      }
    }
    this.samples = new CencDecryptingSampleList(this.indexToKey, paramCencEncryptedTrack.getSamples(), paramCencEncryptedTrack.getSampleEncryptionEntries(), localSchemeTypeBox.getSchemeType());
  }

  public CencDecryptingTrackImpl(CencEncryptedTrack paramCencEncryptedTrack, SecretKey paramSecretKey)
  {
    this(paramCencEncryptedTrack, Collections.singletonMap(paramCencEncryptedTrack.getDefaultKeyId(), paramSecretKey));
  }

  public void close()
    throws IOException
  {
    this.original.close();
  }

  public String getHandler()
  {
    return this.original.getHandler();
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    OriginalFormatBox localOriginalFormatBox = (OriginalFormatBox)Path.getPath(this.original.getSampleDescriptionBox(), "enc./sinf/frma");
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    SampleDescriptionBox localSampleDescriptionBox;
    LinkedList localLinkedList;
    while (true)
    {
      try
      {
        this.original.getSampleDescriptionBox().getBox(Channels.newChannel(localByteArrayOutputStream));
        localSampleDescriptionBox = (SampleDescriptionBox)new IsoFile(new MemoryDataSourceImpl(localByteArrayOutputStream.toByteArray())).getBoxes().get(0);
        if ((localSampleDescriptionBox.getSampleEntry() instanceof AudioSampleEntry))
        {
          ((AudioSampleEntry)localSampleDescriptionBox.getSampleEntry()).setType(localOriginalFormatBox.getDataFormat());
          localLinkedList = new LinkedList();
          Iterator localIterator = localSampleDescriptionBox.getSampleEntry().getBoxes().iterator();
          if (!localIterator.hasNext())
            break;
          Box localBox = (Box)localIterator.next();
          if (localBox.getType().equals("sinf"))
            continue;
          localLinkedList.add(localBox);
          continue;
        }
      }
      catch (IOException localIOException)
      {
        throw new RuntimeException("Dumping stsd to memory failed");
      }
      if ((localSampleDescriptionBox.getSampleEntry() instanceof VisualSampleEntry))
        ((VisualSampleEntry)localSampleDescriptionBox.getSampleEntry()).setType(localOriginalFormatBox.getDataFormat());
      else
        throw new RuntimeException("I don't know " + localSampleDescriptionBox.getSampleEntry().getType());
    }
    localSampleDescriptionBox.getSampleEntry().setBoxes(localLinkedList);
    return localSampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    return this.original.getSampleDurations();
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public long[] getSyncSamples()
  {
    return this.original.getSyncSamples();
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.original.getTrackMetaData();
  }
}