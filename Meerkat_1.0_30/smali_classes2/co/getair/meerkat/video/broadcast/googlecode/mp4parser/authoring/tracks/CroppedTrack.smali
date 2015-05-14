.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "CroppedTrack.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private fromSample:I

.field origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

.field private toSample:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;JJ)V
    .locals 4
    .param p1, "origTrack"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "fromSample"    # J
    .param p4, "toSample"    # J

    .prologue
    const-wide/32 v2, 0x7fffffff

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "crop("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 58
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 59
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    cmp-long v0, p2, v2

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 60
    :cond_0
    sget-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->$assertionsDisabled:Z

    if-nez v0, :cond_1

    cmp-long v0, p4, v2

    if-lez v0, :cond_1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 61
    :cond_1
    long-to-int v0, p2

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    .line 62
    long-to-int v0, p4

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    .line 63
    return-void
.end method

.method static getCompositionTimeEntries(Ljava/util/List;JJ)Ljava/util/List;
    .locals 9
    .param p1, "fromSample"    # J
    .param p3, "toSample"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;JJ)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    .local p0, "origSamples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 123
    const-wide/16 v0, 0x0

    .line 124
    .local v0, "current":J
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 125
    .local v3, "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v4, "nuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    .local v2, "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v6, v0

    cmp-long v5, v6, p1

    if-gtz v5, :cond_0

    .line 130
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v0, v6

    goto :goto_0

    .line 133
    :cond_0
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v6, v0

    cmp-long v5, v6, p3

    if-ltz v5, :cond_1

    .line 134
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    sub-long v6, p3, p1

    long-to-int v6, v6

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .end local v0    # "current":J
    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    .end local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    .end local v4    # "nuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    :goto_1
    return-object v4

    .line 137
    .restart local v0    # "current":J
    .restart local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    .restart local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    .restart local v4    # "nuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    :cond_1
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v6

    int-to-long v6, v6

    add-long/2addr v6, v0

    sub-long/2addr v6, p1

    long-to-int v6, v6

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v0, v6

    .line 141
    :goto_2
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    .restart local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v6, v0

    cmp-long v5, v6, p3

    if-gez v5, :cond_2

    .line 142
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getCount()I

    move-result v5

    int-to-long v6, v5

    add-long/2addr v0, v6

    goto :goto_2

    .line 146
    :cond_2
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;

    sub-long v6, p3, v0

    long-to-int v6, v6

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;->getOffset()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;-><init>(II)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 150
    .end local v0    # "current":J
    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;
    .end local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    .end local v4    # "nuList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;>;"
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method static getDecodingTimeEntries(Ljava/util/List;JJ)Ljava/util/List;
    .locals 11
    .param p1, "fromSample"    # J
    .param p3, "toSample"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;JJ)",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 85
    .local p0, "origSamples":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    .line 86
    const-wide/16 v0, 0x0

    .line 87
    .local v0, "current":J
    invoke-interface {p0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 88
    .local v3, "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 92
    .local v4, "nuList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .local v2, "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v6, v0

    cmp-long v5, v6, p1

    if-gtz v5, :cond_0

    .line 93
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v0, v6

    goto :goto_0

    .line 96
    :cond_0
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v6, v0

    cmp-long v5, v6, p3

    if-ltz v5, :cond_1

    .line 97
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    sub-long v6, p3, p1

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v8

    invoke-direct {v5, v6, v7, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 113
    .end local v0    # "current":J
    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    .end local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    .end local v4    # "nuList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    :goto_1
    return-object v4

    .line 100
    .restart local v0    # "current":J
    .restart local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    .restart local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    .restart local v4    # "nuList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    :cond_1
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v6, v0

    sub-long/2addr v6, p1

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v8

    invoke-direct {v5, v6, v7, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 102
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v0, v6

    .line 104
    :goto_2
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    check-cast v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    .restart local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v6, v0

    cmp-long v5, v6, p3

    if-gez v5, :cond_2

    .line 105
    invoke-virtual {v4, v2}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 106
    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getCount()J

    move-result-wide v6

    add-long/2addr v0, v6

    goto :goto_2

    .line 109
    :cond_2
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;

    sub-long v6, p3, v0

    invoke-virtual {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;->getDelta()J

    move-result-wide v8

    invoke-direct {v5, v6, v7, v8, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;-><init>(JJ)V

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 113
    .end local v0    # "current":J
    .end local v2    # "currentEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;
    .end local v3    # "e":Ljava/util/ListIterator;, "Ljava/util/ListIterator<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    .end local v4    # "nuList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/TimeToSampleBox$Entry;>;"
    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->close()V

    .line 67
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/CompositionTimeToSample$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    int-to-long v2, v1

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    int-to-long v4, v1

    invoke-static {v0, v2, v3, v4, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->getCompositionTimeEntries(Ljava/util/List;JJ)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDependencyTypeBox$Entry;",
            ">;"
        }
    .end annotation

    .prologue
    .line 174
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 175
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    .line 177
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSampleDurations()[J
    .locals 5

    .prologue
    .line 79
    monitor-enter p0

    :try_start_0
    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    sub-int/2addr v1, v2

    new-array v0, v1, [J

    .line 80
    .local v0, "decodingTimes":[J
    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v1

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    const/4 v3, 0x0

    array-length v4, v0

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    monitor-exit p0

    return-object v0

    .line 79
    .end local v0    # "decodingTimes":[J
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getSamples()Ljava/util/List;
    .locals 3
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
    .line 71
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v0

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    iget v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSyncSamples()[J
    .locals 10

    .prologue
    .line 155
    monitor-enter p0

    :try_start_0
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v5

    if-eqz v5, :cond_2

    .line 156
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v3

    .line 157
    .local v3, "origSyncSamples":[J
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, v3

    .line 158
    .local v1, "j":I
    :goto_0
    array-length v5, v3

    if-ge v0, v5, :cond_0

    aget-wide v6, v3, v0

    iget v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    int-to-long v8, v5

    cmp-long v5, v6, v8

    if-gez v5, :cond_0

    .line 159
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 161
    :cond_0
    :goto_1
    if-lez v1, :cond_1

    iget v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->toSample:I

    int-to-long v6, v5

    add-int/lit8 v5, v1, -0x1

    aget-wide v8, v3, v5

    cmp-long v5, v6, v8

    if-gez v5, :cond_1

    .line 162
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    .line 164
    :cond_1
    iget-object v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v5

    invoke-static {v5, v0, v1}, Ljava/util/Arrays;->copyOfRange([JII)[J

    move-result-object v4

    .line 165
    .local v4, "syncSampleArray":[J
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_2
    array-length v5, v4

    if-ge v2, v5, :cond_3

    .line 166
    aget-wide v6, v4, v2

    iget v5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->fromSample:I

    int-to-long v8, v5

    sub-long/2addr v6, v8

    aput-wide v6, v4, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 170
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v2    # "k":I
    .end local v3    # "origSyncSamples":[J
    .end local v4    # "syncSampleArray":[J
    :cond_2
    const/4 v4, 0x0

    :cond_3
    monitor-exit p0

    return-object v4

    .line 155
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CroppedTrack;->origTrack:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v0

    return-object v0
.end method
