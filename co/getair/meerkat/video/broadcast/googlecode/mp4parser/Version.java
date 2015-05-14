package co.getair.meerkat.video.broadcast.googlecode.mp4parser;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.logging.Logger;

public class Version
{
  private static final Logger LOG = Logger.getLogger(Version.class.getName());
  public static final String VERSION;

  static
  {
    LineNumberReader localLineNumberReader = new LineNumberReader(new InputStreamReader(Version.class.getResourceAsStream("/version.txt")));
    try
    {
      String str2 = localLineNumberReader.readLine();
      str1 = str2;
      VERSION = str1;
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        LOG.warning(localIOException.getMessage());
        String str1 = "unknown";
      }
    }
  }
}