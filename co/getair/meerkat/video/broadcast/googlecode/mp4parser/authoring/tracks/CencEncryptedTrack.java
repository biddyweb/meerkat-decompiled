package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7.CencSampleAuxiliaryDataFormat;
import java.util.List;
import java.util.UUID;

public abstract interface CencEncryptedTrack extends Track
{
  public abstract UUID getDefaultKeyId();

  public abstract List<CencSampleAuxiliaryDataFormat> getSampleEncryptionEntries();

  public abstract boolean hasSubSampleEncryption();
}