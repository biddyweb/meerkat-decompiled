.class public Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser;
.super Ljava/lang/Object;
.source "SmoothStreamingManifestParser.java"

# interfaces
.implements Lcom/google/android/exoplayer/util/ManifestParser;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$TrackElementParser;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$StreamElementParser;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ProtectionElementParser;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;,
        Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$MissingFieldException;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/exoplayer/util/ManifestParser",
        "<",
        "Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;",
        ">;"
    }
.end annotation


# instance fields
.field private final xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    :try_start_0
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v1

    iput-object v1, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    return-void

    .line 55
    :catch_0
    move-exception v0

    .line 56
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Couldn\'t create XmlPullParserFactory instance"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
    .locals 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .param p3, "contentId"    # Ljava/lang/String;
    .param p4, "baseUri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 64
    :try_start_0
    iget-object v3, p0, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser;->xmlParserFactory:Lorg/xmlpull/v1/XmlPullParserFactory;

    invoke-virtual {v3}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v2

    .line 65
    .local v2, "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    invoke-interface {v2, p1, p2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 66
    new-instance v1, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;

    const/4 v3, 0x0

    invoke-direct {v1, v3, p4}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;-><init>(Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$ElementParser;Landroid/net/Uri;)V

    .line 67
    .local v1, "smoothStreamMediaParser":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 68
    .end local v1    # "smoothStreamMediaParser":Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser$SmoothStreamMediaParser;
    .end local v2    # "xmlParser":Lorg/xmlpull/v1/XmlPullParser;
    :catch_0
    move-exception v0

    .line 69
    .local v0, "e":Lorg/xmlpull/v1/XmlPullParserException;
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
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifestParser;->parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;)Lcom/google/android/exoplayer/smoothstreaming/SmoothStreamingManifest;

    move-result-object v0

    return-object v0
.end method
