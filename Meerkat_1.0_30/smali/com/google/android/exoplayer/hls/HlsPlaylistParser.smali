.class public final Lcom/google/android/exoplayer/hls/HlsPlaylistParser;
.super Ljava/lang/Object;
.source "HlsPlaylistParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/util/ManifestParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer/util/ManifestParser",
        "<",
        "Lcom/google/android/exoplayer/hls/HlsPlaylist;",
        ">;"
    }
.end annotation


# static fields
.field private static final BANDWIDTH_ATTR:Ljava/lang/String; = "BANDWIDTH"

.field private static final BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final BYTERANGE_REGEX:Ljava/util/regex/Pattern;

.field private static final BYTERANGE_TAG:Ljava/lang/String; = "#EXT-X-BYTERANGE"

.field private static final CODECS_ATTR:Ljava/lang/String; = "CODECS"

.field private static final CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final DISCONTINUITY_TAG:Ljava/lang/String; = "#EXT-X-DISCONTINUITY"

.field private static final ENDLIST_TAG:Ljava/lang/String; = "#EXT-X-ENDLIST"

.field private static final IV_ATTR:Ljava/lang/String; = "IV"

.field private static final IV_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final KEY_TAG:Ljava/lang/String; = "#EXT-X-KEY"

.field private static final MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

.field private static final MEDIA_DURATION_TAG:Ljava/lang/String; = "#EXTINF"

.field private static final MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

.field private static final MEDIA_SEQUENCE_TAG:Ljava/lang/String; = "#EXT-X-MEDIA-SEQUENCE"

.field private static final METHOD_ATTR:Ljava/lang/String; = "METHOD"

.field private static final METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final RESOLUTION_ATTR:Ljava/lang/String; = "RESOLUTION"

.field private static final RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final STREAM_INF_TAG:Ljava/lang/String; = "#EXT-X-STREAM-INF"

.field private static final TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

.field private static final TARGET_DURATION_TAG:Ljava/lang/String; = "#EXT-X-TARGETDURATION"

.field private static final URI_ATTR:Ljava/lang/String; = "URI"

.field private static final URI_ATTR_REGEX:Ljava/util/regex/Pattern;

.field private static final VERSION_REGEX:Ljava/util/regex/Pattern;

.field private static final VERSION_TAG:Ljava/lang/String; = "#EXT-X-VERSION"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    const-string v0, "BANDWIDTH=(\\d+)\\b"

    .line 61
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 62
    const-string v0, "CODECS=\"(.+?)\""

    .line 63
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 64
    const-string v0, "RESOLUTION=(\\d+x\\d+)"

    .line 65
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 67
    const-string v0, "#EXTINF:([\\d.]+)"

    .line 68
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 69
    const-string v0, "#EXT-X-MEDIA-SEQUENCE:(\\d+)\\b"

    .line 70
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    .line 71
    const-string v0, "#EXT-X-TARGETDURATION:(\\d+)\\b"

    .line 72
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    .line 73
    const-string v0, "#EXT-X-VERSION:(\\d+)\\b"

    .line 74
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    .line 75
    const-string v0, "#EXT-X-BYTERANGE:(\\d+(?:@\\d+)?)\\b"

    .line 76
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    .line 78
    const-string v0, "METHOD=([^,.*]+)"

    .line 79
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 80
    const-string v0, "URI=\"(.+)\""

    .line 81
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 82
    const-string v0, "IV=([^,.*]+)"

    .line 83
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    .line 82
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 242
    return-void
.end method

