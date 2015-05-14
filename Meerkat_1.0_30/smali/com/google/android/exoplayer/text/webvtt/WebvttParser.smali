.class public Lcom/google/android/exoplayer/text/webvtt/WebvttParser;
.super Ljava/lang/Object;
.source "WebvttParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/text/SubtitleParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
    }
.end annotation


# static fields
.field public static final EXO_HEADER:Ljava/lang/String; = "EXO-HEADER"

.field private static final MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;

.field private static final MEDIA_TIMESTAMP_OFFSET:Ljava/util/regex/Pattern;

.field public static final OFFSET:Ljava/lang/String; = "OFFSET:"

.field private static final SAMPLING_RATE:J = 0x5aL

.field private static final WEBVTT_CUE_IDENTIFIER:Ljava/util/regex/Pattern;

.field private static final WEBVTT_CUE_IDENTIFIER_STRING:Ljava/lang/String; = "^(?!.*(-->)).*$"

.field private static final WEBVTT_CUE_TAG_STRING:Ljava/lang/String; = "\\<.*?>"

.field private static final WEBVTT_METADATA_HEADER:Ljava/util/regex/Pattern;

.field private static final WEBVTT_METADATA_HEADER_STRING:Ljava/lang/String; = "\\S*[:=]\\S*"

.field private static final WEBVTT_TIMESTAMP:Ljava/util/regex/Pattern;

.field private static final WEBVTT_TIMESTAMP_STRING:Ljava/lang/String; = "(\\d+:)?[0-5]\\d:[0-5]\\d\\.\\d{3}"


# instance fields
.field private final filterTags:Z

.field private final strictParsing:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 56
    const-string v0, "\\S*[:=]\\S*"

    .line 57
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_METADATA_HEADER:Ljava/util/regex/Pattern;

    .line 60
    const-string v0, "^(?!.*(-->)).*$"

    .line 61
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_CUE_IDENTIFIER:Ljava/util/regex/Pattern;

    .line 64
    const-string v0, "(\\d+:)?[0-5]\\d:[0-5]\\d\\.\\d{3}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_TIMESTAMP:Ljava/util/regex/Pattern;

    .line 66
    const-string v0, "OFFSET:\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->MEDIA_TIMESTAMP_OFFSET:Ljava/util/regex/Pattern;

    .line 67
    const-string v0, "MPEGTS:\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 75
    invoke-direct {p0, v0, v0}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;-><init>(ZZ)V

    .line 76
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0
    .param p1, "strictParsing"    # Z
    .param p2, "filterTags"    # Z

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput-boolean p1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->strictParsing:Z

    .line 80
    iput-boolean p2, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->filterTags:Z

    .line 81
    return-void
.end method

