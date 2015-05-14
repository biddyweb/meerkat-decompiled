package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks;

import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleDescriptionBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox.SubSampleEntry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubSampleInformationBox.SubSampleEntry.SubsampleEntry;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.AbstractTrack;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.Iso639;
import co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30.XMLSubtitleSampleEntry;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.namespace.NamespaceContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class SMPTETTTrackImpl extends AbstractTrack
{
  public static final String SMPTE_TT_NAMESPACE = "http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt";
  XMLSubtitleSampleEntry XMLSubtitleSampleEntry = new XMLSubtitleSampleEntry();
  boolean containsImages;
  SampleDescriptionBox sampleDescriptionBox = new SampleDescriptionBox();
  private long[] sampleDurations;
  List<Sample> samples = new ArrayList();
  SubSampleInformationBox subSampleInformationBox = new SubSampleInformationBox();
  TrackMetaData trackMetaData = new TrackMetaData();

  public SMPTETTTrackImpl(File[] paramArrayOfFile)
    throws IOException, ParserConfigurationException, SAXException, XPathExpressionException
  {
    super(paramArrayOfFile[0].getName());
    this.sampleDurations = new long[paramArrayOfFile.length];
    DocumentBuilderFactory localDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
    localDocumentBuilderFactory.setNamespaceAware(true);
    DocumentBuilder localDocumentBuilder = localDocumentBuilderFactory.newDocumentBuilder();
    long l1 = 0L;
    Object localObject = null;
    for (int i = 0; ; i++)
    {
      int j = paramArrayOfFile.length;
      if (i >= j)
        break;
      final File localFile1 = paramArrayOfFile[i];
      SubSampleInformationBox.SubSampleEntry localSubSampleEntry = new SubSampleInformationBox.SubSampleEntry();
      this.subSampleInformationBox.getEntries().add(localSubSampleEntry);
      localSubSampleEntry.setSampleDelta(1L);
      Document localDocument = localDocumentBuilder.parse(localFile1);
      String str1 = getLanguage(localDocument);
      if (localObject == null)
        localObject = str1;
      HashMap localHashMap;
      HashSet localHashSet;
      while (localObject.equals(str1))
      {
        XPathFactory localXPathFactory = XPathFactory.newInstance();
        TextTrackNamespaceContext localTextTrackNamespaceContext = new TextTrackNamespaceContext(null);
        XPath localXPath = localXPathFactory.newXPath();
        localXPath.setNamespaceContext(localTextTrackNamespaceContext);
        long l2 = latestTimestamp(localDocument);
        this.sampleDurations[i] = (l2 - l1);
        l1 = l2;
        NodeList localNodeList = (NodeList)localXPath.compile("/ttml:tt/ttml:body/ttml:div/@smpte:backgroundImage").evaluate(localDocument, XPathConstants.NODESET);
        localHashMap = new HashMap();
        localHashSet = new HashSet();
        for (int k = 0; k < localNodeList.getLength(); k++)
          localHashSet.add(localNodeList.item(k).getNodeValue());
      }
      throw new RuntimeException("Within one Track all sample documents need to have the same language");
      ArrayList localArrayList1 = new ArrayList(localHashSet);
      Collections.sort((List)localArrayList1);
      int m = 1;
      Iterator localIterator1 = localArrayList1.iterator();
      while (localIterator1.hasNext())
      {
        String str5 = (String)localIterator1.next();
        String str6 = str5.substring(str5.lastIndexOf("."));
        StringBuilder localStringBuilder = new StringBuilder().append("urn:dece:container:subtitleimageindex:");
        int n = m + 1;
        localHashMap.put(str5, m + str6);
        m = n;
      }
      if (!localArrayList1.isEmpty())
      {
        FileInputStream localFileInputStream = new FileInputStream(localFile1);
        byte[] arrayOfByte = streamToByteArray(localFileInputStream);
        String str2 = new String(arrayOfByte);
        Iterator localIterator2 = localHashMap.entrySet().iterator();
        while (localIterator2.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator2.next();
          CharSequence localCharSequence1 = (CharSequence)localEntry.getKey();
          CharSequence localCharSequence2 = (CharSequence)localEntry.getValue();
          str2 = str2.replace(localCharSequence1, localCharSequence2);
        }
        final String str3 = str2;
        final ArrayList localArrayList2 = new ArrayList();
        List localList1 = this.samples;
        Sample local1 = new Sample()
        {
          public ByteBuffer asByteBuffer()
          {
            ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
            try
            {
              writeTo(Channels.newChannel(localByteArrayOutputStream));
              return ByteBuffer.wrap(localByteArrayOutputStream.toByteArray());
            }
            catch (IOException localIOException)
            {
              throw new RuntimeException(localIOException);
            }
          }

          public long getSize()
          {
            long l = Utf8.convert(str3).length;
            Iterator localIterator = localArrayList2.iterator();
            while (localIterator.hasNext())
              l += ((File)localIterator.next()).length();
            return l;
          }

          public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
            throws IOException
          {
            paramAnonymousWritableByteChannel.write(ByteBuffer.wrap(Utf8.convert(str3)));
            Iterator localIterator = localArrayList2.iterator();
            if (localIterator.hasNext())
            {
              FileInputStream localFileInputStream = new FileInputStream((File)localIterator.next());
              byte[] arrayOfByte = new byte[8096];
              while (true)
              {
                int i = localFileInputStream.read(arrayOfByte);
                if (-1 == i)
                  break;
                paramAnonymousWritableByteChannel.write(ByteBuffer.wrap(arrayOfByte, 0, i));
              }
            }
          }
        };
        localList1.add(local1);
        SubSampleInformationBox.SubSampleEntry.SubsampleEntry localSubsampleEntry1 = new SubSampleInformationBox.SubSampleEntry.SubsampleEntry();
        localSubsampleEntry1.setSubsampleSize(Utf8.utf8StringLengthInBytes(str3));
        localSubSampleEntry.getSubsampleEntries().add(localSubsampleEntry1);
        Iterator localIterator3 = localArrayList1.iterator();
        while (localIterator3.hasNext())
        {
          String str4 = (String)localIterator3.next();
          File localFile2 = new File(localFile1.getParentFile(), str4);
          localArrayList2.add(localFile2);
          SubSampleInformationBox.SubSampleEntry.SubsampleEntry localSubsampleEntry2 = new SubSampleInformationBox.SubSampleEntry.SubsampleEntry();
          localSubsampleEntry2.setSubsampleSize(localFile2.length());
          localSubSampleEntry.getSubsampleEntries().add(localSubsampleEntry2);
        }
      }
      List localList2 = this.samples;
      Sample local2 = new Sample()
      {
        public ByteBuffer asByteBuffer()
        {
          try
          {
            ByteBuffer localByteBuffer = ByteBuffer.wrap(SMPTETTTrackImpl.this.streamToByteArray(new FileInputStream(localFile1)));
            return localByteBuffer;
          }
          catch (IOException localIOException)
          {
            throw new RuntimeException(localIOException);
          }
        }

        public long getSize()
        {
          return localFile1.length();
        }

        public void writeTo(WritableByteChannel paramAnonymousWritableByteChannel)
          throws IOException
        {
          Channels.newOutputStream(paramAnonymousWritableByteChannel).write(SMPTETTTrackImpl.this.streamToByteArray(new FileInputStream(localFile1)));
        }
      };
      localList2.add(local2);
    }
    this.trackMetaData.setLanguage(Iso639.convert2to3(localObject));
    this.XMLSubtitleSampleEntry.setNamespace("http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt");
    this.XMLSubtitleSampleEntry.setSchemaLocation("http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt");
    if (this.containsImages)
      this.XMLSubtitleSampleEntry.setAuxiliaryMimeTypes("image/png");
    while (true)
    {
      this.sampleDescriptionBox.addBox(this.XMLSubtitleSampleEntry);
      this.trackMetaData.setTimescale(30000L);
      this.trackMetaData.setLayer(65535);
      return;
      this.XMLSubtitleSampleEntry.setAuxiliaryMimeTypes("");
    }
  }

  public static long earliestTimestamp(Document paramDocument)
  {
    XPathFactory localXPathFactory = XPathFactory.newInstance();
    TextTrackNamespaceContext localTextTrackNamespaceContext = new TextTrackNamespaceContext(null);
    XPath localXPath = localXPathFactory.newXPath();
    localXPath.setNamespaceContext(localTextTrackNamespaceContext);
    long l1;
    try
    {
      NodeList localNodeList = (NodeList)localXPath.compile("//*[@begin]").evaluate(paramDocument, XPathConstants.NODESET);
      l1 = 0L;
      for (int i = 0; i < localNodeList.getLength(); i++)
      {
        long l2 = Math.min(toTime(localNodeList.item(i).getAttributes().getNamedItem("begin").getNodeValue()), l1);
        l1 = l2;
      }
    }
    catch (XPathExpressionException localXPathExpressionException)
    {
      throw new RuntimeException(localXPathExpressionException);
    }
    return l1;
  }

  public static String getLanguage(Document paramDocument)
  {
    return paramDocument.getDocumentElement().getAttribute("xml:lang");
  }

  public static long latestTimestamp(Document paramDocument)
  {
    XPathFactory localXPathFactory = XPathFactory.newInstance();
    TextTrackNamespaceContext localTextTrackNamespaceContext = new TextTrackNamespaceContext(null);
    XPath localXPath = localXPathFactory.newXPath();
    localXPath.setNamespaceContext(localTextTrackNamespaceContext);
    long l1;
    try
    {
      NodeList localNodeList = (NodeList)localXPath.compile("//*[@begin]").evaluate(paramDocument, XPathConstants.NODESET);
      l1 = 0L;
      int i = 0;
      if (i < localNodeList.getLength())
      {
        Node localNode = localNodeList.item(i);
        String str = localNode.getAttributes().getNamedItem("begin").getNodeValue();
        if (localNode.getAttributes().getNamedItem("dur") != null);
        for (long l2 = toTime(str) + toTime(localNode.getAttributes().getNamedItem("dur").getNodeValue()); ; l2 = toTime(localNode.getAttributes().getNamedItem("end").getNodeValue()))
        {
          l1 = Math.max(l2, l1);
          i++;
          break;
          if (localNode.getAttributes().getNamedItem("end") == null)
            break label209;
        }
        label209: throw new RuntimeException("neither end nor dur attribute is present");
      }
    }
    catch (XPathExpressionException localXPathExpressionException)
    {
      throw new RuntimeException(localXPathExpressionException);
    }
    return l1;
  }

  private byte[] streamToByteArray(InputStream paramInputStream)
    throws IOException
  {
    byte[] arrayOfByte = new byte[8096];
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (-1 == i)
        break;
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    return localByteArrayOutputStream.toByteArray();
  }

  static long toTime(String paramString)
  {
    Matcher localMatcher = Pattern.compile("([0-9][0-9]):([0-9][0-9]):([0-9][0-9])([\\.:][0-9][0-9]?[0-9]?)?").matcher(paramString);
    if (localMatcher.matches())
    {
      String str1 = localMatcher.group(1);
      String str2 = localMatcher.group(2);
      String str3 = localMatcher.group(3);
      String str4 = localMatcher.group(4);
      if (str4 == null)
        str4 = ".000";
      String str5 = str4.replace(":", ".");
      return ()(1000L * (60L * (60L * Long.parseLong(str1))) + 1000L * (60L * Long.parseLong(str2)) + 1000L * Long.parseLong(str3) + 1000.0D * Double.parseDouble("0" + str5));
    }
    throw new RuntimeException("Cannot match " + paramString + " to time expression");
  }

  public void close()
    throws IOException
  {
  }

  public String getHandler()
  {
    return "subt";
  }

  public SampleDescriptionBox getSampleDescriptionBox()
  {
    return this.sampleDescriptionBox;
  }

  public long[] getSampleDurations()
  {
    long[] arrayOfLong = new long[this.sampleDurations.length];
    for (int i = 0; i < arrayOfLong.length; i++)
      arrayOfLong[i] = (this.sampleDurations[i] * this.trackMetaData.getTimescale() / 1000L);
    return arrayOfLong;
  }

  public List<Sample> getSamples()
  {
    return this.samples;
  }

  public SubSampleInformationBox getSubsampleInformationBox()
  {
    return this.subSampleInformationBox;
  }

  public TrackMetaData getTrackMetaData()
  {
    return this.trackMetaData;
  }

  private static class TextTrackNamespaceContext
    implements NamespaceContext
  {
    public String getNamespaceURI(String paramString)
    {
      if (paramString.equals("ttml"))
        return "http://www.w3.org/ns/ttml";
      if (paramString.equals("smpte"))
        return "http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt";
      return null;
    }

    public String getPrefix(String paramString)
    {
      if (paramString.equals("http://www.w3.org/ns/ttml"))
        return "ttml";
      if (paramString.equals("http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt"))
        return "smpte";
      return null;
    }

    public Iterator getPrefixes(String paramString)
    {
      return Arrays.asList(new String[] { "ttml", "smpte" }).iterator();
    }
  }
}