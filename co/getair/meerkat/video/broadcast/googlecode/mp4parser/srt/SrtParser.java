package co.getair.meerkat.video.broadcast.googlecode.mp4parser.srt;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.TextTrackImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.TextTrackImpl.Line;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.List;

public class SrtParser
{
  private static long parse(String paramString)
  {
    long l1 = Long.parseLong(paramString.split(":")[0].trim());
    long l2 = Long.parseLong(paramString.split(":")[1].trim());
    long l3 = Long.parseLong(paramString.split(":")[2].split(",")[0].trim());
    return Long.parseLong(paramString.split(":")[2].split(",")[1].trim()) + (1000L * (60L * (60L * l1)) + 1000L * (60L * l2) + 1000L * l3);
  }

  public static TextTrackImpl parse(InputStream paramInputStream)
    throws IOException
  {
    LineNumberReader localLineNumberReader = new LineNumberReader(new InputStreamReader(paramInputStream, "UTF-8"));
    TextTrackImpl localTextTrackImpl = new TextTrackImpl();
    while (localLineNumberReader.readLine() != null)
    {
      String str1 = localLineNumberReader.readLine();
      String str3;
      for (String str2 = ""; ; str2 = str2 + str3 + "\n")
      {
        str3 = localLineNumberReader.readLine();
        if ((str3 == null) || (str3.trim().equals("")))
          break;
      }
      long l1 = parse(str1.split("-->")[0]);
      long l2 = parse(str1.split("-->")[1]);
      localTextTrackImpl.getSubs().add(new TextTrackImpl.Line(l1, l2, str2));
    }
    return localTextTrackImpl;
  }
}