package co.getair.meerkat.video.broadcast.mp4writer;

import android.util.Log;
import co.getair.meerkat.video.broadcast.coremedia.iso.BoxParser;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Box;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataEntryUrlBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.DataReferenceBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.EditListBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.HandlerBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.HintMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.MediaInformationBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.NullMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleSizeBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleTableBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SampleToChunkBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SoundMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.StaticChunkOffsetBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.SubtitleMediaHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TimeToSampleBox.Entry;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.TrackHeaderBox;
import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.VideoMediaHeaderBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.DataSource;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Sample;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.Track;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.TrackMetaData;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.AACTrackImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring.tracks.H264TrackImpl;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class MoovBuilder
{
  private static final String TAG = "MoovBuilder";

  protected static DataInformationBox createDinf(Track paramTrack)
  {
    DataInformationBox localDataInformationBox = new DataInformationBox();
    DataReferenceBox localDataReferenceBox = new DataReferenceBox();
    localDataInformationBox.addBox(localDataReferenceBox);
    DataEntryUrlBox localDataEntryUrlBox = new DataEntryUrlBox();
    localDataEntryUrlBox.setFlags(1);
    localDataReferenceBox.addBox(localDataEntryUrlBox);
    return localDataInformationBox;
  }

  protected static Box createEdts(Track paramTrack, long paramLong)
  {
    EditListBox localEditListBox = new EditListBox();
    localEditListBox.setVersion(1);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(new EditListBox.Entry(localEditListBox, paramTrack.getDuration(), paramLong, 1.0D));
    localEditListBox.setEntries(localArrayList);
    EditBox localEditBox = new EditBox();
    localEditBox.addBox(localEditListBox);
    return localEditBox;
  }

  public static List<Box> createFirstMp4Chunk(MediaTrackChunk paramMediaTrackChunk1, long[] paramArrayOfLong, MediaTrackChunk paramMediaTrackChunk2, byte[] paramArrayOfByte)
  {
    ByteBuffer localByteBuffer1 = ByteBuffer.allocate(paramMediaTrackChunk1.getSize() + paramArrayOfByte.length);
    localByteBuffer1.put(paramArrayOfByte);
    paramMediaTrackChunk1.getData().position(0);
    paramMediaTrackChunk1.getData().limit(paramMediaTrackChunk1.getSize());
    localByteBuffer1.put(paramMediaTrackChunk1.getData());
    ByteBuffer localByteBuffer2 = ByteBuffer.allocate(paramMediaTrackChunk2.getSize());
    paramMediaTrackChunk2.getData().position(0);
    paramMediaTrackChunk2.getData().limit(paramMediaTrackChunk2.getSize());
    localByteBuffer2.put(paramMediaTrackChunk2.getData());
    return createFirstMp4Chunk(localByteBuffer1.array(), paramArrayOfLong, localByteBuffer2.array());
  }

  // ERROR //
  public static List<Box> createFirstMp4Chunk(byte[] paramArrayOfByte1, long[] paramArrayOfLong, byte[] paramArrayOfByte2)
  {
    // Byte code:
    //   0: new 42\011java/util/ArrayList
    //   3: dup
    //   4: invokespecial 43\011java/util/ArrayList:<init>\011()V
    //   7: astore_3
    //   8: invokestatic 115\011co/getair/meerkat/video/broadcast/mp4writer/BoxWriter:getFtyp\011()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    //   11: astore 4
    //   13: aload_3
    //   14: aload 4
    //   16: invokeinterface 60 2 0
    //   21: pop
    //   22: new 117\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox
    //   25: dup
    //   26: invokespecial 118\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox:<init>\011()V
    //   29: astore 6
    //   31: new 120\011java/util/Date
    //   34: dup
    //   35: invokespecial 121\011java/util/Date:<init>\011()V
    //   38: astore 7
    //   40: new 123\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox
    //   43: dup
    //   44: invokespecial 124\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:<init>\011()V
    //   47: astore 8
    //   49: aload 8
    //   51: iconst_1
    //   52: invokevirtual 125\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setVersion\011(I)V
    //   55: aload 8
    //   57: aload 7
    //   59: invokevirtual 129\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setCreationTime\011(Ljava/util/Date;)V
    //   62: aload 8
    //   64: aload 7
    //   66: invokevirtual 132\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setModificationTime\011(Ljava/util/Date;)V
    //   69: aload 8
    //   71: ldc2_w 133
    //   74: invokevirtual 138\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setDuration\011(J)V
    //   77: aload 8
    //   79: ldc2_w 133
    //   82: invokevirtual 141\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setTimescale\011(J)V
    //   85: aload 8
    //   87: ldc2_w 142
    //   90: invokevirtual 146\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieHeaderBox:setNextTrackId\011(J)V
    //   93: aload 6
    //   95: aload 8
    //   97: invokevirtual 147\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   100: aconst_null
    //   101: astore 9
    //   103: ldc2_w 148
    //   106: aload 4
    //   108: invokeinterface 153 1 0
    //   113: ladd
    //   114: lstore 10
    //   116: new 155\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl
    //   119: dup
    //   120: aload_0
    //   121: invokespecial 158\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl:<init>\011([B)V
    //   124: astore 12
    //   126: ldc 8
    //   128: new 160\011java/lang/StringBuilder
    //   131: dup
    //   132: invokespecial 161\011java/lang/StringBuilder:<init>\011()V
    //   135: ldc 163
    //   137: invokevirtual 167\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   140: aload_0
    //   141: arraylength
    //   142: invokevirtual 170\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   145: invokevirtual 174\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   148: invokestatic 180\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
    //   151: pop
    //   152: new 182\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl
    //   155: dup
    //   156: aload 12
    //   158: invokespecial 185\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl:<init>\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    //   161: astore 14
    //   163: aload 14
    //   165: aload_1
    //   166: invokevirtual 189\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl:setSampleDurations\011([J)V
    //   169: aload 14
    //   171: astore 9
    //   173: new 155\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl
    //   176: dup
    //   177: aload_2
    //   178: invokespecial 158\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl:<init>\011([B)V
    //   181: astore 17
    //   183: new 191\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl
    //   186: dup
    //   187: aload 17
    //   189: invokespecial 192\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl:<init>\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    //   192: astore 18
    //   194: aload 18
    //   196: astore 19
    //   198: new 194\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox
    //   201: dup
    //   202: invokespecial 195\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox:<init>\011()V
    //   205: astore 20
    //   207: dconst_0
    //   208: dstore 21
    //   210: dconst_0
    //   211: dstore 23
    //   213: lconst_0
    //   214: lstore 25
    //   216: lconst_0
    //   217: lstore 27
    //   219: aload 19
    //   221: ifnull +25 -> 246
    //   224: aload 19
    //   226: invokevirtual 199\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl:getTrackMetaData\011()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    //   229: invokevirtual 204\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData:getTimescale\011()J
    //   232: lstore 41
    //   234: aload 19
    //   236: invokevirtual 205\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl:getDuration\011()J
    //   239: l2d
    //   240: lload 41
    //   242: l2d
    //   243: ddiv
    //   244: dstore 21
    //   246: aload 9
    //   248: ifnull +25 -> 273
    //   251: aload 9
    //   253: invokevirtual 206\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl:getTrackMetaData\011()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    //   256: invokevirtual 204\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData:getTimescale\011()J
    //   259: lstore 39
    //   261: aload 9
    //   263: invokevirtual 207\011co/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl:getDuration\011()J
    //   266: l2d
    //   267: lload 39
    //   269: l2d
    //   270: ddiv
    //   271: dstore 23
    //   273: aload 9
    //   275: ifnull +110 -> 385
    //   278: dload 21
    //   280: dconst_0
    //   281: dcmpl
    //   282: ifle +21 -> 303
    //   285: dload 23
    //   287: dconst_0
    //   288: dcmpl
    //   289: ifle +14 -> 303
    //   292: dload 21
    //   294: dload 23
    //   296: dcmpl
    //   297: ifle +6 -> 303
    //   300: lconst_0
    //   301: lstore 27
    //   303: aload 9
    //   305: lload 10
    //   307: lload 27
    //   309: invokestatic 211\011co/getair/meerkat/video/broadcast/mp4writer/MoovBuilder:createTrak\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    //   312: checkcast 213\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox
    //   315: astore 37
    //   317: aload 37
    //   319: invokevirtual 217\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox:getTrackHeaderBox\011()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox;
    //   322: iconst_1
    //   323: invokevirtual 223\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackHeaderBox:setInPoster\011(Z)V
    //   326: aload 6
    //   328: aload 37
    //   330: invokevirtual 147\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   333: new 225\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox
    //   336: dup
    //   337: invokespecial 226\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:<init>\011()V
    //   340: astore 38
    //   342: aload 38
    //   344: lconst_1
    //   345: invokevirtual 229\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setTrackId\011(J)V
    //   348: aload 38
    //   350: lconst_1
    //   351: invokevirtual 232\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleDescriptionIndex\011(J)V
    //   354: aload 38
    //   356: lconst_0
    //   357: invokevirtual 235\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleDuration\011(J)V
    //   360: aload 38
    //   362: lconst_0
    //   363: invokevirtual 238\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleSize\011(J)V
    //   366: aload 38
    //   368: new 240\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags
    //   371: dup
    //   372: invokespecial 241\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags:<init>\011()V
    //   375: invokevirtual 245\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleFlags\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    //   378: aload 20
    //   380: aload 38
    //   382: invokevirtual 246\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   385: aconst_null
    //   386: astore 29
    //   388: aload 19
    //   390: ifnull +119 -> 509
    //   393: dload 21
    //   395: dconst_0
    //   396: dcmpl
    //   397: ifle +21 -> 418
    //   400: dload 23
    //   402: dconst_0
    //   403: dcmpl
    //   404: ifle +14 -> 418
    //   407: dload 23
    //   409: dload 21
    //   411: dcmpl
    //   412: ifle +6 -> 418
    //   415: lconst_0
    //   416: lstore 25
    //   418: aload 19
    //   420: lload 10
    //   422: lload 25
    //   424: invokestatic 211\011co/getair/meerkat/video/broadcast/mp4writer/MoovBuilder:createTrak\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    //   427: checkcast 213\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox
    //   430: astore 29
    //   432: aload 6
    //   434: aload 29
    //   436: invokevirtual 147\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   439: new 225\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox
    //   442: dup
    //   443: invokespecial 226\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:<init>\011()V
    //   446: astore 35
    //   448: aload 35
    //   450: ldc2_w 247
    //   453: invokevirtual 229\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setTrackId\011(J)V
    //   456: aload 35
    //   458: lconst_1
    //   459: invokevirtual 232\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleDescriptionIndex\011(J)V
    //   462: aload 35
    //   464: lconst_0
    //   465: invokevirtual 235\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleDuration\011(J)V
    //   468: aload 35
    //   470: lconst_0
    //   471: invokevirtual 238\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleSize\011(J)V
    //   474: new 240\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags
    //   477: dup
    //   478: invokespecial 241\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags:<init>\011()V
    //   481: astore 36
    //   483: aload 36
    //   485: iconst_2
    //   486: invokevirtual 251\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags:setSampleDependsOn\011(I)V
    //   489: aload 36
    //   491: iconst_2
    //   492: invokevirtual 254\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags:setSampleIsDependedOn\011(I)V
    //   495: aload 35
    //   497: aload 36
    //   499: invokevirtual 245\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/TrackExtendsBox:setDefaultSampleFlags\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/SampleFlags;)V
    //   502: aload 20
    //   504: aload 35
    //   506: invokevirtual 246\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/fragment/MovieExtendsBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   509: ldc 8
    //   511: new 160\011java/lang/StringBuilder
    //   514: dup
    //   515: invokespecial 161\011java/lang/StringBuilder:<init>\011()V
    //   518: ldc_w 256
    //   521: invokevirtual 167\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   524: dload 21
    //   526: invokevirtual 259\011java/lang/StringBuilder:append\011(D)Ljava/lang/StringBuilder;
    //   529: ldc_w 261
    //   532: invokevirtual 167\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   535: dload 23
    //   537: invokevirtual 259\011java/lang/StringBuilder:append\011(D)Ljava/lang/StringBuilder;
    //   540: invokevirtual 174\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   543: invokestatic 180\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;)I
    //   546: pop
    //   547: aload 6
    //   549: aload 20
    //   551: invokevirtual 147\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/MovieBox:addBox\011(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V
    //   554: aload_3
    //   555: aload 9
    //   557: aload 19
    //   559: invokestatic 265\011co/getair/meerkat/video/broadcast/mp4writer/MoovBuilder:createMdat\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/H264TrackImpl;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    //   562: invokeinterface 60 2 0
    //   567: pop
    //   568: aload_3
    //   569: aload 6
    //   571: invokeinterface 60 2 0
    //   576: pop
    //   577: lload 10
    //   579: aload 9
    //   581: invokestatic 271\011co/getair/meerkat/video/broadcast/mp4writer/ChunkBuilder:getChunkSize\011(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;)I
    //   584: i2l
    //   585: ladd
    //   586: lstore 33
    //   588: aload 29
    //   590: ifnull +18 -> 608
    //   593: aload 29
    //   595: invokevirtual 275\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/TrackBox:getSampleTableBox\011()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox;
    //   598: invokevirtual 281\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleTableBox:getStaticChunkOffsetBox\011()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox;
    //   601: invokevirtual 287\011co/getair/meerkat/video/broadcast/coremedia/iso/boxes/StaticChunkOffsetBox:getChunkOffsets\011()[J
    //   604: iconst_0
    //   605: lload 33
    //   607: lastore
    //   608: aload_3
    //   609: areturn
    //   610: astore 15
    //   612: ldc 8
    //   614: ldc_w 289
    //   617: aload 15
    //   619: invokestatic 293\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   622: pop
    //   623: goto -450 -> 173
    //   626: astore 43
    //   628: ldc 8
    //   630: ldc_w 295
    //   633: aload 43
    //   635: invokestatic 293\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   638: pop
    //   639: aconst_null
    //   640: astore 19
    //   642: goto -444 -> 198
    //   645: astore 15
    //   647: aload 14
    //   649: astore 9
    //   651: goto -39 -> 612
    //
    // Exception table:
    //   from\011to\011target\011type
    //   152\011163\011610\011java/io/IOException
    //   183\011194\011626\011java/io/IOException
    //   163\011169\011645\011java/io/IOException
  }

  protected static Box createMdat(H264TrackImpl paramH264TrackImpl, final AACTrackImpl paramAACTrackImpl)
  {
    return new Box()
    {
      Container parent;
      long size_ = -1L;

      public void getBox(WritableByteChannel paramAnonymousWritableByteChannel)
        throws IOException
      {
        ByteBuffer localByteBuffer = ByteBuffer.allocate(8);
        IsoTypeWriter.writeUInt32(localByteBuffer, CastUtils.l2i(getSize()));
        localByteBuffer.put(IsoFile.fourCCtoBytes(getType()));
        localByteBuffer.rewind();
        paramAnonymousWritableByteChannel.write(localByteBuffer);
        Iterator localIterator1 = this.val$videoTrack.getSamples().iterator();
        while (localIterator1.hasNext())
          ((Sample)localIterator1.next()).writeTo(paramAnonymousWritableByteChannel);
        Iterator localIterator2 = paramAACTrackImpl.getSamples().iterator();
        while (localIterator2.hasNext())
          ((Sample)localIterator2.next()).writeTo(paramAnonymousWritableByteChannel);
        paramAnonymousWritableByteChannel.close();
      }

      public long getOffset()
      {
        throw new RuntimeException("Doesn't have any meaning for programmatically created boxes");
      }

      public Container getParent()
      {
        return this.parent;
      }

      public long getSize()
      {
        if (this.size_ != -1L)
          return this.size_;
        long l = 8L;
        Iterator localIterator1 = this.val$videoTrack.getSamples().iterator();
        while (localIterator1.hasNext())
          l += ((Sample)localIterator1.next()).getSize();
        Iterator localIterator2 = paramAACTrackImpl.getSamples().iterator();
        while (localIterator2.hasNext())
          l += ((Sample)localIterator2.next()).getSize();
        this.size_ = l;
        return l;
      }

      public String getType()
      {
        return "mdat";
      }

      public void parse(DataSource paramAnonymousDataSource, ByteBuffer paramAnonymousByteBuffer, long paramAnonymousLong, BoxParser paramAnonymousBoxParser)
        throws IOException
      {
      }

      public void setParent(Container paramAnonymousContainer)
      {
        this.parent = paramAnonymousContainer;
      }
    };
  }

  protected static Box createMdhd(Track paramTrack)
  {
    MediaHeaderBox localMediaHeaderBox = new MediaHeaderBox();
    localMediaHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
    localMediaHeaderBox.setModificationTime(new Date());
    localMediaHeaderBox.setDuration(paramTrack.getDuration());
    localMediaHeaderBox.setTimescale(paramTrack.getTrackMetaData().getTimescale());
    localMediaHeaderBox.setLanguage(paramTrack.getTrackMetaData().getLanguage());
    return localMediaHeaderBox;
  }

  protected static Box createMdia(Track paramTrack, long paramLong)
  {
    MediaBox localMediaBox = new MediaBox();
    localMediaBox.addBox(createMdhd(paramTrack));
    localMediaBox.addBox(createMdiaHdlr(paramTrack));
    localMediaBox.addBox(createMinf(paramTrack, paramLong));
    return localMediaBox;
  }

  protected static Box createMdiaHdlr(Track paramTrack)
  {
    HandlerBox localHandlerBox = new HandlerBox();
    localHandlerBox.setHandlerType(paramTrack.getHandler());
    return localHandlerBox;
  }

  protected static Box createMinf(Track paramTrack, long paramLong)
  {
    MediaInformationBox localMediaInformationBox = new MediaInformationBox();
    if (paramTrack.getHandler().equals("vide"))
      localMediaInformationBox.addBox(new VideoMediaHeaderBox());
    while (true)
    {
      localMediaInformationBox.addBox(createDinf(paramTrack));
      localMediaInformationBox.addBox(createStbl(paramTrack, paramLong));
      return localMediaInformationBox;
      if (paramTrack.getHandler().equals("soun"))
        localMediaInformationBox.addBox(new SoundMediaHeaderBox());
      else if (paramTrack.getHandler().equals("text"))
        localMediaInformationBox.addBox(new NullMediaHeaderBox());
      else if (paramTrack.getHandler().equals("subt"))
        localMediaInformationBox.addBox(new SubtitleMediaHeaderBox());
      else if (paramTrack.getHandler().equals("hint"))
        localMediaInformationBox.addBox(new HintMediaHeaderBox());
      else if (paramTrack.getHandler().equals("sbtl"))
        localMediaInformationBox.addBox(new NullMediaHeaderBox());
    }
  }

  protected static Box createStbl(Track paramTrack, long paramLong)
  {
    SampleTableBox localSampleTableBox = new SampleTableBox();
    List localList = paramTrack.getSamples();
    createStsd(paramTrack, localSampleTableBox);
    ArrayList localArrayList1 = new ArrayList();
    for (int i = 0; i < paramTrack.getSampleDurations().length; i++)
    {
      TimeToSampleBox.Entry localEntry = new TimeToSampleBox.Entry(1L, paramTrack.getSampleDurations()[i]);
      localArrayList1.add(localEntry);
    }
    TimeToSampleBox localTimeToSampleBox = new TimeToSampleBox();
    localTimeToSampleBox.setEntries(localArrayList1);
    localSampleTableBox.addBox(localTimeToSampleBox);
    SampleToChunkBox localSampleToChunkBox = new SampleToChunkBox();
    ArrayList localArrayList2 = new ArrayList();
    localArrayList2.add(new SampleToChunkBox.Entry(1L, localList.size(), 1L));
    localSampleToChunkBox.setEntries(localArrayList2);
    localSampleTableBox.addBox(localSampleToChunkBox);
    SampleSizeBox localSampleSizeBox = new SampleSizeBox();
    localSampleSizeBox.setSampleSizes(getSampleSizes(paramTrack));
    localSampleTableBox.addBox(localSampleSizeBox);
    StaticChunkOffsetBox localStaticChunkOffsetBox = new StaticChunkOffsetBox();
    localStaticChunkOffsetBox.setChunkOffsets(new long[] { paramLong });
    localSampleTableBox.addBox(localStaticChunkOffsetBox);
    return localSampleTableBox;
  }

  protected static void createStsd(Track paramTrack, SampleTableBox paramSampleTableBox)
  {
    paramSampleTableBox.addBox(paramTrack.getSampleDescriptionBox());
  }

  protected static Box createTkhd(Track paramTrack)
  {
    TrackHeaderBox localTrackHeaderBox = new TrackHeaderBox();
    localTrackHeaderBox.setVersion(1);
    localTrackHeaderBox.setFlags(7);
    localTrackHeaderBox.setAlternateGroup(paramTrack.getTrackMetaData().getGroup());
    localTrackHeaderBox.setCreationTime(paramTrack.getTrackMetaData().getCreationTime());
    localTrackHeaderBox.setDuration(paramTrack.getDuration());
    localTrackHeaderBox.setHeight(paramTrack.getTrackMetaData().getHeight());
    localTrackHeaderBox.setWidth(paramTrack.getTrackMetaData().getWidth());
    localTrackHeaderBox.setLayer(paramTrack.getTrackMetaData().getLayer());
    localTrackHeaderBox.setModificationTime(new Date());
    localTrackHeaderBox.setTrackId(1L);
    if ((paramTrack instanceof AACTrackImpl))
      localTrackHeaderBox.setTrackId(2L);
    localTrackHeaderBox.setVolume(paramTrack.getTrackMetaData().getVolume());
    return localTrackHeaderBox;
  }

  protected static Box createTrak(Track paramTrack, long paramLong1, long paramLong2)
  {
    Log.d("MoovBuilder", "Creating Track " + paramTrack);
    TrackBox localTrackBox = new TrackBox();
    localTrackBox.addBox(createTkhd(paramTrack));
    Box localBox = createEdts(paramTrack, paramLong2);
    if (localBox != null)
      localTrackBox.addBox(localBox);
    localTrackBox.addBox(createMdia(paramTrack, paramLong1));
    return localTrackBox;
  }

  protected static long[] getSampleSizes(Track paramTrack)
  {
    List localList = paramTrack.getSamples();
    long[] arrayOfLong = new long[localList.size()];
    for (int i = 0; i < arrayOfLong.length; i++)
      arrayOfLong[i] = ((Sample)localList.get(i)).getSize();
    return arrayOfLong;
  }
}