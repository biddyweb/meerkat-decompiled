.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "SMPTETTTrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;
    }
.end annotation


# static fields
.field public static final SMPTE_TT_NAMESPACE:Ljava/lang/String; = "http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt"


# instance fields
.field XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

.field containsImages:Z

.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private sampleDurations:[J

.field samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method public varargs constructor <init>([Ljava/io/File;)V
    .locals 40
    .param p1, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Ljavax/xml/xpath/XPathExpressionException;
        }
    .end annotation

    .prologue
    .line 143
    const/16 v36, 0x0

    aget-object v36, p1, v36

    invoke-virtual/range {v36 .. v36}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 50
    new-instance v36, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 51
    new-instance v36, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 52
    new-instance v36, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    invoke-direct/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    .line 54
    new-instance v36, Ljava/util/ArrayList;

    invoke-direct/range {v36 .. v36}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->samples:Ljava/util/List;

    .line 55
    new-instance v36, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    invoke-direct/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;-><init>()V

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    .line 144
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v36, v0

    move/from16 v0, v36

    new-array v0, v0, [J

    move-object/from16 v36, v0

    move-object/from16 v0, v36

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDurations:[J

    .line 145
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v6

    .line 146
    .local v6, "dbFactory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/16 v36, 0x1

    move/from16 v0, v36

    invoke-virtual {v6, v0}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 147
    invoke-virtual {v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v5

    .line 148
    .local v5, "dBuilder":Ljavax/xml/parsers/DocumentBuilder;
    const-wide/16 v28, 0x0

    .line 149
    .local v28, "startTime":J
    const/4 v12, 0x0

    .line 150
    .local v12, "firstLang":Ljava/lang/String;
    const/16 v26, 0x0

    .local v26, "sampleNo":I
    :goto_0
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v36, v0

    move/from16 v0, v26

    move/from16 v1, v36

    if-ge v0, v1, :cond_7

    .line 151
    aget-object v10, p1, v26

    .line 152
    .local v10, "file":Ljava/io/File;
    new-instance v31, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;

    invoke-direct/range {v31 .. v31}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;-><init>()V

    .line 153
    .local v31, "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-object/from16 v36, v0

    invoke-virtual/range {v36 .. v36}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;->getEntries()Ljava/util/List;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v31

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    const-wide/16 v36, 0x1

    move-object/from16 v0, v31

    move-wide/from16 v1, v36

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->setSampleDelta(J)V

    .line 156
    invoke-virtual {v5, v10}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v7

    .line 157
    .local v7, "doc":Lorg/w3c/dom/Document;
    invoke-static {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->getLanguage(Lorg/w3c/dom/Document;)Ljava/lang/String;

    move-result-object v15

    .line 158
    .local v15, "lang":Ljava/lang/String;
    if-nez v12, :cond_1

    .line 159
    move-object v12, v15

    .line 164
    :cond_0
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v32

    .line 165
    .local v32, "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    new-instance v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;

    const/16 v36, 0x0

    move-object/from16 v0, v36

    invoke-direct {v4, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$1;)V

    .line 166
    .local v4, "ctx":Ljavax/xml/namespace/NamespaceContext;
    invoke-virtual/range {v32 .. v32}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v35

    .line 167
    .local v35, "xpath":Ljavax/xml/xpath/XPath;
    move-object/from16 v0, v35

    invoke-interface {v0, v4}, Ljavax/xml/xpath/XPath;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 169
    invoke-static {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->latestTimestamp(Lorg/w3c/dom/Document;)J

    move-result-wide v16

    .line 170
    .local v16, "lastTimeStamp":J
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDurations:[J

    move-object/from16 v36, v0

    sub-long v38, v16, v28

    aput-wide v38, v36, v26

    .line 171
    move-wide/from16 v28, v16

    .line 173
    const-string v36, "/ttml:tt/ttml:body/ttml:div/@smpte:backgroundImage"

    invoke-interface/range {v35 .. v36}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v8

    .line 174
    .local v8, "expr":Ljavax/xml/xpath/XPathExpression;
    sget-object v36, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, v36

    invoke-interface {v8, v7, v0}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/w3c/dom/NodeList;

    .line 176
    .local v18, "nl":Lorg/w3c/dom/NodeList;
    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    .line 177
    .local v14, "internalName2Original":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v20, Ljava/util/HashSet;

    invoke-direct/range {v20 .. v20}, Ljava/util/HashSet;-><init>()V

    .line 178
    .local v20, "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v13, 0x0

    .local v13, "i":I
    :goto_1
    invoke-interface/range {v18 .. v18}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v36

    move/from16 v0, v36

    if-ge v13, v0, :cond_2

    .line 179
    move-object/from16 v0, v18

    invoke-interface {v0, v13}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v20

    move-object/from16 v1, v36

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 178
    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .line 160
    .end local v4    # "ctx":Ljavax/xml/namespace/NamespaceContext;
    .end local v8    # "expr":Ljavax/xml/xpath/XPathExpression;
    .end local v13    # "i":I
    .end local v14    # "internalName2Original":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v16    # "lastTimeStamp":J
    .end local v18    # "nl":Lorg/w3c/dom/NodeList;
    .end local v20    # "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v32    # "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    .end local v35    # "xpath":Ljavax/xml/xpath/XPath;
    :cond_1
    invoke-virtual {v12, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v36

    if-nez v36, :cond_0

    .line 161
    new-instance v36, Ljava/lang/RuntimeException;

    const-string v37, "Within one Track all sample documents need to have the same language"

    invoke-direct/range {v36 .. v37}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v36

    .line 181
    .restart local v4    # "ctx":Ljavax/xml/namespace/NamespaceContext;
    .restart local v8    # "expr":Ljavax/xml/xpath/XPathExpression;
    .restart local v13    # "i":I
    .restart local v14    # "internalName2Original":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v16    # "lastTimeStamp":J
    .restart local v18    # "nl":Lorg/w3c/dom/NodeList;
    .restart local v20    # "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .restart local v32    # "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    .restart local v35    # "xpath":Ljavax/xml/xpath/XPath;
    :cond_2
    new-instance v21, Ljava/util/ArrayList;

    move-object/from16 v0, v21

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .end local v20    # "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .local v21, "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    move-object/from16 v36, v21

    .line 182
    check-cast v36, Ljava/util/List;

    invoke-static/range {v36 .. v36}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 184
    const/16 v22, 0x1

    .line 185
    .local v22, "p":I
    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v36

    :goto_2
    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->hasNext()Z

    move-result v37

    if-eqz v37, :cond_3

    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 186
    .local v19, "originalName":Ljava/lang/String;
    const-string v37, "."

    move-object/from16 v0, v19

    move-object/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v37

    move-object/from16 v0, v19

    move/from16 v1, v37

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 187
    .local v9, "ext":Ljava/lang/String;
    new-instance v37, Ljava/lang/StringBuilder;

    invoke-direct/range {v37 .. v37}, Ljava/lang/StringBuilder;-><init>()V

    const-string v38, "urn:dece:container:subtitleimageindex:"

    invoke-virtual/range {v37 .. v38}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    add-int/lit8 v23, v22, 0x1

    .end local v22    # "p":I
    .local v23, "p":I
    move-object/from16 v0, v37

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v37

    move-object/from16 v0, v37

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v37

    invoke-virtual/range {v37 .. v37}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v19

    move-object/from16 v1, v37

    invoke-virtual {v14, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move/from16 v22, v23

    .line 188
    .end local v23    # "p":I
    .restart local v22    # "p":I
    goto :goto_2

    .line 189
    .end local v9    # "ext":Ljava/lang/String;
    .end local v19    # "originalName":Ljava/lang/String;
    :cond_3
    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->isEmpty()Z

    move-result v36

    if-nez v36, :cond_5

    .line 190
    new-instance v33, Ljava/lang/String;

    new-instance v36, Ljava/io/FileInputStream;

    move-object/from16 v0, v36

    invoke-direct {v0, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, p0

    move-object/from16 v1, v36

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->streamToByteArray(Ljava/io/InputStream;)[B

    move-result-object v36

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 191
    .local v33, "xml":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v36

    invoke-interface/range {v36 .. v36}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v38

    :goto_3
    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->hasNext()Z

    move-result v36

    if-eqz v36, :cond_4

    invoke-interface/range {v38 .. v38}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v30

    check-cast v30, Ljava/util/Map$Entry;

    .line 192
    .local v30, "stringStringEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface/range {v30 .. v30}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v36

    check-cast v36, Ljava/lang/CharSequence;

    invoke-interface/range {v30 .. v30}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v37

    check-cast v37, Ljava/lang/CharSequence;

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v33

    .line 193
    goto :goto_3

    .line 194
    .end local v30    # "stringStringEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_4
    move-object/from16 v11, v33

    .line 195
    .local v11, "finalXml":Ljava/lang/String;
    new-instance v25, Ljava/util/ArrayList;

    invoke-direct/range {v25 .. v25}, Ljava/util/ArrayList;-><init>()V

    .line 196
    .local v25, "pix":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v36, v0

    new-instance v37, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$1;

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v11, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/lang/String;Ljava/util/List;)V

    invoke-interface/range {v36 .. v37}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 228
    new-instance v34, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;

    invoke-direct/range {v34 .. v34}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;-><init>()V

    .line 230
    .local v34, "xmlEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    invoke-static {v11}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->utf8StringLengthInBytes(Ljava/lang/String;)I

    move-result v36

    move/from16 v0, v36

    int-to-long v0, v0

    move-wide/from16 v36, v0

    move-object/from16 v0, v34

    move-wide/from16 v1, v36

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setSubsampleSize(J)V

    .line 231
    invoke-virtual/range {v31 .. v31}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v34

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 232
    invoke-interface/range {v21 .. v21}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v36

    :goto_4
    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->hasNext()Z

    move-result v37

    if-eqz v37, :cond_6

    invoke-interface/range {v36 .. v36}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/String;

    .line 233
    .restart local v19    # "originalName":Ljava/lang/String;
    new-instance v24, Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v37

    move-object/from16 v0, v24

    move-object/from16 v1, v37

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 234
    .local v24, "pic":Ljava/io/File;
    move-object/from16 v0, v25

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    new-instance v27, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;

    invoke-direct/range {v27 .. v27}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;-><init>()V

    .line 237
    .local v27, "sse":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    invoke-virtual/range {v24 .. v24}, Ljava/io/File;->length()J

    move-result-wide v38

    move-object/from16 v0, v27

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;->setSubsampleSize(J)V

    .line 238
    invoke-virtual/range {v31 .. v31}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;->getSubsampleEntries()Ljava/util/List;

    move-result-object v37

    move-object/from16 v0, v37

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 241
    .end local v11    # "finalXml":Ljava/lang/String;
    .end local v19    # "originalName":Ljava/lang/String;
    .end local v24    # "pic":Ljava/io/File;
    .end local v25    # "pix":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    .end local v27    # "sse":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    .end local v33    # "xml":Ljava/lang/String;
    .end local v34    # "xmlEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry$SubsampleEntry;
    :cond_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v36, v0

    new-instance v37, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;

    move-object/from16 v0, v37

    move-object/from16 v1, p0

    invoke-direct {v0, v1, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$2;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/io/File;)V

    invoke-interface/range {v36 .. v37}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    :cond_6
    add-int/lit8 v26, v26, 0x1

    goto/16 :goto_0

    .line 260
    .end local v4    # "ctx":Ljavax/xml/namespace/NamespaceContext;
    .end local v7    # "doc":Lorg/w3c/dom/Document;
    .end local v8    # "expr":Ljavax/xml/xpath/XPathExpression;
    .end local v10    # "file":Ljava/io/File;
    .end local v13    # "i":I
    .end local v14    # "internalName2Original":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v15    # "lang":Ljava/lang/String;
    .end local v16    # "lastTimeStamp":J
    .end local v18    # "nl":Lorg/w3c/dom/NodeList;
    .end local v21    # "originalNames":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v22    # "p":I
    .end local v31    # "subSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox$SubSampleEntry;
    .end local v32    # "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    .end local v35    # "xpath":Ljavax/xml/xpath/XPath;
    :cond_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v36, v0

    invoke-static {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/Iso639;->convert2to3(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    move-object/from16 v36, v0

    const-string v37, "http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt"

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->setNamespace(Ljava/lang/String;)V

    .line 262
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    move-object/from16 v36, v0

    const-string v37, "http://www.smpte-ra.org/schemas/2052-1/2010/smpte-tt"

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->setSchemaLocation(Ljava/lang/String;)V

    .line 263
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->containsImages:Z

    move/from16 v36, v0

    if-eqz v36, :cond_8

    .line 264
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    move-object/from16 v36, v0

    const-string v37, "image/png"

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->setAuxiliaryMimeTypes(Ljava/lang/String;)V

    .line 268
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-object/from16 v36, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    move-object/from16 v37, v0

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 269
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v36, v0

    const-wide/16 v38, 0x7530

    move-object/from16 v0, v36

    move-wide/from16 v1, v38

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 270
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v36, v0

    const v37, 0xffff

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLayer(I)V

    .line 273
    return-void

    .line 266
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->XMLSubtitleSampleEntry:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;

    move-object/from16 v36, v0

    const-string v37, ""

    invoke-virtual/range {v36 .. v37}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part30/XMLSubtitleSampleEntry;->setAuxiliaryMimeTypes(Ljava/lang/String;)V

    goto :goto_5
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;Ljava/io/InputStream;)[B
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;
    .param p1, "x1"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->streamToByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    return-object v0
.end method

.method public static earliestTimestamp(Lorg/w3c/dom/Document;)J
    .locals 14
    .param p0, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 88
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v9

    .line 89
    .local v9, "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;

    const/4 v11, 0x0

    invoke-direct {v1, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$1;)V

    .line 90
    .local v1, "ctx":Ljavax/xml/namespace/NamespaceContext;
    invoke-virtual {v9}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v10

    .line 91
    .local v10, "xpath":Ljavax/xml/xpath/XPath;
    invoke-interface {v10, v1}, Ljavax/xml/xpath/XPath;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 94
    :try_start_0
    const-string v11, "//*[@begin]"

    invoke-interface {v10, v11}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v8

    .line 95
    .local v8, "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    sget-object v11, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    invoke-interface {v8, p0, v11}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/w3c/dom/NodeList;

    .line 97
    .local v7, "timedNodes":Lorg/w3c/dom/NodeList;
    const-wide/16 v4, 0x0

    .line 98
    .local v4, "earliestTimestamp":J
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v7}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v11

    if-ge v3, v11, :cond_0

    .line 99
    invoke-interface {v7, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 100
    .local v6, "n":Lorg/w3c/dom/Node;
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v11

    const-string v12, "begin"

    invoke-interface {v11, v12}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v11

    invoke-interface {v11}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v0

    .line 101
    .local v0, "begin":Ljava/lang/String;
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->toTime(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13, v4, v5}, Ljava/lang/Math;->min(JJ)J
    :try_end_0
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    .line 98
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 104
    .end local v0    # "begin":Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "earliestTimestamp":J
    .end local v6    # "n":Lorg/w3c/dom/Node;
    .end local v7    # "timedNodes":Lorg/w3c/dom/NodeList;
    .end local v8    # "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    :catch_0
    move-exception v2

    .line 105
    .local v2, "e":Ljavax/xml/xpath/XPathExpressionException;
    new-instance v11, Ljava/lang/RuntimeException;

    invoke-direct {v11, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 103
    .end local v2    # "e":Ljavax/xml/xpath/XPathExpressionException;
    .restart local v3    # "i":I
    .restart local v4    # "earliestTimestamp":J
    .restart local v7    # "timedNodes":Lorg/w3c/dom/NodeList;
    .restart local v8    # "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    :cond_0
    return-wide v4
.end method

.method public static getLanguage(Lorg/w3c/dom/Document;)Ljava/lang/String;
    .locals 2
    .param p0, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 84
    invoke-interface {p0}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v0

    const-string v1, "xml:lang"

    invoke-interface {v0, v1}, Lorg/w3c/dom/Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static latestTimestamp(Lorg/w3c/dom/Document;)J
    .locals 20
    .param p0, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 111
    invoke-static {}, Ljavax/xml/xpath/XPathFactory;->newInstance()Ljavax/xml/xpath/XPathFactory;

    move-result-object v13

    .line 112
    .local v13, "xPathfactory":Ljavax/xml/xpath/XPathFactory;
    new-instance v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;

    const/4 v15, 0x0

    invoke-direct {v3, v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$TextTrackNamespaceContext;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl$1;)V

    .line 113
    .local v3, "ctx":Ljavax/xml/namespace/NamespaceContext;
    invoke-virtual {v13}, Ljavax/xml/xpath/XPathFactory;->newXPath()Ljavax/xml/xpath/XPath;

    move-result-object v14

    .line 114
    .local v14, "xpath":Ljavax/xml/xpath/XPath;
    invoke-interface {v14, v3}, Ljavax/xml/xpath/XPath;->setNamespaceContext(Ljavax/xml/namespace/NamespaceContext;)V

    .line 117
    :try_start_0
    const-string v15, "//*[@begin]"

    invoke-interface {v14, v15}, Ljavax/xml/xpath/XPath;->compile(Ljava/lang/String;)Ljavax/xml/xpath/XPathExpression;

    move-result-object v12

    .line 119
    .local v12, "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    sget-object v15, Ljavax/xml/xpath/XPathConstants;->NODESET:Ljavax/xml/namespace/QName;

    move-object/from16 v0, p0

    invoke-interface {v12, v0, v15}, Ljavax/xml/xpath/XPathExpression;->evaluate(Ljava/lang/Object;Ljavax/xml/namespace/QName;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/w3c/dom/NodeList;

    .line 121
    .local v11, "timedNodes":Lorg/w3c/dom/NodeList;
    const-wide/16 v8, 0x0

    .line 122
    .local v8, "lastTimeStamp":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-interface {v11}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v15

    if-ge v5, v15, :cond_2

    .line 123
    invoke-interface {v11, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    .line 124
    .local v10, "n":Lorg/w3c/dom/Node;
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string v16, "begin"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v2

    .line 126
    .local v2, "begin":Ljava/lang/String;
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string v16, "dur"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-eqz v15, :cond_0

    .line 127
    invoke-static {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->toTime(Ljava/lang/String;)J

    move-result-wide v16

    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string v18, "dur"

    move-object/from16 v0, v18

    invoke-interface {v15, v0}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->toTime(Ljava/lang/String;)J

    move-result-wide v18

    add-long v6, v16, v18

    .line 133
    .local v6, "end":J
    :goto_1
    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    .line 122
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 128
    .end local v6    # "end":J
    :cond_0
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string v16, "end"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    if-eqz v15, :cond_1

    .line 129
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v15

    const-string v16, "end"

    invoke-interface/range {v15 .. v16}, Lorg/w3c/dom/NamedNodeMap;->getNamedItem(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v15

    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->toTime(Ljava/lang/String;)J

    move-result-wide v6

    .restart local v6    # "end":J
    goto :goto_1

    .line 131
    .end local v6    # "end":J
    :cond_1
    new-instance v15, Ljava/lang/RuntimeException;

    const-string v16, "neither end nor dur attribute is present"

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_0
    .catch Ljavax/xml/xpath/XPathExpressionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v2    # "begin":Ljava/lang/String;
    .end local v5    # "i":I
    .end local v8    # "lastTimeStamp":J
    .end local v10    # "n":Lorg/w3c/dom/Node;
    .end local v11    # "timedNodes":Lorg/w3c/dom/NodeList;
    .end local v12    # "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    :catch_0
    move-exception v4

    .line 137
    .local v4, "e":Ljavax/xml/xpath/XPathExpressionException;
    new-instance v15, Ljava/lang/RuntimeException;

    invoke-direct {v15, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v15

    .line 135
    .end local v4    # "e":Ljavax/xml/xpath/XPathExpressionException;
    .restart local v5    # "i":I
    .restart local v8    # "lastTimeStamp":J
    .restart local v11    # "timedNodes":Lorg/w3c/dom/NodeList;
    .restart local v12    # "timedNodesXpath":Ljavax/xml/xpath/XPathExpression;
    :cond_2
    return-wide v8
.end method

.method private streamToByteArray(Ljava/io/InputStream;)[B
    .locals 4
    .param p1, "input"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 276
    const/16 v3, 0x1fa0

    new-array v0, v3, [B

    .line 277
    .local v0, "buffer":[B
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 279
    .local v2, "output":Ljava/io/ByteArrayOutputStream;
    const/4 v1, 0x0

    .line 280
    .local v1, "n":I
    :goto_0
    const/4 v3, -0x1

    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-eq v3, v1, :cond_0

    .line 281
    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 283
    :cond_0
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    return-object v3
.end method

.method static toTime(Ljava/lang/String;)J
    .locals 14
    .param p0, "expr"    # Ljava/lang/String;

    .prologue
    const-wide/16 v12, 0x3e8

    const-wide/16 v10, 0x3c

    .line 62
    const-string v8, "([0-9][0-9]):([0-9][0-9]):([0-9][0-9])([\\.:][0-9][0-9]?[0-9]?)?"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v6

    .line 63
    .local v6, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 64
    .local v2, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 65
    const/4 v8, 0x1

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "hours":Ljava/lang/String;
    const/4 v8, 0x2

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "minutes":Ljava/lang/String;
    const/4 v8, 0x3

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    .line 68
    .local v7, "seconds":Ljava/lang/String;
    const/4 v8, 0x4

    invoke-virtual {v2, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 69
    .local v0, "fraction":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 70
    const-string v0, ".000"

    .line 72
    :cond_0
    const-string v8, ":"

    const-string v9, "."

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 73
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    mul-long/2addr v8, v10

    mul-long/2addr v8, v10

    mul-long v4, v8, v12

    .line 74
    .local v4, "ms":J
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    mul-long/2addr v8, v10

    mul-long/2addr v8, v12

    add-long/2addr v4, v8

    .line 75
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    mul-long/2addr v8, v12

    add-long/2addr v4, v8

    .line 76
    long-to-double v8, v4

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "0"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v10

    const-wide v12, 0x408f400000000000L    # 1000.0

    mul-double/2addr v10, v12

    add-double/2addr v8, v10

    double-to-long v4, v8

    .line 77
    return-wide v4

    .line 79
    .end local v0    # "fraction":Ljava/lang/String;
    .end local v1    # "hours":Ljava/lang/String;
    .end local v3    # "minutes":Ljava/lang/String;
    .end local v4    # "ms":J
    .end local v7    # "seconds":Ljava/lang/String;
    :cond_1
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Cannot match "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " to time expression"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 320
    return-void
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 305
    const-string v0, "subt"

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 287
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 6

    .prologue
    .line 292
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDurations:[J

    array-length v2, v2

    new-array v0, v2, [J

    .line 293
    .local v0, "adoptedSampleDuration":[J
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 294
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->sampleDurations:[J

    aget-wide v2, v2, v1

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->getTimescale()J

    move-result-wide v4

    mul-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    aput-wide v2, v0, v1

    .line 293
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 296
    :cond_0
    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->subSampleInformationBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/SMPTETTTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method
