package retrofit.client;

import java.io.IOException;

public abstract interface Client
{
  public abstract Response execute(Request paramRequest)
    throws IOException;
}