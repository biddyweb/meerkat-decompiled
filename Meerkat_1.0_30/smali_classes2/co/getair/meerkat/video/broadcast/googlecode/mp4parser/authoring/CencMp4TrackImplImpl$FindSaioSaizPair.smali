.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;
.super Ljava/lang/Object;
.source "CencMp4TrackImplImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FindSaioSaizPair"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private container:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

.field private saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

.field private saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 212
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;)V
    .locals 0
    .param p2, "container"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .prologue
    .line 217
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->container:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    .line 219
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;)Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;

    .prologue
    .line 212
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;)Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;

    .prologue
    .line 212
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    return-object v0
.end method


# virtual methods
.method public getSaio()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    return-object v0
.end method

.method public getSaiz()Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    return-object v0
.end method

.method public invoke()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 230
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->container:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    const-class v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-interface {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v2

    .line 231
    .local v2, "saizs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;>;"
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->container:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;

    const-class v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-interface {v3, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Container;->getBoxes(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v1

    .line 232
    .local v1, "saios":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;>;"
    sget-boolean v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-eq v3, v4, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 233
    :cond_0
    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    .line 234
    iput-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    .line 236
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_9

    .line 237
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    if-nez v3, :cond_1

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    :cond_1
    const-string v4, "cenc"

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 238
    :cond_2
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    .line 244
    :goto_1
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    if-nez v3, :cond_3

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4

    :cond_3
    const-string v4, "cenc"

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 245
    :cond_4
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    .line 236
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 239
    :cond_5
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6

    const-string v4, "cenc"

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 240
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saiz:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationSizesBox;

    goto :goto_1

    .line 242
    :cond_6
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Are there two cenc labeled saiz?"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 246
    :cond_7
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    if-eqz v3, :cond_8

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_8

    const-string v4, "cenc"

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    invoke-virtual {v3}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;->getAuxInfoType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 247
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    iput-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/CencMp4TrackImplImpl$FindSaioSaizPair;->saio:Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part12/SampleAuxiliaryInformationOffsetsBox;

    goto :goto_2

    .line 249
    :cond_8
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "Are there two cenc labeled saio?"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 252
    :cond_9
    return-object p0
.end method
