.class public Lcom/google/android/exoplayer/text/ttml/TtmlParser;
.super Ljava/lang/Object;
.source "TtmlParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/text/SubtitleParser;


# static fields
.field private static final ATTR_BEGIN:Ljava/lang/String; = "begin"

.field private static final ATTR_DURATION:Ljava/lang/String; = "dur"

.field private static final ATTR_END:Ljava/lang/String; = "end"

.field private static final CLOCK_TIME:Ljava/util/regex/Pattern;

.field private static final DEFAULT_FRAMERATE:I = 0x1e

.field private static final DEFAULT_SUBFRAMERATE:I = 0x1

.field private static final DEFAULT_TICKRATE:I = 0x1

.field private static final OFFSET_TIME:Ljava/util/regex/Pattern;

.field private static final TAG:Ljava/lang/String; = "TtmlParser"


# instance fields
.field private final strictParsing:Z

.field private final xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const-string v0, "^([0-9][0-9]+):([0-9][0-9]):([0-9][0-9])(?:(\\.[0-9]+)|:([0-9][0-9])(?:\\.([0-9]+))?)?$"

    .line 66
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->CLOCK_TIME:Ljava/util/regex/Pattern;

    .line 68
    const-string v0, "^([0-9]+(?:\\.[0-9]+)?)(h|m|s|ms|f|t)$"

    .line 69
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->OFFSET_TIME:Ljava/util/regex/Pattern;

    .line 68
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 83
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;-><init>(Z)V

    .line 84
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 3
    .param p1, "strictParsing"    # Z

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    iput-boolean p1, p0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->strictParsing:Z

    .line 95
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Couldn\'t create XmlPullParserFactory instance"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static isSupportedTag(Ljava/lang/String;)Z
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 208
    const-string v0, "tt"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "head"

    .line 209
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "body"

    .line 210
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "div"

    .line 211
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "p"

    .line 212
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "span"

    .line 213
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "br"

    .line 214
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "style"

    .line 215
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "styling"

    .line 216
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "layout"

    .line 217
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "region"

    .line 218
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "metadata"

    .line 219
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "smpte:image"

    .line 220
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "smpte:data"

    .line 221
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "smpte:information"

    .line 222
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 223
    :cond_0
    const/4 v0, 0x1

    .line 225
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private parseNode(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlNode;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .locals 16
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p2, "parent"    # Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 166
    const-wide/16 v4, 0x0

    .line 167
    .local v4, "duration":J
    const-wide/16 v10, -0x1

    .line 168
    .local v10, "startTime":J
    const-wide/16 v6, -0x1

    .line 169
    .local v6, "endTime":J
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v3

    .line 170
    .local v3, "attributeCount":I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_0
    if-ge v8, v3, :cond_3

    .line 172
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "^.*:"

    const-string v14, ""

    invoke-virtual {v12, v13, v14}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "attr":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v9

    .line 174
    .local v9, "value":Ljava/lang/String;
    const-string v12, "begin"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 175
    const/16 v12, 0x1e

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-static {v9, v12, v13, v14}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v10

    .line 170
    :cond_0
    :goto_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 177
    :cond_1
    const-string v12, "end"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 178
    const/16 v12, 0x1e

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-static {v9, v12, v13, v14}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v6

    goto :goto_1

    .line 180
    :cond_2
    const-string v12, "dur"

    invoke-virtual {v2, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_0

    .line 181
    const/16 v12, 0x1e

    const/4 v13, 0x1

    const/4 v14, 0x1

    invoke-static {v9, v12, v13, v14}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseTimeExpression(Ljava/lang/String;III)J

    move-result-wide v4

    goto :goto_1

    .line 187
    .end local v2    # "attr":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :cond_3
    if-eqz p2, :cond_5

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-eqz v12, :cond_5

    .line 188
    const-wide/16 v12, -0x1

    cmp-long v12, v10, v12

    if-eqz v12, :cond_4

    .line 189
    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    add-long/2addr v10, v12

    .line 191
    :cond_4
    const-wide/16 v12, -0x1

    cmp-long v12, v6, v12

    if-eqz v12, :cond_5

    .line 192
    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->startTimeUs:J

    add-long/2addr v6, v12

    .line 195
    :cond_5
    const-wide/16 v12, -0x1

    cmp-long v12, v6, v12

    if-nez v12, :cond_6

    .line 196
    const-wide/16 v12, 0x0

    cmp-long v12, v4, v12

    if-lez v12, :cond_7

    .line 198
    add-long v6, v10, v4

    .line 204
    :cond_6
    :goto_2
    invoke-interface/range {p1 .. p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12, v10, v11, v6, v7}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->buildNode(Ljava/lang/String;JJ)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v12

    return-object v12

    .line 199
    :cond_7
    if-eqz p2, :cond_6

    move-object/from16 v0, p2

    iget-wide v12, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-eqz v12, :cond_6

    .line 201
    move-object/from16 v0, p2

    iget-wide v6, v0, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->endTimeUs:J

    goto :goto_2
.end method

.method private static parseTimeExpression(Ljava/lang/String;III)J
    .locals 20
    .param p0, "time"    # Ljava/lang/String;
    .param p1, "frameRate"    # I
    .param p2, "subframeRate"    # I
    .param p3, "tickRate"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 243
    sget-object v15, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->CLOCK_TIME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 244
    .local v7, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_3

    .line 245
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 246
    .local v6, "hours":Ljava/lang/String;
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    const-wide/16 v18, 0xe10

    mul-long v16, v16, v18

    move-wide/from16 v0, v16

    long-to-double v2, v0

    .line 247
    .local v2, "durationSeconds":D
    const/4 v15, 0x2

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    .line 248
    .local v8, "minutes":Ljava/lang/String;
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    const-wide/16 v18, 0x3c

    mul-long v16, v16, v18

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    add-double v2, v2, v16

    .line 249
    const/4 v15, 0x3

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    .line 250
    .local v9, "seconds":Ljava/lang/String;
    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    add-double v2, v2, v16

    .line 251
    const/4 v15, 0x4

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "fraction":Ljava/lang/String;
    if-eqz v4, :cond_0

    invoke-static {v4}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v16

    :goto_0
    add-double v2, v2, v16

    .line 253
    const/4 v15, 0x5

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, "frames":Ljava/lang/String;
    if-eqz v5, :cond_1

    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    :goto_1
    add-double v2, v2, v16

    .line 255
    const/4 v15, 0x6

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    .line 256
    .local v12, "subframes":Ljava/lang/String;
    if-eqz v12, :cond_2

    .line 257
    invoke-static {v12}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    move-wide/from16 v0, v16

    long-to-double v0, v0

    move-wide/from16 v16, v0

    move/from16 v0, p2

    int-to-double v0, v0

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v18, v0

    div-double v16, v16, v18

    :goto_2
    add-double v2, v2, v16

    .line 258
    const-wide v16, 0x412e848000000000L    # 1000000.0

    mul-double v16, v16, v2

    move-wide/from16 v0, v16

    double-to-long v0, v0

    move-wide/from16 v16, v0

    .line 278
    .end local v2    # "durationSeconds":D
    .end local v4    # "fraction":Ljava/lang/String;
    .end local v5    # "frames":Ljava/lang/String;
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v9    # "seconds":Ljava/lang/String;
    .end local v12    # "subframes":Ljava/lang/String;
    :goto_3
    return-wide v16

    .line 252
    .restart local v2    # "durationSeconds":D
    .restart local v4    # "fraction":Ljava/lang/String;
    .restart local v6    # "hours":Ljava/lang/String;
    .restart local v8    # "minutes":Ljava/lang/String;
    .restart local v9    # "seconds":Ljava/lang/String;
    :cond_0
    const-wide/16 v16, 0x0

    goto :goto_0

    .line 254
    .restart local v5    # "frames":Ljava/lang/String;
    :cond_1
    const-wide/16 v16, 0x0

    goto :goto_1

    .line 257
    .restart local v12    # "subframes":Ljava/lang/String;
    :cond_2
    const-wide/16 v16, 0x0

    goto :goto_2

    .line 260
    .end local v2    # "durationSeconds":D
    .end local v4    # "fraction":Ljava/lang/String;
    .end local v5    # "frames":Ljava/lang/String;
    .end local v6    # "hours":Ljava/lang/String;
    .end local v8    # "minutes":Ljava/lang/String;
    .end local v9    # "seconds":Ljava/lang/String;
    .end local v12    # "subframes":Ljava/lang/String;
    :cond_3
    sget-object v15, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->OFFSET_TIME:Ljava/util/regex/Pattern;

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v7

    .line 261
    invoke-virtual {v7}, Ljava/util/regex/Matcher;->matches()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 262
    const/4 v15, 0x1

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v13

    .line 263
    .local v13, "timeValue":Ljava/lang/String;
    invoke-static {v13}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v10

    .line 264
    .local v10, "offsetSeconds":D
    const/4 v15, 0x2

    invoke-virtual {v7, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v14

    .line 265
    .local v14, "unit":Ljava/lang/String;
    const-string v15, "h"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_5

    .line 266
    const-wide v16, 0x40ac200000000000L    # 3600.0

    mul-double v10, v10, v16

    .line 278
    :cond_4
    :goto_4
    const-wide v16, 0x412e848000000000L    # 1000000.0

    mul-double v16, v16, v10

    move-wide/from16 v0, v16

    double-to-long v0, v0

    move-wide/from16 v16, v0

    goto :goto_3

    .line 267
    :cond_5
    const-string v15, "m"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_6

    .line 268
    const-wide/high16 v16, 0x404e000000000000L    # 60.0

    mul-double v10, v10, v16

    goto :goto_4

    .line 269
    :cond_6
    const-string v15, "s"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_4

    .line 271
    const-string v15, "ms"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 272
    const-wide v16, 0x408f400000000000L    # 1000.0

    div-double v10, v10, v16

    goto :goto_4

    .line 273
    :cond_7
    const-string v15, "f"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 274
    move/from16 v0, p1

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v10, v10, v16

    goto :goto_4

    .line 275
    :cond_8
    const-string v15, "t"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_4

    .line 276
    move/from16 v0, p3

    int-to-double v0, v0

    move-wide/from16 v16, v0

    div-double v10, v10, v16

    goto :goto_4

    .line 280
    .end local v10    # "offsetSeconds":D
    .end local v13    # "timeValue":Ljava/lang/String;
    .end local v14    # "unit":Ljava/lang/String;
    :cond_9
    new-instance v15, Lcom/google/android/exoplayer/ParserException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Malformed time expression: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v15
.end method


# virtual methods
.method public canParse(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 162
    const-string v0, "application/ttml+xml"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;J)Lcom/google/android/exoplayer/text/Subtitle;
    .locals 15
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .param p3, "startTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 105
    :try_start_0
    iget-object v12, p0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;

    invoke-virtual {v12}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v10

    .line 106
    .local v10, "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface {v10, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 107
    const/4 v8, 0x0

    .line 108
    .local v8, "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    .line 109
    .local v6, "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    const/4 v9, 0x0

    .line 110
    .local v9, "unsupportedNodeDepth":I
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v3

    .line 111
    .local v3, "eventType":I
    :goto_0
    const/4 v12, 0x1

    if-eq v3, v12, :cond_8

    .line 112
    invoke-virtual {v6}, Ljava/util/LinkedList;->peekLast()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    .line 113
    .local v7, "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    if-nez v9, :cond_6

    .line 114
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 115
    .local v4, "name":Ljava/lang/String;
    const/4 v12, 0x2

    if-ne v3, v12, :cond_3

    .line 116
    invoke-static {v4}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->isSupportedTag(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 117
    const-string v12, "TtmlParser"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Ignoring unsupported tag: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    add-int/lit8 v9, v9, 0x1

    .line 151
    .end local v4    # "name":Ljava/lang/String;
    :cond_0
    :goto_1
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 152
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v3

    .line 153
    goto :goto_0

    .line 121
    .restart local v4    # "name":Ljava/lang/String;
    :cond_1
    :try_start_1
    invoke-direct {p0, v10, v7}, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->parseNode(Lorg/xmlpull/v1/XmlPullParser;Lcom/google/android/exoplayer/text/ttml/TtmlNode;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v5

    .line 122
    .local v5, "node":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    invoke-virtual {v6, v5}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 123
    if-eqz v7, :cond_0

    .line 124
    invoke-virtual {v7, v5}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V
    :try_end_1
    .catch Lcom/google/android/exoplayer/ParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 126
    .end local v5    # "node":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    :catch_0
    move-exception v2

    .line 127
    .local v2, "e":Lcom/google/android/exoplayer/ParserException;
    :try_start_2
    iget-boolean v12, p0, Lcom/google/android/exoplayer/text/ttml/TtmlParser;->strictParsing:Z

    if-eqz v12, :cond_2

    .line 128
    throw v2
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_1

    .line 155
    .end local v2    # "e":Lcom/google/android/exoplayer/ParserException;
    .end local v3    # "eventType":I
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .end local v7    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .end local v8    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .end local v9    # "unsupportedNodeDepth":I
    .end local v10    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_1
    move-exception v11

    .line 156
    .local v11, "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v12, Lcom/google/android/exoplayer/ParserException;

    const-string v13, "Unable to parse source"

    invoke-direct {v12, v13, v11}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v12

    .line 130
    .end local v11    # "xppe":Lorg/xmlpull/v1/XmlPullParserException;
    .restart local v2    # "e":Lcom/google/android/exoplayer/ParserException;
    .restart local v3    # "eventType":I
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v6    # "nodeStack":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/google/android/exoplayer/text/ttml/TtmlNode;>;"
    .restart local v7    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    .restart local v8    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    .restart local v9    # "unsupportedNodeDepth":I
    .restart local v10    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :cond_2
    :try_start_3
    const-string v12, "TtmlParser"

    const-string v13, "Suppressing parser error"

    invoke-static {v12, v13, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 132
    add-int/lit8 v9, v9, 0x1

    .line 134
    goto :goto_1

    .line 136
    .end local v2    # "e":Lcom/google/android/exoplayer/ParserException;
    :cond_3
    const/4 v12, 0x4

    if-ne v3, v12, :cond_4

    .line 137
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->buildTextNode(Ljava/lang/String;)Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/google/android/exoplayer/text/ttml/TtmlNode;->addChild(Lcom/google/android/exoplayer/text/ttml/TtmlNode;)V

    goto :goto_1

    .line 138
    :cond_4
    const/4 v12, 0x3

    if-ne v3, v12, :cond_0

    .line 139
    invoke-interface {v10}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v12

    const-string v13, "tt"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 140
    new-instance v8, Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;

    .end local v8    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    invoke-virtual {v6}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/android/exoplayer/text/ttml/TtmlNode;

    move-wide/from16 v0, p3

    invoke-direct {v8, v12, v0, v1}, Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;-><init>(Lcom/google/android/exoplayer/text/ttml/TtmlNode;J)V

    .line 142
    .restart local v8    # "ttmlSubtitle":Lcom/google/android/exoplayer/text/ttml/TtmlSubtitle;
    :cond_5
    invoke-virtual {v6}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;
    :try_end_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    .line 145
    .end local v4    # "name":Ljava/lang/String;
    :cond_6
    const/4 v12, 0x2

    if-ne v3, v12, :cond_7

    .line 146
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 147
    :cond_7
    const/4 v12, 0x3

    if-ne v3, v12, :cond_0

    .line 148
    add-int/lit8 v9, v9, -0x1

    goto :goto_1

    .line 154
    .end local v7    # "parent":Lcom/google/android/exoplayer/text/ttml/TtmlNode;
    :cond_8
    return-object v8
.end method
