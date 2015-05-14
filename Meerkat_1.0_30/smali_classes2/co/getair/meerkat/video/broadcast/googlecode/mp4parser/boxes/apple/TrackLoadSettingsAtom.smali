.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;
.source "TrackLoadSettingsAtom.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "load"


# instance fields
.field defaultHints:I

.field preloadDuration:I

.field preloadFlags:I

.field preloadStartTime:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    const-string v0, "load"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/AbstractBox;-><init>(Ljava/lang/String;)V

    .line 25
    return-void
.end method


# virtual methods
.method protected _parseDetails(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "content"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadStartTime:I

    .line 44
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadDuration:I

    .line 45
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadFlags:I

    .line 46
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->defaultHints:I

    .line 47
    return-void
.end method

.method protected getContent(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 34
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadStartTime:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 35
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadDuration:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 36
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadFlags:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 37
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->defaultHints:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 39
    return-void
.end method

.method protected getContentSize()J
    .locals 2

    .prologue
    .line 29
    const-wide/16 v0, 0x10

    return-wide v0
.end method

.method public getDefaultHints()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->defaultHints:I

    return v0
.end method

.method public getPreloadDuration()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadDuration:I

    return v0
.end method

.method public getPreloadFlags()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadFlags:I

    return v0
.end method

.method public getPreloadStartTime()I
    .locals 1

    .prologue
    .line 50
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadStartTime:I

    return v0
.end method

.method public setDefaultHints(I)V
    .locals 0
    .param p1, "defaultHints"    # I

    .prologue
    .line 78
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->defaultHints:I

    .line 79
    return-void
.end method

.method public setPreloadDuration(I)V
    .locals 0
    .param p1, "preloadDuration"    # I

    .prologue
    .line 62
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadDuration:I

    .line 63
    return-void
.end method

.method public setPreloadFlags(I)V
    .locals 0
    .param p1, "preloadFlags"    # I

    .prologue
    .line 70
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadFlags:I

    .line 71
    return-void
.end method

.method public setPreloadStartTime(I)V
    .locals 0
    .param p1, "preloadStartTime"    # I

    .prologue
    .line 54
    iput p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/apple/TrackLoadSettingsAtom;->preloadStartTime:I

    .line 55
    return-void
.end method
