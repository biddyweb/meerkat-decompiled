.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;
.source "AppleRecordingYearBox.java"


# instance fields
.field date:Ljava/util/Date;

.field df:Ljava/text/DateFormat;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 22
    const-string v0, "\u00a9day"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleDataBox;-><init>(Ljava/lang/String;I)V

    .line 19
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;

    .line 23
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'kk:mm:ssZ"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->df:Ljava/text/DateFormat;

    .line 24
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->df:Ljava/text/DateFormat;

    const-string v1, "UTC"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 25
    return-void
.end method

.method protected static iso8601toRfc822Date(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "iso8601"    # Ljava/lang/String;

    .prologue
    .line 52
    const-string v0, "Z$"

    const-string v1, "+0000"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 53
    const-string v0, "([0-9][0-9]):([0-9][0-9])$"

    const-string v1, "$1$2"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 54
    return-object p0
.end method

.method protected static rfc822toIso8601Date(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "rfc622"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string v0, "\\+0000$"

    const-string v1, "Z"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 58
    return-object p0
.end method


# virtual methods
.method protected getDataLength()I
    .locals 2

    .prologue
    .line 63
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->df:Ljava/text/DateFormat;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->rfc822toIso8601Date(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;

    return-object v0
.end method

.method protected parseData(Ljava/nio/ByteBuffer;)V
    .locals 4
    .param p1, "data"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-static {p1, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReader;->readString(Ljava/nio/ByteBuffer;I)Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "dateString":Ljava/lang/String;
    :try_start_0
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->df:Ljava/text/DateFormat;

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->iso8601toRfc822Date(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    iput-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    return-void

    .line 46
    :catch_0
    move-exception v1

    .line 47
    .local v1, "e":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setDate(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 32
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;

    .line 33
    return-void
.end method

.method protected writeData()[B
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->df:Ljava/text/DateFormat;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->date:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/AppleRecordingYearBox;->rfc822toIso8601Date(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Utf8;->convert(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method
