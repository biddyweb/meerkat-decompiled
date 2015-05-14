package retrofit.mime;

import java.io.IOException;
import java.io.InputStream;

public abstract interface TypedInput
{
  public abstract InputStream in()
    throws IOException;

  public abstract long length();

  public abstract String mimeType();
}