.method private static parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    .locals 13
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 123
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .local v10, "variants":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/Variant;>;"
    const/4 v3, 0x0

    .line 125
    .local v3, "bandwidth":I
    const/4 v4, 0x0

    .line 126
    .local v4, "codecs":[Ljava/lang/String;
    const/4 v5, -0x1

    .line 127
    .local v5, "width":I
    const/4 v6, -0x1

    .line 128
    .local v6, "height":I
    const/4 v1, 0x0

    .line 131
    .local v1, "variantIndex":I
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 132
    invoke-virtual {p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v2

    .line 133
    .local v2, "line":Ljava/lang/String;
    const-string v0, "#EXT-X-STREAM-INF"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 134
    sget-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BANDWIDTH_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v12, "BANDWIDTH"

    invoke-static {v2, v0, v12}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v3

    .line 135
    sget-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->CODECS_ATTR_REGEX:Ljava/util/regex/Pattern;

    invoke-static {v2, v0}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v7

    .line 136
    .local v7, "codecsString":Ljava/lang/String;
    if-eqz v7, :cond_1

    .line 137
    const-string v0, "(\\s*,\\s*)|(\\s*$)"

    invoke-virtual {v7, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 141
    :goto_1
    sget-object v0, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->RESOLUTION_ATTR_REGEX:Ljava/util/regex/Pattern;

    invoke-static {v2, v0}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v8

    .line 143
    .local v8, "resolutionString":Ljava/lang/String;
    if-eqz v8, :cond_2

    .line 144
    const-string v0, "x"

    invoke-virtual {v8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 145
    .local v11, "widthAndHeight":[Ljava/lang/String;
    const/4 v0, 0x0

    aget-object v0, v11, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 146
    const/4 v0, 0x1

    aget-object v0, v11, v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 147
    goto :goto_0

    .line 139
    .end local v8    # "resolutionString":Ljava/lang/String;
    .end local v11    # "widthAndHeight":[Ljava/lang/String;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    .line 148
    .restart local v8    # "resolutionString":Ljava/lang/String;
    :cond_2
    const/4 v5, -0x1

    .line 149
    const/4 v6, -0x1

    goto :goto_0

    .line 151
    .end local v7    # "codecsString":Ljava/lang/String;
    .end local v8    # "resolutionString":Ljava/lang/String;
    :cond_3
    const-string v0, "#"

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 152
    new-instance v0, Lcom/google/android/exoplayer/hls/Variant;

    add-int/lit8 v9, v1, 0x1

    .end local v1    # "variantIndex":I
    .local v9, "variantIndex":I
    invoke-direct/range {v0 .. v6}, Lcom/google/android/exoplayer/hls/Variant;-><init>(ILjava/lang/String;I[Ljava/lang/String;II)V

    invoke-interface {v10, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    const/4 v3, 0x0

    .line 154
    const/4 v4, 0x0

    .line 155
    const/4 v5, -0x1

    .line 156
    const/4 v6, -0x1

    move v1, v9

    .end local v9    # "variantIndex":I
    .restart local v1    # "variantIndex":I
    goto :goto_0

    .line 159
    .end local v2    # "line":Ljava/lang/String;
    :cond_4
    new-instance v0, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;

    invoke-static {v10}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v12

    invoke-direct {v0, p1, v12}, Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;-><init>(Landroid/net/Uri;Ljava/util/List;)V

    return-object v0
.end method

.method private static parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    .locals 25
    .param p0, "iterator"    # Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;
    .param p1, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    const/16 v16, 0x0

    .line 165
    .local v16, "mediaSequence":I
    const/16 v17, 0x0

    .line 166
    .local v17, "targetDurationSecs":I
    const/16 v18, 0x1

    .line 167
    .local v18, "version":I
    const/16 v19, 0x1

    .line 168
    .local v19, "live":Z
    new-instance v23, Ljava/util/ArrayList;

    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .local v23, "segments":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;>;"
    const-wide/16 v4, 0x0

    .line 171
    .local v4, "segmentDurationSecs":D
    const/4 v6, 0x0

    .line 172
    .local v6, "segmentDiscontinuity":Z
    const-wide/16 v7, 0x0

    .line 173
    .local v7, "segmentStartTimeUs":J
    const/4 v9, 0x0

    .line 174
    .local v9, "segmentEncryptionMethod":Ljava/lang/String;
    const/4 v10, 0x0

    .line 175
    .local v10, "segmentEncryptionKeyUri":Ljava/lang/String;
    const/4 v11, 0x0

    .line 176
    .local v11, "segmentEncryptionIV":Ljava/lang/String;
    const/4 v12, 0x0

    .line 177
    .local v12, "segmentByterangeOffset":I
    const/4 v13, -0x1

    .line 179
    .local v13, "segmentByterangeLength":I
    const/16 v22, 0x0

    .line 182
    .local v22, "segmentMediaSequence":I
    :cond_0
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 183
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;->next()Ljava/lang/String;

    move-result-object v3

    .line 184
    .local v3, "line":Ljava/lang/String;
    const-string v2, "#EXT-X-TARGETDURATION"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 185
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->TARGET_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "#EXT-X-TARGETDURATION"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v17

    goto :goto_0

    .line 187
    :cond_1
    const-string v2, "#EXT-X-MEDIA-SEQUENCE"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 188
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_SEQUENCE_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "#EXT-X-MEDIA-SEQUENCE"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v16

    .line 189
    move/from16 v22, v16

    goto :goto_0

    .line 190
    :cond_2
    const-string v2, "#EXT-X-VERSION"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 191
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->VERSION_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "#EXT-X-VERSION"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseIntAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)I

    move-result v18

    goto :goto_0

    .line 192
    :cond_3
    const-string v2, "#EXTINF"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 193
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->MEDIA_DURATION_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "#EXTINF"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseDoubleAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)D

    move-result-wide v4

    goto :goto_0

    .line 195
    :cond_4
    const-string v2, "#EXT-X-KEY"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 196
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->METHOD_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "METHOD"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 198
    const-string v2, "NONE"

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 199
    const/4 v10, 0x0

    .line 200
    const/4 v11, 0x0

    goto :goto_0

    .line 202
    :cond_5
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->URI_ATTR_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "URI"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 204
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->IV_ATTR_REGEX:Ljava/util/regex/Pattern;

    invoke-static {v3, v2}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseOptionalStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;)Ljava/lang/String;

    move-result-object v11

    .line 205
    if-nez v11, :cond_0

    .line 206
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v11

    goto :goto_0

    .line 209
    :cond_6
    const-string v2, "#EXT-X-BYTERANGE"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 210
    sget-object v2, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->BYTERANGE_REGEX:Ljava/util/regex/Pattern;

    const-string v14, "#EXT-X-BYTERANGE"

    invoke-static {v3, v2, v14}, Lcom/google/android/exoplayer/hls/HlsParserUtil;->parseStringAttr(Ljava/lang/String;Ljava/util/regex/Pattern;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 211
    .local v21, "byteRange":Ljava/lang/String;
    const-string v2, "@"

    move-object/from16 v0, v21

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v24

    .line 212
    .local v24, "splitByteRange":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v2, v24, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    .line 213
    move-object/from16 v0, v24

    array-length v2, v0

    const/4 v14, 0x1

    if-le v2, v14, :cond_0

    .line 214
    const/4 v2, 0x1

    aget-object v2, v24, v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    goto/16 :goto_0

    .line 216
    .end local v21    # "byteRange":Ljava/lang/String;
    .end local v24    # "splitByteRange":[Ljava/lang/String;
    :cond_7
    const-string v2, "#EXT-X-DISCONTINUITY"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 217
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 218
    :cond_8
    const-string v2, "#"

    invoke-virtual {v3, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 219
    add-int/lit8 v22, v22, 0x1

    .line 220
    const/4 v2, -0x1

    if-ne v13, v2, :cond_9

    .line 221
    const/4 v12, 0x0

    .line 223
    :cond_9
    new-instance v2, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;

    invoke-direct/range {v2 .. v13}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist$Segment;-><init>(Ljava/lang/String;DZJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    move-object/from16 v0, v23

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 226
    const-wide v14, 0x412e848000000000L    # 1000000.0

    mul-double/2addr v14, v4

    double-to-long v14, v14

    add-long/2addr v7, v14

    .line 227
    const/4 v6, 0x0

    .line 228
    const-wide/16 v4, 0x0

    .line 229
    const/4 v2, -0x1

    if-eq v13, v2, :cond_a

    .line 230
    add-int/2addr v12, v13

    .line 232
    :cond_a
    const/4 v13, -0x1

    goto/16 :goto_0

    .line 233
    :cond_b
    const-string v2, "#EXT-X-ENDLIST"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 234
    const/16 v19, 0x0

    .line 238
    .end local v3    # "line":Ljava/lang/String;
    :cond_c
    new-instance v14, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;

    .line 239
    invoke-static/range {v23 .. v23}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v20

    move-object/from16 v15, p1

    invoke-direct/range {v14 .. v20}, Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;-><init>(Landroid/net/Uri;IIIZLjava/util/List;)V

    return-object v14
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsPlaylist;
    .locals 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .param p3, "contentId"    # Ljava/lang/String;
    .param p4, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    new-instance v2, Ljava/io/BufferedReader;

    if-nez p2, :cond_1

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    :goto_0
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 90
    .local v2, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 93
    .local v0, "extraLines":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/String;>;"
    :cond_0
    :goto_1
    :try_start_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    .local v1, "line":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 94
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 95
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_0

    .line 97
    const-string v3, "#EXT-X-STREAM-INF"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 98
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 99
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p4}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMasterPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsMasterPlaylist;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 116
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    :goto_2
    return-object v3

    .line 88
    .end local v0    # "extraLines":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/String;>;"
    .end local v1    # "line":Ljava/lang/String;
    .end local v2    # "reader":Ljava/io/BufferedReader;
    :cond_1
    new-instance v3, Ljava/io/InputStreamReader;

    invoke-direct {v3, p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    goto :goto_0

    .line 100
    .restart local v0    # "extraLines":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/String;>;"
    .restart local v1    # "line":Ljava/lang/String;
    .restart local v2    # "reader":Ljava/io/BufferedReader;
    :cond_2
    :try_start_1
    const-string v3, "#EXT-X-TARGETDURATION"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXT-X-MEDIA-SEQUENCE"

    .line 101
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXTINF"

    .line 102
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXT-X-KEY"

    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXT-X-BYTERANGE"

    .line 104
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXT-X-DISCONTINUITY"

    .line 105
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "#EXT-X-ENDLIST"

    .line 106
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 107
    :cond_3
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 108
    new-instance v3, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;

    invoke-direct {v3, v0, v2}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;-><init>(Ljava/util/Queue;Ljava/io/BufferedReader;)V

    invoke-static {v3, p4}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parseMediaPlaylist(Lcom/google/android/exoplayer/hls/HlsPlaylistParser$LineIterator;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsMediaPlaylist;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v3

    .line 116
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    goto :goto_2

    .line 109
    :cond_4
    :try_start_2
    const-string v3, "#EXT-X-VERSION"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 110
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_1

    .line 116
    .end local v1    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v3

    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    throw v3

    .line 111
    .restart local v1    # "line":Ljava/lang/String;
    :cond_5
    :try_start_3
    const-string v3, "#"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 112
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    const-string v4, "Missing a tag before URL."

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 116
    :cond_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V

    .line 118
    new-instance v3, Lcom/google/android/exoplayer/ParserException;

    const-string v4, "Failed to parse the playlist, could not identify any tags."

    invoke-direct {v3, v4}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/String;)V

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
    .line 39
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/hls/HlsPlaylistParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/hls/HlsPlaylist;

    move-result-object v0

    return-object v0
.end method