.method private static parseTimestampUs(Ljava/lang/String;)J
    .locals 14
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NumberFormatException;
        }
    .end annotation

    .prologue
    const-wide/16 v12, 0x3e8

    const/4 v4, 0x0

    .line 231
    const-string v5, "(\\d+:)?[0-5]\\d:[0-5]\\d\\.\\d{3}"

    invoke-virtual {p0, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 232
    new-instance v4, Ljava/lang/NumberFormatException;

    const-string v5, "has invalid format"

    invoke-direct {v4, v5}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 235
    :cond_0
    const-string v5, "\\."

    const/4 v6, 0x2

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 236
    .local v1, "parts":[Ljava/lang/String;
    const-wide/16 v2, 0x0

    .line 237
    .local v2, "value":J
    aget-object v5, v1, v4

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v6, v5

    :goto_0
    if-ge v4, v6, :cond_1

    aget-object v0, v5, v4

    .line 238
    .local v0, "group":Ljava/lang/String;
    const-wide/16 v8, 0x3c

    mul-long/2addr v8, v2

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    add-long v2, v8, v10

    .line 237
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 240
    .end local v0    # "group":Ljava/lang/String;
    :cond_1
    mul-long v4, v2, v12

    const/4 v6, 0x1

    aget-object v6, v1, v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    add-long/2addr v4, v6

    mul-long/2addr v4, v12

    return-wide v4
.end method


# virtual methods
.method public canParse(Ljava/lang/String;)Z
    .locals 1
    .param p1, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 204
    const-string v0, "text/vtt"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected getAdjustedStartTime(J)J
    .locals 1
    .param p1, "startTimeUs"    # J

    .prologue
    .line 208
    return-wide p1
.end method

.method protected handleNoncompliantLine(Ljava/lang/String;)V
    .locals 3
    .param p1, "line"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 225
    iget-boolean v0, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->strictParsing:Z

    if-eqz v0, :cond_0

    .line 226
    new-instance v0, Lcom/google/android/exoplayer/ParserException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected line: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_0
    return-void
.end method

.method public bridge synthetic parse(Ljava/io/InputStream;Ljava/lang/String;J)Lcom/google/android/exoplayer/text/Subtitle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 36
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->parse(Ljava/io/InputStream;Ljava/lang/String;J)Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;Ljava/lang/String;J)Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;
    .locals 29
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .param p3, "startTimeUs"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 86
    new-instance v21, Ljava/util/ArrayList;

    invoke-direct/range {v21 .. v21}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v21, "subtitles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;>;"
    move-wide/from16 v18, p3

    .line 88
    .local v18, "mediaTimestampUs":J
    const-wide/16 v16, 0x0

    .line 90
    .local v16, "mediaTimestampOffsetUs":J
    new-instance v23, Ljava/io/BufferedReader;

    new-instance v24, Ljava/io/InputStreamReader;

    const-string v25, "UTF-8"

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, v25

    invoke-direct {v0, v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct/range {v23 .. v24}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 94
    .local v23, "webvttData":Ljava/io/BufferedReader;
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 95
    .local v13, "line":Ljava/lang/String;
    if-nez v13, :cond_0

    .line 96
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "Expected WEBVTT or EXO-HEADER. Got null"

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 99
    :cond_0
    const-string v24, "EXO-HEADER"

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 101
    sget-object v24, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->MEDIA_TIMESTAMP_OFFSET:Ljava/util/regex/Pattern;

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 102
    .local v14, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-eqz v24, :cond_1

    .line 103
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x7

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v16

    .line 107
    :cond_1
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 108
    if-nez v13, :cond_2

    .line 109
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "Expected WEBVTT. Got null"

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 113
    .end local v14    # "matcher":Ljava/util/regex/Matcher;
    :cond_2
    const-string v24, "WEBVTT"

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    const-string v24, "\ufeffWEBVTT"

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_4

    .line 114
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Expected WEBVTT. Got "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 139
    .restart local v14    # "matcher":Ljava/util/regex/Matcher;
    .local v22, "timestampMatcher":Ljava/util/regex/Matcher;
    :cond_3
    invoke-virtual/range {v22 .. v22}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x7

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v24

    const-wide/16 v26, 0x3e8

    mul-long v24, v24, v26

    const-wide/16 v26, 0x5a

    div-long v24, v24, v26

    sub-long v18, v24, v16

    .line 142
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->getAdjustedStartTime(J)J

    move-result-wide v18

    .line 119
    .end local v14    # "matcher":Ljava/util/regex/Matcher;
    .end local v22    # "timestampMatcher":Ljava/util/regex/Matcher;
    :cond_4
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 120
    if-nez v13, :cond_5

    .line 122
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    const-string v25, "Expected an empty line after webvtt header"

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 123
    :cond_5
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v24

    if-eqz v24, :cond_7

    .line 147
    :goto_0
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_c

    .line 149
    sget-object v24, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_CUE_IDENTIFIER:Ljava/util/regex/Pattern;

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 150
    .restart local v14    # "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-eqz v24, :cond_6

    .line 152
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    .line 156
    :cond_6
    sget-object v24, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_TIMESTAMP:Ljava/util/regex/Pattern;

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 159
    const-string v10, ""

    .line 162
    .local v10, "text":Ljava/lang/String;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-nez v24, :cond_9

    .line 163
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Expected cue start time: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 128
    .end local v10    # "text":Ljava/lang/String;
    .end local v14    # "matcher":Ljava/util/regex/Matcher;
    :cond_7
    sget-object v24, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->WEBVTT_METADATA_HEADER:Ljava/util/regex/Pattern;

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v14

    .line 129
    .restart local v14    # "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-nez v24, :cond_8

    .line 130
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->handleNoncompliantLine(Ljava/lang/String;)V

    .line 133
    :cond_8
    const-string v24, "X-TIMESTAMP-MAP"

    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 135
    sget-object v24, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->MEDIA_TIMESTAMP:Ljava/util/regex/Pattern;

    move-object/from16 v0, v24

    invoke-virtual {v0, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v22

    .line 136
    .restart local v22    # "timestampMatcher":Ljava/util/regex/Matcher;
    invoke-virtual/range {v22 .. v22}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-nez v24, :cond_3

    .line 137
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "X-TIMESTAMP-MAP doesn\'t contain media timestamp: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 165
    .end local v22    # "timestampMatcher":Ljava/util/regex/Matcher;
    .restart local v10    # "text":Ljava/lang/String;
    :cond_9
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->parseTimestampUs(Ljava/lang/String;)J

    move-result-wide v24

    add-long v6, v24, v18

    .line 169
    .local v6, "startTime":J
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->find()Z

    move-result v24

    if-nez v24, :cond_a

    .line 170
    new-instance v24, Lcom/google/android/exoplayer/ParserException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Expected cue end time: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 172
    :cond_a
    invoke-virtual {v14}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->parseTimestampUs(Ljava/lang/String;)J

    move-result-wide v24

    add-long v8, v24, v18

    .line 176
    .local v8, "endTime":J
    :goto_1
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_b

    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v24

    if-nez v24, :cond_b

    .line 177
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->processCueText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "\n"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    .line 180
    :cond_b
    new-instance v5, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;

    invoke-direct/range {v5 .. v10}, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;-><init>(JJLjava/lang/String;)V

    .line 181
    .local v5, "cue":Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
    move-object/from16 v0, v21

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 184
    .end local v5    # "cue":Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
    .end local v6    # "startTime":J
    .end local v8    # "endTime":J
    .end local v10    # "text":Ljava/lang/String;
    .end local v14    # "matcher":Ljava/util/regex/Matcher;
    :cond_c
    invoke-virtual/range {v23 .. v23}, Ljava/io/BufferedReader;->close()V

    .line 185
    invoke-virtual/range {p1 .. p1}, Ljava/io/InputStream;->close()V

    .line 188
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v24

    move/from16 v0, v24

    new-array v11, v0, [Ljava/lang/String;

    .line 189
    .local v11, "cueText":[Ljava/lang/String;
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v24

    mul-int/lit8 v24, v24, 0x2

    move/from16 v0, v24

    new-array v12, v0, [J

    .line 190
    .local v12, "cueTimesUs":[J
    const/16 v20, 0x0

    .local v20, "subtitleIndex":I
    :goto_2
    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v24

    move/from16 v0, v20

    move/from16 v1, v24

    if-ge v0, v1, :cond_d

    .line 191
    mul-int/lit8 v4, v20, 0x2

    .line 192
    .local v4, "arrayIndex":I
    move-object/from16 v0, v21

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;

    .line 193
    .restart local v5    # "cue":Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
    iget-wide v0, v5, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->startTime:J

    move-wide/from16 v24, v0

    aput-wide v24, v12, v4

    .line 194
    add-int/lit8 v24, v4, 0x1

    iget-wide v0, v5, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->endTime:J

    move-wide/from16 v26, v0

    aput-wide v26, v12, v24

    .line 195
    iget-object v0, v5, Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;->text:Ljava/lang/String;

    move-object/from16 v24, v0

    aput-object v24, v11, v20

    .line 190
    add-int/lit8 v20, v20, 0x1

    goto :goto_2

    .line 198
    .end local v4    # "arrayIndex":I
    .end local v5    # "cue":Lcom/google/android/exoplayer/text/webvtt/WebvttParser$WebvttCue;
    :cond_d
    new-instance v15, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;

    move-wide/from16 v0, v18

    invoke-direct {v15, v11, v0, v1, v12}, Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;-><init>([Ljava/lang/String;J[J)V

    .line 199
    .local v15, "subtitle":Lcom/google/android/exoplayer/text/webvtt/WebvttSubtitle;
    return-object v15
.end method

.method protected processCueText(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 212
    iget-boolean v1, p0, Lcom/google/android/exoplayer/text/webvtt/WebvttParser;->filterTags:Z

    if-eqz v1, :cond_0

    .line 213
    const-string v1, "\\<.*?>"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 214
    const-string v1, "&lt;"

    const-string v2, "<"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 215
    const-string v1, "&gt;"

    const-string v2, ">"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 216
    const-string v1, "&nbsp;"

    const-string v2, " "

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 217
    const-string v1, "&amp;"

    const-string v2, "&"

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    move-object v0, p1

    .line 220
    .end local p1    # "line":Ljava/lang/String;
    .local v0, "line":Ljava/lang/String;
    :goto_0
    return-object v0

    .end local v0    # "line":Ljava/lang/String;
    .restart local p1    # "line":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    .end local p1    # "line":Ljava/lang/String;
    .restart local v0    # "line":Ljava/lang/String;
    goto :goto_0
.end method
