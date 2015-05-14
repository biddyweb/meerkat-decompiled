package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.h265;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import java.io.IOException;
import java.io.PrintStream;

public class SEIMessage
{
  public SEIMessage(BitReaderBuffer paramBitReaderBuffer)
    throws IOException
  {
    for (int i = 0; paramBitReaderBuffer.readBits(8) == 255L; i += 255);
    int j = i + paramBitReaderBuffer.readBits(8);
    for (int k = 0; paramBitReaderBuffer.readBits(8) == 255L; k += 255);
    (k + paramBitReaderBuffer.readBits(8));
    System.err.println("payloadType " + j);
  }
}