package org.joda.time;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.ObjectStreamException;
import java.io.Serializable;

final class DateTimeZone$Stub
  implements Serializable
{
  private static final long serialVersionUID = -6471952376487863581L;
  private transient String iID;

  DateTimeZone$Stub(String paramString)
  {
    this.iID = paramString;
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException
  {
    this.iID = paramObjectInputStream.readUTF();
  }

  private Object readResolve()
    throws ObjectStreamException
  {
    return DateTimeZone.forID(this.iID);
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.writeUTF(this.iID);
  }
}