.class public Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "MediaPresentationDescriptionParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/util/ManifestParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/xml/sax/helpers/DefaultHandler;",
        "Lcom/google/android/exoplayer/util/ManifestParser",
        "<",
        "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;",
        ">;"
    }
.end annotation


# instance fields
.field private final xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 55
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    return-void

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Couldn\'t create XmlPullParserFactory instance"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private checkAdaptationSetTypeConsistency(II)I
    .locals 1
    .param p1, "firstType"    # I
    .param p2, "secondType"    # I

    .prologue
    const/4 v0, -0x1

    .line 237
    if-ne p1, v0, :cond_1

    move p1, p2

    .line 243
    .end local p1    # "firstType":I
    :cond_0
    :goto_0
    return p1

    .line 239
    .restart local p1    # "firstType":I
    :cond_1
    if-eq p2, v0, :cond_0

    .line 242
    if-ne p1, p2, :cond_2

    const/4 v0, 0x1

    :goto_1
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method protected static isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 510
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected static isStartTag(Lorg/xmlpull/v1/XmlPullParser;)Z
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 519
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected static isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 515
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected static parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Landroid/net/Uri;
    .locals 3
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "parentBaseUrl"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 543
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 544
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 545
    .local v1, "newBaseUrlText":Ljava/lang/String;
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 546
    .local v0, "newBaseUri":Landroid/net/Uri;
    invoke-virtual {v0}, Landroid/net/Uri;->isAbsolute()Z

    move-result v2

    if-nez v2, :cond_0

    .line 547
    invoke-static {p1, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 549
    :cond_0
    return-object v0
.end method

.method protected static parseDateTime(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 533
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 534
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 537
    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Util;->parseXsDateTime(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 523
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 524
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 527
    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Util;->parseXsDuration(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I
    .locals 1
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 553
    const/4 v0, -0x1

    invoke-static {p0, p1, v0}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method protected static parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # I

    .prologue
    .line 557
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 558
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":I
    :goto_0
    return p2

    .restart local p2    # "defaultValue":I
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_0
.end method

.method protected static parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 562
    const-wide/16 v0, -0x1

    invoke-static {p0, p1, v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method protected static parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # J

    .prologue
    .line 566
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 567
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":J
    :goto_0
    return-wide p2

    .restart local p2    # "defaultValue":J
    :cond_0
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p2

    goto :goto_0
.end method

.method protected static parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 571
    const/4 v1, 0x0

    invoke-interface {p0, v1, p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 572
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .end local p2    # "defaultValue":Ljava/lang/String;
    :goto_0
    return-object p2

    .restart local p2    # "defaultValue":Ljava/lang/String;
    :cond_0
    move-object p2, v0

    goto :goto_0
.end method


# virtual methods
.method protected buildAdaptationSet(IILjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    .locals 1
    .param p1, "id"    # I
    .param p2, "contentType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Representation;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/ContentProtection;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;"
        }
    .end annotation

    .prologue
    .line 206
    .local p3, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    .local p4, "contentProtections":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/ContentProtection;>;"
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;-><init>(IILjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected buildContentProtection(Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    .locals 2
    .param p1, "schemeIdUri"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 260
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    invoke-direct {v0, p1, v1, v1}, Lcom/google/android/exoplayer/dash/mpd/ContentProtection;-><init>(Ljava/lang/String;Ljava/util/UUID;[B)V

    return-object v0
.end method

.method protected buildFormat(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/chunk/Format;
    .locals 10
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "numChannels"    # I
    .param p6, "audioSamplingRate"    # I
    .param p7, "bandwidth"    # I
    .param p8, "language"    # Ljava/lang/String;
    .param p9, "codecs"    # Ljava/lang/String;

    .prologue
    .line 316
    new-instance v0, Lcom/google/android/exoplayer/chunk/Format;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/chunk/Format;-><init>(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected buildMediaPresentationDescription(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .locals 15
    .param p1, "availabilityStartTime"    # J
    .param p3, "durationMs"    # J
    .param p5, "minBufferTimeMs"    # J
    .param p7, "dynamic"    # Z
    .param p8, "minUpdateTimeMs"    # J
    .param p10, "timeShiftBufferDepthMs"    # J
    .param p12, "utcTiming"    # Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJJZJJ",
            "Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/Period;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;"
        }
    .end annotation

    .prologue
    .line 114
    .local p13, "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Period;>;"
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-wide/from16 v2, p1

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move/from16 v8, p7

    move-wide/from16 v9, p8

    move-wide/from16 v11, p10

    move-object/from16 v13, p12

    move-object/from16 v14, p13

    invoke-direct/range {v1 .. v14}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;-><init>(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/util/List;)V

    return-object v1
.end method

.method protected buildPeriod(Ljava/lang/String;JJLjava/util/List;)Lcom/google/android/exoplayer/dash/mpd/Period;
    .locals 8
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "startMs"    # J
    .param p4, "durationMs"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "JJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/Period;"
        }
    .end annotation

    .prologue
    .line 156
    .local p6, "adaptationSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;>;"
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/Period;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/dash/mpd/Period;-><init>(Ljava/lang/String;JJLjava/util/List;)V

    return-object v0
.end method

.method protected buildRangedUri(Landroid/net/Uri;Ljava/lang/String;JJ)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 9
    .param p1, "baseUrl"    # Landroid/net/Uri;
    .param p2, "urlText"    # Ljava/lang/String;
    .param p3, "rangeStart"    # J
    .param p5, "rangeLength"    # J

    .prologue
    .line 504
    new-instance v1, Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-wide v6, p5

    invoke-direct/range {v1 .. v7}, Lcom/google/android/exoplayer/dash/mpd/RangedUri;-><init>(Landroid/net/Uri;Ljava/lang/String;JJ)V

    return-object v1
.end method

.method protected buildRepresentation(JJLjava/lang/String;ILcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;)Lcom/google/android/exoplayer/dash/mpd/Representation;
    .locals 9
    .param p1, "periodStartMs"    # J
    .param p3, "periodDurationMs"    # J
    .param p5, "contentId"    # Ljava/lang/String;
    .param p6, "revisionId"    # I
    .param p7, "format"    # Lcom/google/android/exoplayer/chunk/Format;
    .param p8, "segmentBase"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase;

    .prologue
    .line 322
    int-to-long v5, p6

    move-wide v0, p1

    move-wide v2, p3

    move-object v4, p5

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-static/range {v0 .. v8}, Lcom/google/android/exoplayer/dash/mpd/Representation;->newInstance(JJLjava/lang/String;JLcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;)Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-result-object v0

    return-object v0
.end method

.method protected buildSegmentList(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;
    .locals 14
    .param p1, "initialization"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "periodDurationMs"    # J
    .param p8, "startNumber"    # I
    .param p9, "duration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            "JJJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            ">;)",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;"
        }
    .end annotation

    .prologue
    .line 402
    .local p11, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .local p12, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-object v1, p1

    move-wide/from16 v2, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move/from16 v8, p8

    move-wide/from16 v9, p9

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected buildSegmentTemplate(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;
    .locals 16
    .param p1, "initialization"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "periodDurationMs"    # J
    .param p8, "startNumber"    # I
    .param p9, "duration"    # J
    .param p12, "initializationTemplate"    # Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    .param p13, "mediaTemplate"    # Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    .param p14, "baseUrl"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/exoplayer/dash/mpd/RangedUri;",
            "JJJIJ",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;",
            "Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;",
            "Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;",
            "Landroid/net/Uri;",
            ")",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;"
        }
    .end annotation

    .prologue
    .line 444
    .local p11, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-object/from16 v1, p1

    move-wide/from16 v2, p2

    move-wide/from16 v4, p4

    move-wide/from16 v6, p6

    move/from16 v8, p8

    move-wide/from16 v9, p9

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    invoke-direct/range {v0 .. v14}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Landroid/net/Uri;)V

    return-object v0
.end method

.method protected buildSegmentTimelineElement(JJ)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;
    .locals 1
    .param p1, "elapsedTime"    # J
    .param p3, "duration"    # J

    .prologue
    .line 468
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;-><init>(JJ)V

    return-object v0
.end method

.method protected buildSingleSegmentBase(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJLandroid/net/Uri;JJ)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    .locals 11
    .param p1, "initialization"    # Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .param p2, "timescale"    # J
    .param p4, "presentationTimeOffset"    # J
    .param p6, "baseUrl"    # Landroid/net/Uri;
    .param p7, "indexStart"    # J
    .param p9, "indexLength"    # J

    .prologue
    .line 358
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p4

    move-object/from16 v6, p6

    move-wide/from16 v7, p7

    move-wide/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;-><init>(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJLandroid/net/Uri;JJ)V

    return-object v0
.end method

.method protected buildUtcTimingElement(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .locals 1
    .param p1, "schemeIdUri"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 125
    new-instance v0, Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;

    invoke-direct {v0, p1, p2}, Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .locals 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .param p3, "contentId"    # Ljava/lang/String;
    .param p4, "baseUrl"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 67
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;

    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 68
    .local v2, "xpp":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v2, p1, p2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 69
    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 70
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_0

    const-string v3, "MPD"

    invoke-interface {v2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 71
    :cond_0
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    const-string v4, "inputStream does not contain a valid media presentation description"

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    .line 75
    .end local v1    # "eventType":I
    .end local v2    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 74
    .end local v0    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v1    # "eventType":I
    .restart local v2    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :cond_1
    :try_start_1
    invoke-virtual {p0, v2, p3, p4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseMediaPresentationDescription(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    return-object v3

    .line 77
    .end local v1    # "eventType":I
    .end local v2    # "xpp":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v0

    .line 78
    .local v0, "e":Ljava/text/ParseException;
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v3, v0}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public bridge synthetic parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-result-object v0

    return-object v0
.end method

.method protected parseAdaptationSet(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;JJLcom/google/android/exoplayer/dash/mpd/SegmentBase;)Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;
    .locals 20
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "baseUrl"    # Landroid/net/Uri;
    .param p4, "periodStartMs"    # J
    .param p6, "periodDurationMs"    # J
    .param p8, "segmentBase"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    const/4 v4, 0x0

    const-string v5, "mimeType"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 166
    .local v12, "mimeType":Ljava/lang/String;
    const/4 v4, 0x0

    const-string v5, "lang"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 167
    .local v13, "language":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseAdaptationSetTypeFromMimeType(Ljava/lang/String;)I

    move-result v16

    .line 169
    .local v16, "contentType":I
    const/16 v17, -0x1

    .line 170
    .local v17, "id":I
    new-instance v15, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;

    invoke-direct {v15}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;-><init>()V

    .line 171
    .local v15, "contentProtectionsBuilder":Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .local v19, "representations":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Representation;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 174
    const-string v4, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 175
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p3

    .line 199
    :cond_1
    :goto_0
    const-string v4, "AdaptationSet"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 201
    invoke-virtual {v15}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;->build()Ljava/util/ArrayList;

    move-result-object v4

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v16

    move-object/from16 v3, v19

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildAdaptationSet(IILjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    move-result-object v4

    return-object v4

    .line 176
    :cond_2
    const-string v4, "ContentProtection"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 177
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    move-result-object v4

    invoke-virtual {v15, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;->addAdaptationSetProtection(Lcom/google/android/exoplayer/dash/mpd/ContentProtection;)V

    goto :goto_0

    .line 178
    :cond_3
    const-string v4, "ContentComponent"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 179
    const/4 v4, 0x0

    const-string v5, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    .line 180
    const/4 v4, 0x0

    const-string v5, "contentType"

    .line 181
    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseAdaptationSetType(Ljava/lang/String;)I

    move-result v4

    .line 180
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->checkAdaptationSetTypeConsistency(II)I

    move-result v16

    goto :goto_0

    .line 182
    :cond_4
    const-string v4, "Representation"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    move-wide/from16 v8, p4

    move-wide/from16 v10, p6

    move-object/from16 v14, p8

    .line 183
    invoke-virtual/range {v4 .. v15}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseRepresentation(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;)Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-result-object v18

    .line 185
    .local v18, "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    invoke-virtual {v15}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;->endRepresentation()V

    .line 186
    move-object/from16 v0, v18

    iget-object v4, v0, Lcom/google/android/exoplayer/dash/mpd/Representation;->format:Lcom/google/android/exoplayer/chunk/Format;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/Format;->mimeType:Ljava/lang/String;

    .line 187
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseAdaptationSetTypeFromMimeType(Ljava/lang/String;)I

    move-result v4

    .line 186
    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v0, v1, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->checkAdaptationSetTypeConsistency(II)I

    move-result v16

    .line 188
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 189
    .end local v18    # "representation":Lcom/google/android/exoplayer/dash/mpd/Representation;
    :cond_5
    const-string v4, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 190
    check-cast p8, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    .end local p8    # "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p8

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-result-object p8

    .restart local p8    # "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    goto/16 :goto_0

    .line 191
    :cond_6
    const-string v4, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    move-object/from16 v7, p8

    .line 192
    check-cast v7, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move-wide/from16 v8, p6

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-result-object p8

    goto/16 :goto_0

    .line 193
    :cond_7
    const-string v4, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_8

    move-object/from16 v7, p8

    .line 194
    check-cast v7, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move-wide/from16 v8, p6

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-result-object p8

    goto/16 :goto_0

    .line 196
    :cond_8
    invoke-static/range {p1 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 197
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseAdaptationSetChild(Lorg/xmlpull/v1/XmlPullParser;)V

    goto/16 :goto_0
.end method

.method protected parseAdaptationSetChild(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 0
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 273
    return-void
.end method

.method protected parseAdaptationSetType(Ljava/lang/String;)I
    .locals 2
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 210
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 213
    :cond_0
    :goto_0
    return v0

    .line 210
    :cond_1
    const-string v1, "audio"

    .line 211
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const-string v1, "video"

    .line 212
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    const-string v1, "text"

    .line 213
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x2

    goto :goto_0
.end method

.method protected parseAdaptationSetTypeFromMimeType(Ljava/lang/String;)I
    .locals 2
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    const/4 v0, -0x1

    .line 218
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 221
    :cond_0
    :goto_0
    return v0

    .line 219
    :cond_1
    invoke-static {p1}, Lcom/google/android/exoplayer/util/MimeTypes;->isAudio(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    .line 220
    :cond_2
    invoke-static {p1}, Lcom/google/android/exoplayer/util/MimeTypes;->isVideo(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v0, 0x0

    goto :goto_0

    .line 221
    :cond_3
    invoke-static {p1}, Lcom/google/android/exoplayer/util/MimeTypes;->isText(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {p1}, Lcom/google/android/exoplayer/util/MimeTypes;->isTtml(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_4
    const/4 v0, 0x2

    goto :goto_0
.end method

.method protected parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer/dash/mpd/ContentProtection;
    .locals 3
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 255
    const/4 v1, 0x0

    const-string v2, "schemeIdUri"

    invoke-interface {p1, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "schemeIdUri":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildContentProtection(Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    move-result-object v1

    return-object v1
.end method

.method protected parseInitialization(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;

    .prologue
    .line 481
    const-string v0, "sourceURL"

    const-string v1, "range"

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method protected parseMediaPresentationDescription(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;
    .locals 20
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "baseUrl"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 84
    const-string v2, "availabilityStartTime"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDateTime(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v18

    .line 85
    .local v18, "availabilityStartTime":J
    const-string v2, "mediaPresentationDuration"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 86
    .local v6, "durationMs":J
    const-string v2, "minBufferTime"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v8

    .line 87
    .local v8, "minBufferTimeMs":J
    const/4 v2, 0x0

    const-string v3, "type"

    move-object/from16 v0, p1

    invoke-interface {v0, v2, v3}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 88
    .local v17, "typeString":Ljava/lang/String;
    if-eqz v17, :cond_2

    const-string v2, "dynamic"

    move-object/from16 v0, v17

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    .line 89
    .local v10, "dynamic":Z
    :goto_0
    if-eqz v10, :cond_3

    const-string v2, "minimumUpdatePeriod"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v11

    .line 90
    .local v11, "minUpdateTimeMs":J
    :goto_1
    if-eqz v10, :cond_4

    const-string v2, "timeShiftBufferDepth"

    const-wide/16 v4, -0x1

    move-object/from16 v0, p1

    invoke-static {v0, v2, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v13

    .line 92
    .local v13, "timeShiftBufferDepthMs":J
    :goto_2
    const/4 v15, 0x0

    .line 94
    .local v15, "utcTiming":Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 96
    .local v16, "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Period;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 97
    const-string v2, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 98
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p3

    .line 104
    :cond_1
    :goto_3
    const-string v2, "MPD"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object/from16 v3, p0

    move-wide/from16 v4, v18

    .line 106
    invoke-virtual/range {v3 .. v16}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildMediaPresentationDescription(JJJZJJLcom/google/android/exoplayer/dash/mpd/UtcTimingElement;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescription;

    move-result-object v2

    return-object v2

    .line 88
    .end local v10    # "dynamic":Z
    .end local v11    # "minUpdateTimeMs":J
    .end local v13    # "timeShiftBufferDepthMs":J
    .end local v15    # "utcTiming":Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .end local v16    # "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Period;>;"
    :cond_2
    const/4 v10, 0x0

    goto :goto_0

    .line 89
    .restart local v10    # "dynamic":Z
    :cond_3
    const-wide/16 v11, -0x1

    goto :goto_1

    .line 90
    .restart local v11    # "minUpdateTimeMs":J
    :cond_4
    const-wide/16 v13, -0x1

    goto :goto_2

    .line 99
    .restart local v13    # "timeShiftBufferDepthMs":J
    .restart local v15    # "utcTiming":Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .restart local v16    # "periods":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/Period;>;"
    :cond_5
    const-string v2, "UTCTiming"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 100
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseUtcTiming(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;

    move-result-object v15

    goto :goto_3

    .line 101
    :cond_6
    const-string v2, "Period"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    .line 102
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parsePeriod(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;J)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3
.end method

.method protected parsePeriod(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;J)Lcom/google/android/exoplayer/dash/mpd/Period;
    .locals 22
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "baseUrl"    # Landroid/net/Uri;
    .param p4, "mpdDurationMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 130
    const/4 v4, 0x0

    const-string v5, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 131
    .local v13, "id":Ljava/lang/String;
    const-string v4, "start"

    const-wide/16 v6, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v4, v6, v7}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v8

    .line 132
    .local v8, "startMs":J
    const-string v4, "duration"

    move-object/from16 v0, p1

    move-wide/from16 v1, p4

    invoke-static {v0, v4, v1, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseDuration(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v10

    .line 133
    .local v10, "durationMs":J
    const/4 v12, 0x0

    .line 134
    .local v12, "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v20, "adaptationSets":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 137
    const-string v4, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 138
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p3

    .line 149
    :cond_1
    :goto_0
    const-string v4, "Period"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    move-object/from16 v14, p0

    move-object v15, v13

    move-wide/from16 v16, v8

    move-wide/from16 v18, v10

    .line 151
    invoke-virtual/range {v14 .. v20}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildPeriod(Ljava/lang/String;JJLjava/util/List;)Lcom/google/android/exoplayer/dash/mpd/Period;

    move-result-object v4

    return-object v4

    .line 139
    :cond_2
    const-string v4, "AdaptationSet"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v7, p3

    .line 140
    invoke-virtual/range {v4 .. v12}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseAdaptationSet(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;JJLcom/google/android/exoplayer/dash/mpd/SegmentBase;)Lcom/google/android/exoplayer/dash/mpd/AdaptationSet;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 142
    :cond_3
    const-string v4, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 143
    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-virtual {v0, v1, v2, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-result-object v12

    goto :goto_0

    .line 144
    :cond_4
    const-string v4, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 145
    const/16 v17, 0x0

    move-object/from16 v14, p0

    move-object/from16 v15, p1

    move-object/from16 v16, p3

    move-wide/from16 v18, v10

    invoke-virtual/range {v14 .. v19}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-result-object v12

    goto :goto_0

    .line 146
    :cond_5
    const-string v4, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 147
    const/16 v17, 0x0

    move-object/from16 v14, p0

    move-object/from16 v15, p1

    move-object/from16 v16, p3

    move-wide/from16 v18, v10

    invoke-virtual/range {v14 .. v19}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-result-object v12

    goto :goto_0
.end method

.method protected parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 16
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;
    .param p3, "urlAttribute"    # Ljava/lang/String;
    .param p4, "rangeAttribute"    # Ljava/lang/String;

    .prologue
    .line 490
    const/4 v3, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-interface {v0, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 491
    .local v5, "urlText":Ljava/lang/String;
    const-wide/16 v6, 0x0

    .line 492
    .local v6, "rangeStart":J
    const-wide/16 v8, -0x1

    .line 493
    .local v8, "rangeLength":J
    const/4 v3, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-interface {v0, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 494
    .local v2, "rangeText":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 495
    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    .line 496
    .local v10, "rangeTextArray":[Ljava/lang/String;
    const/4 v3, 0x0

    aget-object v3, v10, v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 497
    const/4 v3, 0x1

    aget-object v3, v10, v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    sub-long/2addr v12, v6

    const-wide/16 v14, 0x1

    add-long v8, v12, v14

    .end local v10    # "rangeTextArray":[Ljava/lang/String;
    :cond_0
    move-object/from16 v3, p0

    move-object/from16 v4, p2

    .line 499
    invoke-virtual/range {v3 .. v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildRangedUri(Landroid/net/Uri;Ljava/lang/String;JJ)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v3

    return-object v3
.end method

.method protected parseRepresentation(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Landroid/net/Uri;JJLjava/lang/String;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;)Lcom/google/android/exoplayer/dash/mpd/Representation;
    .locals 28
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "contentId"    # Ljava/lang/String;
    .param p3, "baseUrl"    # Landroid/net/Uri;
    .param p4, "periodStartMs"    # J
    .param p6, "periodDurationMs"    # J
    .param p8, "mimeType"    # Ljava/lang/String;
    .param p9, "language"    # Ljava/lang/String;
    .param p10, "segmentBase"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    .param p11, "contentProtectionsBuilder"    # Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 281
    const/4 v4, 0x0

    const-string v5, "id"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 282
    .local v24, "id":Ljava/lang/String;
    const-string v4, "bandwidth"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v11

    .line 283
    .local v11, "bandwidth":I
    const-string v4, "audioSamplingRate"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v10

    .line 284
    .local v10, "audioSamplingRate":I
    const-string v4, "width"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v26

    .line 285
    .local v26, "width":I
    const-string v4, "height"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)I

    move-result v14

    .line 286
    .local v14, "height":I
    const-string v4, "mimeType"

    move-object/from16 v0, p1

    move-object/from16 v1, p8

    invoke-static {v0, v4, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p8

    .line 287
    const-string v4, "codecs"

    const/4 v5, 0x0

    move-object/from16 v0, p1

    invoke-static {v0, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseString(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 289
    .local v13, "codecs":Ljava/lang/String;
    const/4 v9, -0x1

    .local v9, "numChannels":I
    move/from16 v25, v9

    .line 291
    .end local v9    # "numChannels":I
    .local v25, "numChannels":I
    :goto_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 292
    const-string v4, "BaseURL"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 293
    move-object/from16 v0, p1

    move-object/from16 v1, p3

    invoke-static {v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseBaseUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p3

    move/from16 v9, v25

    .line 306
    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    :goto_1
    const-string v4, "Representation"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    move-object/from16 v4, p0

    move-object/from16 v5, v24

    move-object/from16 v6, p8

    move/from16 v7, v26

    move v8, v14

    move-object/from16 v12, p9

    .line 308
    invoke-virtual/range {v4 .. v13}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildFormat(Ljava/lang/String;Ljava/lang/String;IIIIILjava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/chunk/Format;

    move-result-object v22

    .line 310
    .local v22, "format":Lcom/google/android/exoplayer/chunk/Format;
    const/16 v21, -0x1

    if-eqz p10, :cond_6

    move-object/from16 v23, p10

    :goto_2
    move-object/from16 v15, p0

    move-wide/from16 v16, p4

    move-wide/from16 v18, p6

    move-object/from16 v20, p2

    invoke-virtual/range {v15 .. v23}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildRepresentation(JJLjava/lang/String;ILcom/google/android/exoplayer/chunk/Format;Lcom/google/android/exoplayer/dash/mpd/SegmentBase;)Lcom/google/android/exoplayer/dash/mpd/Representation;

    move-result-object v4

    return-object v4

    .line 294
    .end local v9    # "numChannels":I
    .end local v22    # "format":Lcom/google/android/exoplayer/chunk/Format;
    .restart local v25    # "numChannels":I
    :cond_0
    const-string v4, "AudioChannelConfiguration"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 295
    const/4 v4, 0x0

    const-string v5, "value"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    goto :goto_1

    .line 296
    .end local v9    # "numChannels":I
    .restart local v25    # "numChannels":I
    :cond_1
    const-string v4, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 297
    check-cast p10, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    .end local p10    # "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p10

    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-result-object p10

    .restart local p10    # "segmentBase":Lcom/google/android/exoplayer/dash/mpd/SegmentBase;
    move/from16 v9, v25

    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    goto :goto_1

    .line 298
    .end local v9    # "numChannels":I
    .restart local v25    # "numChannels":I
    :cond_2
    const-string v4, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    move-object/from16 v7, p10

    .line 299
    check-cast v7, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move-wide/from16 v8, p6

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-result-object p10

    move/from16 v9, v25

    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    goto :goto_1

    .line 300
    .end local v9    # "numChannels":I
    .restart local v25    # "numChannels":I
    :cond_3
    const-string v4, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object/from16 v7, p10

    .line 301
    check-cast v7, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p3

    move-wide/from16 v8, p6

    invoke-virtual/range {v4 .. v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-result-object p10

    move/from16 v9, v25

    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    goto/16 :goto_1

    .line 303
    .end local v9    # "numChannels":I
    .restart local v25    # "numChannels":I
    :cond_4
    const-string v4, "ContentProtection"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 304
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseContentProtection(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer/dash/mpd/ContentProtection;

    move-result-object v4

    move-object/from16 v0, p11

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser$ContentProtectionsBuilder;->addRepresentationProtection(Lcom/google/android/exoplayer/dash/mpd/ContentProtection;)V

    :cond_5
    move/from16 v9, v25

    .end local v25    # "numChannels":I
    .restart local v9    # "numChannels":I
    goto/16 :goto_1

    .line 310
    .restart local v22    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_6
    new-instance v23, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-object/from16 v0, v23

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;-><init>(Landroid/net/Uri;)V

    goto/16 :goto_2

    .end local v22    # "format":Lcom/google/android/exoplayer/chunk/Format;
    :cond_7
    move/from16 v25, v9

    .end local v9    # "numChannels":I
    .restart local v25    # "numChannels":I
    goto/16 :goto_0
.end method

.method protected parseSegmentBase(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    .locals 22
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;
    .param p3, "parent"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 331
    const-string v4, "timescale"

    if-eqz p3, :cond_3

    move-object/from16 v0, p3

    iget-wide v0, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->timescale:J

    move-wide/from16 v18, v0

    :goto_0
    move-object/from16 v0, p1

    move-wide/from16 v1, v18

    invoke-static {v0, v4, v1, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 332
    .local v6, "timescale":J
    const-string v4, "presentationTimeOffset"

    if-eqz p3, :cond_4

    move-object/from16 v0, p3

    iget-wide v0, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->presentationTimeOffset:J

    move-wide/from16 v18, v0

    :goto_1
    move-object/from16 v0, p1

    move-wide/from16 v1, v18

    invoke-static {v0, v4, v1, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v8

    .line 335
    .local v8, "presentationTimeOffset":J
    if-eqz p3, :cond_5

    move-object/from16 v0, p3

    iget-wide v11, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->indexStart:J

    .line 336
    .local v11, "indexStart":J
    :goto_2
    if-eqz p3, :cond_6

    move-object/from16 v0, p3

    iget-wide v13, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->indexLength:J

    .line 337
    .local v13, "indexLength":J
    :goto_3
    const/4 v4, 0x0

    const-string v10, "indexRange"

    move-object/from16 v0, p1

    invoke-interface {v0, v4, v10}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 338
    .local v16, "indexRangeText":Ljava/lang/String;
    if-eqz v16, :cond_0

    .line 339
    const-string v4, "-"

    move-object/from16 v0, v16

    invoke-virtual {v0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 340
    .local v15, "indexRange":[Ljava/lang/String;
    const/4 v4, 0x0

    aget-object v4, v15, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    .line 341
    const/4 v4, 0x1

    aget-object v4, v15, v4

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v18

    sub-long v18, v18, v11

    const-wide/16 v20, 0x1

    add-long v13, v18, v20

    .line 344
    .end local v15    # "indexRange":[Ljava/lang/String;
    :cond_0
    if-eqz p3, :cond_7

    move-object/from16 v0, p3

    iget-object v5, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;->initialization:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    .line 346
    .local v5, "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    :cond_1
    :goto_4
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 347
    const-string v4, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 348
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v5

    .line 350
    :cond_2
    const-string v4, "SegmentBase"

    move-object/from16 v0, p1

    invoke-static {v0, v4}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    move-object/from16 v4, p0

    move-object/from16 v10, p2

    .line 352
    invoke-virtual/range {v4 .. v14}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildSingleSegmentBase(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJLandroid/net/Uri;JJ)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SingleSegmentBase;

    move-result-object v4

    return-object v4

    .line 331
    .end local v5    # "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .end local v6    # "timescale":J
    .end local v8    # "presentationTimeOffset":J
    .end local v11    # "indexStart":J
    .end local v13    # "indexLength":J
    .end local v16    # "indexRangeText":Ljava/lang/String;
    :cond_3
    const-wide/16 v18, 0x1

    goto :goto_0

    .line 332
    .restart local v6    # "timescale":J
    :cond_4
    const-wide/16 v18, 0x0

    goto :goto_1

    .line 335
    .restart local v8    # "presentationTimeOffset":J
    :cond_5
    const-wide/16 v11, 0x0

    goto :goto_2

    .line 336
    .restart local v11    # "indexStart":J
    :cond_6
    const-wide/16 v13, -0x1

    goto :goto_3

    .line 344
    .restart local v13    # "indexLength":J
    .restart local v16    # "indexRangeText":Ljava/lang/String;
    :cond_7
    const/4 v5, 0x0

    goto :goto_4
.end method

.method protected parseSegmentList(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;
    .locals 16
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;
    .param p3, "parent"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;
    .param p4, "periodDurationMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 365
    const-string v2, "timescale"

    if-eqz p3, :cond_3

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->timescale:J

    :goto_0
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 366
    .local v4, "timescale":J
    const-string v2, "presentationTimeOffset"

    if-eqz p3, :cond_4

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->presentationTimeOffset:J

    :goto_1
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 368
    .local v6, "presentationTimeOffset":J
    const-string v2, "duration"

    if-eqz p3, :cond_5

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->duration:J

    :goto_2
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v11

    .line 369
    .local v11, "duration":J
    const-string v8, "startNumber"

    if-eqz p3, :cond_6

    move-object/from16 v0, p3

    iget v2, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->startNumber:I

    :goto_3
    move-object/from16 v0, p1

    invoke-static {v0, v8, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v10

    .line 371
    .local v10, "startNumber":I
    const/4 v3, 0x0

    .line 372
    .local v3, "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    const/4 v13, 0x0

    .line 373
    .local v13, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    const/4 v14, 0x0

    .line 376
    .local v14, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 377
    const-string v2, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 378
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v3

    .line 387
    :cond_1
    :goto_4
    const-string v2, "SegmentList"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 389
    if-eqz p3, :cond_2

    .line 390
    if-eqz v3, :cond_a

    .line 391
    :goto_5
    if-eqz v13, :cond_b

    .line 392
    :goto_6
    if-eqz v14, :cond_c

    :cond_2
    :goto_7
    move-object/from16 v2, p0

    move-wide/from16 v8, p4

    .line 395
    invoke-virtual/range {v2 .. v14}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildSegmentList(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Ljava/util/List;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;

    move-result-object v2

    return-object v2

    .line 365
    .end local v3    # "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .end local v4    # "timescale":J
    .end local v6    # "presentationTimeOffset":J
    .end local v10    # "startNumber":I
    .end local v11    # "duration":J
    .end local v13    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .end local v14    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    :cond_3
    const-wide/16 v8, 0x1

    goto :goto_0

    .line 366
    .restart local v4    # "timescale":J
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_1

    .line 368
    .restart local v6    # "presentationTimeOffset":J
    :cond_5
    const-wide/16 v8, -0x1

    goto :goto_2

    .line 369
    .restart local v11    # "duration":J
    :cond_6
    const/4 v2, 0x1

    goto :goto_3

    .line 379
    .restart local v3    # "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .restart local v10    # "startNumber":I
    .restart local v13    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .restart local v14    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    :cond_7
    const-string v2, "SegmentTimeline"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 380
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v13

    goto :goto_4

    .line 381
    :cond_8
    const-string v2, "SegmentURL"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 382
    if-nez v14, :cond_9

    .line 383
    new-instance v14, Ljava/util/ArrayList;

    .end local v14    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 385
    .restart local v14    # "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/RangedUri;>;"
    :cond_9
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v2

    invoke-interface {v14, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 390
    :cond_a
    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->initialization:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    goto :goto_5

    .line 391
    :cond_b
    move-object/from16 v0, p3

    iget-object v13, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->segmentTimeline:Ljava/util/List;

    goto :goto_6

    .line 392
    :cond_c
    move-object/from16 v0, p3

    iget-object v14, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentList;->mediaSegments:Ljava/util/List;

    goto :goto_7
.end method

.method protected parseSegmentTemplate(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;J)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;
    .locals 18
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;
    .param p3, "parent"    # Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;
    .param p4, "periodDurationMs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 409
    const-string v2, "timescale"

    if-eqz p3, :cond_3

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->timescale:J

    :goto_0
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 410
    .local v4, "timescale":J
    const-string v2, "presentationTimeOffset"

    if-eqz p3, :cond_4

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->presentationTimeOffset:J

    :goto_1
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v6

    .line 412
    .local v6, "presentationTimeOffset":J
    const-string v2, "duration"

    if-eqz p3, :cond_5

    move-object/from16 v0, p3

    iget-wide v8, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->duration:J

    :goto_2
    move-object/from16 v0, p1

    invoke-static {v0, v2, v8, v9}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v11

    .line 413
    .local v11, "duration":J
    const-string v8, "startNumber"

    if-eqz p3, :cond_6

    move-object/from16 v0, p3

    iget v2, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->startNumber:I

    :goto_3
    move-object/from16 v0, p1

    invoke-static {v0, v8, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v10

    .line 414
    .local v10, "startNumber":I
    const-string v8, "media"

    if-eqz p3, :cond_7

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->mediaTemplate:Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    :goto_4
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v8, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;)Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    move-result-object v15

    .line 416
    .local v15, "mediaTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    const-string v8, "initialization"

    if-eqz p3, :cond_8

    move-object/from16 v0, p3

    iget-object v2, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->initializationTemplate:Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual {v0, v1, v8, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;)Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    move-result-object v14

    .line 419
    .local v14, "initializationTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    const/4 v3, 0x0

    .line 420
    .local v3, "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    const/4 v13, 0x0

    .line 423
    .local v13, "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    :cond_0
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 424
    const-string v2, "Initialization"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 425
    invoke-virtual/range {p0 .. p2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInitialization(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v3

    .line 429
    :cond_1
    :goto_6
    const-string v2, "SegmentTemplate"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 431
    if-eqz p3, :cond_2

    .line 432
    if-eqz v3, :cond_a

    .line 433
    :goto_7
    if-eqz v13, :cond_b

    :cond_2
    :goto_8
    move-object/from16 v2, p0

    move-wide/from16 v8, p4

    move-object/from16 v16, p2

    .line 436
    invoke-virtual/range {v2 .. v16}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildSegmentTemplate(Lcom/google/android/exoplayer/dash/mpd/RangedUri;JJJIJLjava/util/List;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;

    move-result-object v2

    return-object v2

    .line 409
    .end local v3    # "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .end local v4    # "timescale":J
    .end local v6    # "presentationTimeOffset":J
    .end local v10    # "startNumber":I
    .end local v11    # "duration":J
    .end local v13    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .end local v14    # "initializationTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    .end local v15    # "mediaTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    :cond_3
    const-wide/16 v8, 0x1

    goto :goto_0

    .line 410
    .restart local v4    # "timescale":J
    :cond_4
    const-wide/16 v8, 0x0

    goto :goto_1

    .line 412
    .restart local v6    # "presentationTimeOffset":J
    :cond_5
    const-wide/16 v8, -0x1

    goto :goto_2

    .line 413
    .restart local v11    # "duration":J
    :cond_6
    const/4 v2, 0x1

    goto :goto_3

    .line 414
    .restart local v10    # "startNumber":I
    :cond_7
    const/4 v2, 0x0

    goto :goto_4

    .line 416
    .restart local v15    # "mediaTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    :cond_8
    const/4 v2, 0x0

    goto :goto_5

    .line 426
    .restart local v3    # "initialization":Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .restart local v13    # "timeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    .restart local v14    # "initializationTemplate":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    :cond_9
    const-string v2, "SegmentTimeline"

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 427
    invoke-virtual/range {p0 .. p1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;

    move-result-object v13

    goto :goto_6

    .line 432
    :cond_a
    move-object/from16 v0, p3

    iget-object v3, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->initialization:Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    goto :goto_7

    .line 433
    :cond_b
    move-object/from16 v0, p3

    iget-object v13, v0, Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTemplate;->segmentTimeline:Ljava/util/List;

    goto :goto_8
.end method

.method protected parseSegmentTimeline(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/List;
    .locals 9
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 450
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 451
    .local v6, "segmentTimeline":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;>;"
    const-wide/16 v4, 0x0

    .line 453
    .local v4, "elapsedTime":J
    :cond_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 454
    const-string v7, "S"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isStartTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 455
    const-string v7, "t"

    invoke-static {p1, v7, v4, v5}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;J)J

    move-result-wide v4

    .line 456
    const-string v7, "d"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseLong(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)J

    move-result-wide v2

    .line 457
    .local v2, "duration":J
    const-string v7, "r"

    const/4 v8, 0x0

    invoke-static {p1, v7, v8}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseInt(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)I

    move-result v7

    add-int/lit8 v0, v7, 0x1

    .line 458
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 459
    invoke-virtual {p0, v4, v5, v2, v3}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildSegmentTimelineElement(JJ)Lcom/google/android/exoplayer/dash/mpd/SegmentBase$SegmentTimelineElement;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 460
    add-long/2addr v4, v2

    .line 458
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 463
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "duration":J
    :cond_1
    const-string v7, "SegmentTimeline"

    invoke-static {p1, v7}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->isEndTag(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 464
    return-object v6
.end method

.method protected parseSegmentUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "baseUrl"    # Landroid/net/Uri;

    .prologue
    .line 485
    const-string v0, "media"

    const-string v1, "mediaRange"

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->parseRangedUrl(Lorg/xmlpull/v1/XmlPullParser;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/RangedUri;

    move-result-object v0

    return-object v0
.end method

.method protected parseUrlTemplate(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;)Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    .locals 2
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    .prologue
    .line 473
    const/4 v1, 0x0

    invoke-interface {p1, v1, p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 474
    .local v0, "valueString":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 475
    invoke-static {v0}, Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;->compile(Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;

    move-result-object p3

    .line 477
    .end local p3    # "defaultValue":Lcom/google/android/exoplayer/dash/mpd/UrlTemplate;
    :cond_0
    return-object p3
.end method

.method protected parseUtcTiming(Lorg/xmlpull/v1/XmlPullParser;)Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;
    .locals 4
    .param p1, "xpp"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    const/4 v3, 0x0

    .line 119
    const-string v2, "schemeIdUri"

    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "schemeIdUri":Ljava/lang/String;
    const-string v2, "value"

    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 121
    .local v1, "value":Ljava/lang/String;
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer/dash/mpd/MediaPresentationDescriptionParser;->buildUtcTimingElement(Ljava/lang/String;Ljava/lang/String;)Lcom/google/android/exoplayer/dash/mpd/UtcTimingElement;

    move-result-object v2

    return-object v2
.end method
