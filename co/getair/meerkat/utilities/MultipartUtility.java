package co.getair.meerkat.utilities;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

public class MultipartUtility
{
  private static final String LINE_FEED = "\r\n";
  private final String boundary;
  private String charset;
  private HttpURLConnection httpConn;
  private OutputStream outputStream;
  private PrintWriter writer;

  public MultipartUtility(String paramString1, String paramString2)
    throws IOException
  {
    this.charset = paramString2;
    this.boundary = ("===" + System.currentTimeMillis() + "===");
    this.httpConn = ((HttpURLConnection)new URL(paramString1).openConnection());
    this.httpConn.setUseCaches(false);
    this.httpConn.setDoOutput(true);
    this.httpConn.setDoInput(true);
    this.httpConn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + this.boundary);
    this.httpConn.setRequestProperty("User-Agent", "CodeJava Agent");
    this.httpConn.setRequestProperty("Test", "Bonjour");
    this.outputStream = this.httpConn.getOutputStream();
    this.writer = new PrintWriter(new OutputStreamWriter(this.outputStream, paramString2), true);
  }

  public void addFilePart(String paramString1, String paramString2, InputStream paramInputStream)
    throws IOException
  {
    this.writer.append("--" + this.boundary).append("\r\n");
    this.writer.append("Content-Disposition: form-data; name=\"" + paramString1 + "\"; filename=\"" + paramString2 + "\"").append("\r\n");
    this.writer.append("Content-Type: " + URLConnection.guessContentTypeFromName("profileImage.jpg")).append("\r\n");
    this.writer.append("Content-Transfer-Encoding: binary").append("\r\n");
    this.writer.append("\r\n");
    this.writer.flush();
    byte[] arrayOfByte = new byte[4096];
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1)
        break;
      this.outputStream.write(arrayOfByte, 0, i);
    }
    this.outputStream.flush();
    paramInputStream.close();
    this.writer.append("\r\n");
    this.writer.flush();
  }

  public void addFormField(String paramString1, String paramString2)
  {
    this.writer.append("--" + this.boundary).append("\r\n");
    this.writer.append("Content-Disposition: form-data; name=\"" + paramString1 + "\"").append("\r\n");
    this.writer.append("Content-Type: text/plain; charset=" + this.charset).append("\r\n");
    this.writer.append("\r\n");
    this.writer.append(paramString2).append("\r\n");
    this.writer.flush();
  }

  public void addHeaderField(String paramString1, String paramString2)
  {
    this.writer.append(paramString1 + ": " + paramString2).append("\r\n");
    this.writer.flush();
  }

  public List<String> finish()
    throws IOException
  {
    ArrayList localArrayList = new ArrayList();
    this.writer.append("\r\n").flush();
    this.writer.append("--" + this.boundary + "--").append("\r\n");
    this.writer.close();
    int i = this.httpConn.getResponseCode();
    if (i == 200)
    {
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(this.httpConn.getInputStream()));
      while (true)
      {
        String str = localBufferedReader.readLine();
        if (str == null)
          break;
        localArrayList.add(str);
      }
      localBufferedReader.close();
      this.httpConn.disconnect();
      return localArrayList;
    }
    throw new IOException("Server returned non-OK status: " + i);
  }
}