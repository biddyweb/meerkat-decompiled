package com.instabug.library.util;

import com.instabug.library.Instabug.a;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;

public class d
{
  static
  {
    d.class.getName();
  }

  public static ArrayList a(a parama)
  {
    ArrayList localArrayList = new ArrayList();
    try
    {
      Process localProcess = Runtime.getRuntime().exec(parama.b);
      new BufferedWriter(new OutputStreamWriter(localProcess.getOutputStream()));
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(localProcess.getInputStream()));
      try
      {
        while (true)
        {
          String str = localBufferedReader.readLine();
          if (str == null)
            break;
          Instabug.a.a("SHELL --> Line received: " + str);
          localArrayList.add(str);
        }
      }
      catch (Exception localException2)
      {
        localException2.printStackTrace();
        Instabug.a.a("SHELL --> Full response was: " + localArrayList);
        return localArrayList;
      }
    }
    catch (Exception localException1)
    {
    }
    return null;
  }

  public static enum a
  {
    String[] b;

    static
    {
      new a[1][0] = a;
    }

    private a(String[] arg3)
    {
      Object localObject;
      this.b = localObject;
    }
  }
}