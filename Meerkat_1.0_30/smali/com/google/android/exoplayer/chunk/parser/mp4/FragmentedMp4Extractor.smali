.class public final Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;
.super Ljava/lang/Object;
.source "FragmentedMp4Extractor.java"

# interfaces
.implements Lcom/google/android/exoplayer/chunk/parser/Extractor;


# static fields
.field private static final CONTAINER_TYPES:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final PARSED_ATOMS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

.field private static final READ_TERMINATING_RESULTS:I = 0x27

.field private static final STATE_READING_ATOM_HEADER:I = 0x0

.field private static final STATE_READING_ATOM_PAYLOAD:I = 0x1

.field private static final STATE_READING_ENCRYPTION_DATA:I = 0x2

.field private static final STATE_READING_SAMPLE:I = 0x3

.field public static final WORKAROUND_EVERY_VIDEO_FRAME_IS_SYNC_FRAME:I = 0x1


# instance fields
.field private atomBytesRead:I

.field private atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private final atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

.field private atomSize:I

.field private atomType:I

.field private final containerAtoms:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;",
            ">;"
        }
    .end annotation
.end field

.field private final extendedTypeScratch:[B

.field private extendsDefaults:Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

.field private final fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

.field private lastSyncSampleIndex:I

.field private parserState:I

.field private pendingSeekSyncSampleIndex:I

.field private pendingSeekTimeMs:I

.field private final psshData:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation
.end field

.field private rootAtomBytesRead:I

.field private sampleIndex:I

.field private segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

.field private track:Lcom/google/android/exoplayer/mp4/Track;

.field private final workaroundFlags:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 67
    const/16 v2, 0x10

    new-array v2, v2, [B

    fill-array-data v2, :array_0

    sput-object v2, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    .line 79
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 80
    .local v1, "parsedAtoms":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 81
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc3:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 82
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_esds:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 83
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_hdlr:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 84
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdat:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 85
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdhd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 86
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moof:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 87
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moov:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 88
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4a:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 89
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvhd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 90
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sidx:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 91
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 92
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfdt:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 93
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfhd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 94
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tkhd:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 95
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_traf:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 96
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trak:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 97
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 98
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trun:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 99
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 100
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdia:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 101
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_minf:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 102
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stbl:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 103
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pssh:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 104
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_saiz:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 105
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_uuid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 106
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_senc:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 107
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pasp:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 108
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    sput-object v2, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->PARSED_ATOMS:Ljava/util/Set;

    .line 114
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 115
    .local v0, "atomContainerTypes":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Integer;>;"
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moov:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 116
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trak:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 117
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdia:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 118
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_minf:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 119
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stbl:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 120
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avcC:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 121
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moof:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 122
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_traf:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 123
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvex:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 124
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    sput-object v2, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->CONTAINER_TYPES:Ljava/util/Set;

    .line 125
    return-void

    .line 67
    nop

    :array_0
    .array-data 1
        -0x5et
        0x39t
        0x4ft
        0x52t
        0x5at
        -0x65t
        0x4ft
        0x14t
        -0x5et
        0x44t
        0x6ct
        0x42t
        0x7ct
        0x64t
        -0x73t
        -0xct
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 154
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;-><init>(I)V

    .line 155
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "workaroundFlags"    # I

    .prologue
    .line 161
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 162
    iput p1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->workaroundFlags:I

    .line 163
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parserState:I

    .line 164
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 165
    const/16 v0, 0x10

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    .line 166
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    .line 167
    new-instance v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    invoke-direct {v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .line 168
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->psshData:Ljava/util/HashMap;

    .line 169
    return-void
.end method

.method private enterState(I)V
    .locals 2
    .param p1, "state"    # I

    .prologue
    const/4 v1, 0x0

    .line 260
    packed-switch p1, :pswitch_data_0

    .line 268
    :cond_0
    :goto_0
    iput p1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parserState:I

    .line 269
    return-void

    .line 262
    :pswitch_0
    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    .line 263
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 264
    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    goto :goto_0

    .line 260
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method private onContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)I
    .locals 2
    .param p1, "container"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    .prologue
    .line 355
    iget v0, p1, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moov:I

    if-ne v0, v1, :cond_0

    .line 356
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->onMoovContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)V

    .line 357
    const/16 v0, 0x8

    .line 363
    :goto_0
    return v0

    .line 358
    :cond_0
    iget v0, p1, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moof:I

    if-ne v0, v1, :cond_2

    .line 359
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->onMoofContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)V

    .line 363
    :cond_1
    :goto_1
    const/4 v0, 0x0

    goto :goto_0

    .line 360
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 361
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)V

    goto :goto_1
.end method

.method private onLeafAtomRead(Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;)I
    .locals 2
    .param p1, "leaf"    # Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    .prologue
    .line 345
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 346
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->add(Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;)V

    .line 351
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 347
    :cond_1
    iget v0, p1, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->type:I

    sget v1, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sidx:I

    if-ne v0, v1, :cond_0

    .line 348
    iget-object v0, p1, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseSidx(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    .line 349
    const/16 v0, 0x10

    goto :goto_0
.end method

.method private onMoofContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)V
    .locals 8
    .param p1, "moof"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    .prologue
    const/4 v7, 0x0

    .line 388
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->reset()V

    .line 389
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->workaroundFlags:I

    iget-object v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->extendedTypeScratch:[B

    move-object v2, p1

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseMoof(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;I[B)V

    .line 390
    iput v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    .line 391
    iput v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->lastSyncSampleIndex:I

    .line 392
    iput v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekSyncSampleIndex:I

    .line 393
    iget v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    if-eqz v0, :cond_2

    .line 394
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-ge v6, v0, :cond_1

    .line 395
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    aget-boolean v0, v0, v6

    if-eqz v0, :cond_0

    .line 396
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    invoke-virtual {v0, v6}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v0

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 397
    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekSyncSampleIndex:I

    .line 394
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 401
    :cond_1
    iput v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    .line 403
    .end local v6    # "i":I
    :cond_2
    return-void
.end method

.method private onMoovContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)V
    .locals 14
    .param p1, "moov"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    .prologue
    .line 367
    iget-object v4, p1, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    .line 368
    .local v4, "moovChildren":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;>;"
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    .line 369
    .local v5, "moovChildrenSize":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v5, :cond_1

    .line 370
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    .line 371
    .local v0, "child":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    iget v9, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->type:I

    sget v10, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pssh:I

    if-ne v9, v10, :cond_0

    .line 372
    iget-object v7, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 373
    .local v7, "psshAtom":Lcom/google/android/exoplayer/util/ParsableByteArray;
    const/16 v9, 0xc

    invoke-virtual {v7, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 374
    new-instance v8, Ljava/util/UUID;

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v10

    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v12

    invoke-direct {v8, v10, v11, v12, v13}, Ljava/util/UUID;-><init>(JJ)V

    .line 375
    .local v8, "uuid":Ljava/util/UUID;
    invoke-virtual {v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 376
    .local v2, "dataSize":I
    new-array v1, v2, [B

    .line 377
    .local v1, "data":[B
    const/4 v9, 0x0

    invoke-virtual {v7, v1, v9, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 378
    iget-object v9, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->psshData:Ljava/util/HashMap;

    invoke-virtual {v9, v8, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 369
    .end local v1    # "data":[B
    .end local v2    # "dataSize":I
    .end local v7    # "psshAtom":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v8    # "uuid":Ljava/util/UUID;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 381
    .end local v0    # "child":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    :cond_1
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvex:I

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v6

    .line 382
    .local v6, "mvex":Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trex:I

    invoke-virtual {v6, v9}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v9

    iget-object v9, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v9}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    move-result-object v9

    iput-object v9, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    .line 383
    sget v9, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trak:I

    invoke-virtual {p1, v9}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v9

    sget v10, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvhd:I

    .line 384
    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v10

    .line 383
    invoke-static {v9, v10}, Lcom/google/android/exoplayer/mp4/CommonMp4AtomParsers;->parseTrak(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;)Lcom/google/android/exoplayer/mp4/Track;

    move-result-object v9

    iput-object v9, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    .line 385
    return-void
.end method

.method private static parseMoof(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;I[B)V
    .locals 6
    .param p0, "track"    # Lcom/google/android/exoplayer/mp4/Track;
    .param p1, "extendsDefaults"    # Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .param p2, "moof"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    .param p3, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;
    .param p4, "workaroundFlags"    # I
    .param p5, "extendedTypeScratch"    # [B

    .prologue
    .line 420
    sget v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_traf:I

    invoke-virtual {p2, v0}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getContainerAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseTraf(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;I[B)V

    .line 422
    return-void
.end method

.method private static parseSaiz(Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V
    .locals 13
    .param p0, "encryptionBox"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    .param p1, "saiz"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .prologue
    .line 462
    iget v9, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 463
    .local v9, "vectorSize":I
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 464
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 465
    .local v2, "fullAtom":I
    invoke-static {v2}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomFlags(I)I

    move-result v1

    .line 466
    .local v1, "flags":I
    and-int/lit8 v10, v1, 0x1

    const/4 v11, 0x1

    if-ne v10, v11, :cond_0

    .line 467
    const/16 v10, 0x8

    invoke-virtual {p1, v10}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 469
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v0

    .line 471
    .local v0, "defaultSampleInfoSize":I
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 472
    .local v4, "sampleCount":I
    iget v10, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-eq v4, v10, :cond_1

    .line 473
    new-instance v10, Ljava/lang/IllegalStateException;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Length mismatch: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 476
    :cond_1
    const/4 v8, 0x0

    .line 477
    .local v8, "totalSize":I
    if-nez v0, :cond_3

    .line 478
    iget-object v5, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    .line 479
    .local v5, "sampleHasSubsampleEncryptionTable":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_4

    .line 480
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedByte()I

    move-result v6

    .line 481
    .local v6, "sampleInfoSize":I
    add-int/2addr v8, v6

    .line 482
    if-le v6, v9, :cond_2

    const/4 v10, 0x1

    :goto_1
    aput-boolean v10, v5, v3

    .line 479
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 482
    :cond_2
    const/4 v10, 0x0

    goto :goto_1

    .line 485
    .end local v3    # "i":I
    .end local v5    # "sampleHasSubsampleEncryptionTable":[Z
    .end local v6    # "sampleInfoSize":I
    :cond_3
    if-le v0, v9, :cond_5

    const/4 v7, 0x1

    .line 486
    .local v7, "subsampleEncryption":Z
    :goto_2
    mul-int v10, v0, v4

    add-int/2addr v8, v10

    .line 487
    iget-object v10, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    const/4 v11, 0x0

    invoke-static {v10, v11, v4, v7}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 489
    .end local v7    # "subsampleEncryption":Z
    :cond_4
    invoke-virtual {p2, v8}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->initEncryptionData(I)V

    .line 490
    return-void

    .line 485
    :cond_5
    const/4 v7, 0x0

    goto :goto_2
.end method

.method private static parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V
    .locals 7
    .param p0, "senc"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "offset"    # I
    .param p2, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .prologue
    const/4 v4, 0x0

    .line 625
    add-int/lit8 v5, p1, 0x8

    invoke-virtual {p0, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 626
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 627
    .local v1, "fullAtom":I
    invoke-static {v1}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomFlags(I)I

    move-result v0

    .line 629
    .local v0, "flags":I
    and-int/lit8 v5, v0, 0x1

    if-eqz v5, :cond_0

    .line 631
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Overriding TrackEncryptionBox parameters is unsupported"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 634
    :cond_0
    and-int/lit8 v5, v0, 0x2

    if-eqz v5, :cond_1

    const/4 v3, 0x1

    .line 635
    .local v3, "subsampleEncryption":Z
    :goto_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    .line 636
    .local v2, "sampleCount":I
    iget v5, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-eq v2, v5, :cond_2

    .line 637
    new-instance v4, Ljava/lang/IllegalStateException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length mismatch: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .end local v2    # "sampleCount":I
    .end local v3    # "subsampleEncryption":Z
    :cond_1
    move v3, v4

    .line 634
    goto :goto_0

    .line 640
    .restart local v2    # "sampleCount":I
    .restart local v3    # "subsampleEncryption":Z
    :cond_2
    iget-object v5, p2, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    invoke-static {v5, v4, v2, v3}, Ljava/util/Arrays;->fill([ZIIZ)V

    .line 641
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v4

    invoke-virtual {p2, v4}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->initEncryptionData(I)V

    .line 642
    invoke-virtual {p2, p0}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;)V

    .line 643
    return-void
.end method

.method private static parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V
    .locals 1
    .param p0, "senc"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .prologue
    .line 621
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V

    .line 622
    return-void
.end method

.method private static parseSidx(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;
    .locals 30
    .param p0, "atom"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 649
    const/16 v4, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 650
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v17

    .line 651
    .local v17, "fullAtom":I
    invoke-static/range {v17 .. v17}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v29

    .line 653
    .local v29, "version":I
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 654
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v6

    .line 657
    .local v6, "timescale":J
    if-nez v29, :cond_0

    .line 658
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v14

    .line 659
    .local v14, "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v18

    .line 665
    .local v18, "firstOffset":J
    :goto_0
    const/4 v4, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 667
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v21

    .line 668
    .local v21, "referenceCount":I
    move/from16 v0, v21

    new-array v10, v0, [I

    .line 669
    .local v10, "sizes":[I
    move/from16 v0, v21

    new-array v11, v0, [J

    .line 670
    .local v11, "offsets":[J
    move/from16 v0, v21

    new-array v12, v0, [J

    .line 671
    .local v12, "durationsUs":[J
    move/from16 v0, v21

    new-array v13, v0, [J

    .line 673
    .local v13, "timesUs":[J
    move-wide/from16 v22, v18

    .line 674
    .local v22, "offset":J
    move-wide v2, v14

    .line 675
    .local v2, "time":J
    const-wide/32 v4, 0xf4240

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v26

    .line 676
    .local v26, "timeUs":J
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_1
    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_2

    .line 677
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v16

    .line 679
    .local v16, "firstInt":I
    const/high16 v4, -0x80000000

    and-int v28, v4, v16

    .line 680
    .local v28, "type":I
    if-eqz v28, :cond_1

    .line 681
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Unhandled indirect reference"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 661
    .end local v2    # "time":J
    .end local v10    # "sizes":[I
    .end local v11    # "offsets":[J
    .end local v12    # "durationsUs":[J
    .end local v13    # "timesUs":[J
    .end local v14    # "earliestPresentationTime":J
    .end local v16    # "firstInt":I
    .end local v18    # "firstOffset":J
    .end local v20    # "i":I
    .end local v21    # "referenceCount":I
    .end local v22    # "offset":J
    .end local v26    # "timeUs":J
    .end local v28    # "type":I
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v14

    .line 662
    .restart local v14    # "earliestPresentationTime":J
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v18

    .restart local v18    # "firstOffset":J
    goto :goto_0

    .line 683
    .restart local v2    # "time":J
    .restart local v10    # "sizes":[I
    .restart local v11    # "offsets":[J
    .restart local v12    # "durationsUs":[J
    .restart local v13    # "timesUs":[J
    .restart local v16    # "firstInt":I
    .restart local v20    # "i":I
    .restart local v21    # "referenceCount":I
    .restart local v22    # "offset":J
    .restart local v26    # "timeUs":J
    .restart local v28    # "type":I
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v24

    .line 685
    .local v24, "referenceDuration":J
    const v4, 0x7fffffff

    and-int v4, v4, v16

    aput v4, v10, v20

    .line 686
    aput-wide v22, v11, v20

    .line 690
    aput-wide v26, v13, v20

    .line 691
    add-long v2, v2, v24

    .line 692
    const-wide/32 v4, 0xf4240

    invoke-static/range {v2 .. v7}, Lcom/google/android/exoplayer/util/Util;->scaleLargeTimestamp(JJJ)J

    move-result-wide v26

    .line 693
    aget-wide v4, v13, v20

    sub-long v4, v26, v4

    aput-wide v4, v12, v20

    .line 695
    const/4 v4, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 696
    aget v4, v10, v20

    int-to-long v4, v4

    add-long v22, v22, v4

    .line 676
    add-int/lit8 v20, v20, 0x1

    goto :goto_1

    .line 699
    .end local v16    # "firstInt":I
    .end local v24    # "referenceDuration":J
    .end local v28    # "type":I
    :cond_2
    new-instance v8, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    invoke-virtual/range {p0 .. p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v9

    invoke-direct/range {v8 .. v13}, Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;-><init>(I[I[J[J[J)V

    return-object v8
.end method

.method private static parseTfdt(Lcom/google/android/exoplayer/util/ParsableByteArray;)J
    .locals 4
    .param p0, "tfdt"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 529
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 530
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v0

    .line 531
    .local v0, "fullAtom":I
    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomVersion(I)I

    move-result v1

    .line 532
    .local v1, "version":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedLongToLong()J

    move-result-wide v2

    :goto_0
    return-wide v2

    :cond_0
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedInt()J

    move-result-wide v2

    goto :goto_0
.end method

.method private static parseTfhd(Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .locals 8
    .param p0, "extendsDefaults"    # Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .param p1, "tfhd"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    const/16 v7, 0x8

    .line 500
    invoke-virtual {p1, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 501
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v5

    .line 502
    .local v5, "fullAtom":I
    invoke-static {v5}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomFlags(I)I

    move-result v4

    .line 504
    .local v4, "flags":I
    const/4 v6, 0x4

    invoke-virtual {p1, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 505
    and-int/lit8 v6, v4, 0x1

    if-eqz v6, :cond_0

    .line 506
    invoke-virtual {p1, v7}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 509
    :cond_0
    and-int/lit8 v6, v4, 0x2

    if-eqz v6, :cond_1

    .line 511
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v6

    add-int/lit8 v0, v6, -0x1

    .line 512
    .local v0, "defaultSampleDescriptionIndex":I
    :goto_0
    and-int/lit8 v6, v4, 0x8

    if-eqz v6, :cond_2

    .line 513
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 514
    .local v1, "defaultSampleDuration":I
    :goto_1
    and-int/lit8 v6, v4, 0x10

    if-eqz v6, :cond_3

    .line 515
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 516
    .local v3, "defaultSampleSize":I
    :goto_2
    and-int/lit8 v6, v4, 0x20

    if-eqz v6, :cond_4

    .line 517
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v2

    .line 518
    .local v2, "defaultSampleFlags":I
    :goto_3
    new-instance v6, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    invoke-direct {v6, v0, v1, v3, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;-><init>(IIII)V

    return-object v6

    .line 511
    .end local v0    # "defaultSampleDescriptionIndex":I
    .end local v1    # "defaultSampleDuration":I
    .end local v2    # "defaultSampleFlags":I
    .end local v3    # "defaultSampleSize":I
    :cond_1
    iget v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    goto :goto_0

    .line 513
    .restart local v0    # "defaultSampleDescriptionIndex":I
    :cond_2
    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->duration:I

    goto :goto_1

    .line 515
    .restart local v1    # "defaultSampleDuration":I
    :cond_3
    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->size:I

    goto :goto_2

    .line 517
    .restart local v3    # "defaultSampleSize":I
    :cond_4
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->flags:I

    goto :goto_3
.end method

.method private static parseTraf(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;I[B)V
    .locals 18
    .param p0, "track"    # Lcom/google/android/exoplayer/mp4/Track;
    .param p1, "extendsDefaults"    # Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .param p2, "traf"    # Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;
    .param p3, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;
    .param p4, "workaroundFlags"    # I
    .param p5, "extendedTypeScratch"    # [B

    .prologue
    .line 429
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v14

    .line 430
    .local v14, "tfdtAtom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-nez v14, :cond_3

    const-wide/16 v4, 0x0

    .line 432
    .local v4, "decodeTime":J
    :goto_0
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfhd:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v15

    .line 433
    .local v15, "tfhd":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    iget-object v2, v15, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p1

    invoke-static {v0, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseTfhd(Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    move-result-object v3

    .line 434
    .local v3, "fragmentHeader":Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    iget v2, v3, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    move-object/from16 v0, p3

    iput v2, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDescriptionIndex:I

    .line 436
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trun:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v17

    .line 437
    .local v17, "trun":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    move-object/from16 v0, v17

    iget-object v7, v0, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v2, p0

    move/from16 v6, p4

    move-object/from16 v8, p3

    invoke-static/range {v2 .. v8}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseTrun(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;JILcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V

    .line 439
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_saiz:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v12

    .line 440
    .local v12, "saiz":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-eqz v12, :cond_0

    .line 441
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/google/android/exoplayer/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    iget v6, v3, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->sampleDescriptionIndex:I

    aget-object v16, v2, v6

    .line 443
    .local v16, "trackEncryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    iget-object v2, v12, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, v16

    move-object/from16 v1, p3

    invoke-static {v0, v2, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseSaiz(Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V

    .line 446
    .end local v16    # "trackEncryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    :cond_0
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_senc:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v13

    .line 447
    .local v13, "senc":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    if-eqz v13, :cond_1

    .line 448
    iget-object v2, v13, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p3

    invoke-static {v2, v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V

    .line 451
    :cond_1
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v10

    .line 452
    .local v10, "childrenSize":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    if-ge v11, v10, :cond_4

    .line 453
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->leafChildren:Ljava/util/List;

    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    .line 454
    .local v9, "atom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    iget v2, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->type:I

    sget v6, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_uuid:I

    if-ne v2, v6, :cond_2

    .line 455
    iget-object v2, v9, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    move-object/from16 v0, p3

    move-object/from16 v1, p5

    invoke-static {v2, v0, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseUuid(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;[B)V

    .line 452
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 430
    .end local v3    # "fragmentHeader":Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .end local v4    # "decodeTime":J
    .end local v9    # "atom":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .end local v10    # "childrenSize":I
    .end local v11    # "i":I
    .end local v12    # "saiz":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .end local v13    # "senc":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .end local v15    # "tfhd":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .end local v17    # "trun":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    :cond_3
    sget v2, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfdt:I

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->getLeafAtomOfType(I)Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    move-result-object v2

    iget-object v2, v2, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;->data:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-static {v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseTfdt(Lcom/google/android/exoplayer/util/ParsableByteArray;)J

    move-result-wide v4

    goto/16 :goto_0

    .line 458
    .restart local v3    # "fragmentHeader":Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .restart local v4    # "decodeTime":J
    .restart local v10    # "childrenSize":I
    .restart local v11    # "i":I
    .restart local v12    # "saiz":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .restart local v13    # "senc":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .restart local v15    # "tfhd":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    .restart local v17    # "trun":Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    :cond_4
    return-void
.end method

.method private static parseTrex(Lcom/google/android/exoplayer/util/ParsableByteArray;)Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .locals 5
    .param p0, "trex"    # Lcom/google/android/exoplayer/util/ParsableByteArray;

    .prologue
    .line 409
    const/16 v4, 0x10

    invoke-virtual {p0, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 410
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 411
    .local v0, "defaultSampleDescriptionIndex":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v1

    .line 412
    .local v1, "defaultSampleDuration":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v3

    .line 413
    .local v3, "defaultSampleSize":I
    invoke-virtual {p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 414
    .local v2, "defaultSampleFlags":I
    new-instance v4, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    invoke-direct {v4, v0, v1, v3, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;-><init>(IIII)V

    return-object v4
.end method

.method private static parseTrun(Lcom/google/android/exoplayer/mp4/Track;Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;JILcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V
    .locals 28
    .param p0, "track"    # Lcom/google/android/exoplayer/mp4/Track;
    .param p1, "defaultSampleValues"    # Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;
    .param p2, "decodeTime"    # J
    .param p4, "workaroundFlags"    # I
    .param p5, "trun"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p6, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .prologue
    .line 546
    const/16 v25, 0x8

    move-object/from16 v0, p5

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 547
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v7

    .line 548
    .local v7, "fullAtom":I
    invoke-static {v7}, Lcom/google/android/exoplayer/mp4/Mp4Util;->parseFullAtomFlags(I)I

    move-result v6

    .line 550
    .local v6, "flags":I
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v11

    .line 551
    .local v11, "sampleCount":I
    and-int/lit8 v25, v6, 0x1

    if-eqz v25, :cond_0

    .line 552
    const/16 v25, 0x4

    move-object/from16 v0, p5

    move/from16 v1, v25

    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 555
    :cond_0
    and-int/lit8 v25, v6, 0x4

    if-eqz v25, :cond_3

    const/4 v5, 0x1

    .line 556
    .local v5, "firstSampleFlagsPresent":Z
    :goto_0
    move-object/from16 v0, p1

    iget v4, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->flags:I

    .line 557
    .local v4, "firstSampleFlags":I
    if-eqz v5, :cond_1

    .line 558
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v4

    .line 561
    :cond_1
    and-int/lit16 v0, v6, 0x100

    move/from16 v25, v0

    if-eqz v25, :cond_4

    const/4 v14, 0x1

    .line 562
    .local v14, "sampleDurationsPresent":Z
    :goto_1
    and-int/lit16 v0, v6, 0x200

    move/from16 v25, v0

    if-eqz v25, :cond_5

    const/16 v21, 0x1

    .line 563
    .local v21, "sampleSizesPresent":Z
    :goto_2
    and-int/lit16 v0, v6, 0x400

    move/from16 v25, v0

    if-eqz v25, :cond_6

    const/16 v16, 0x1

    .line 564
    .local v16, "sampleFlagsPresent":Z
    :goto_3
    and-int/lit16 v0, v6, 0x800

    move/from16 v25, v0

    if-eqz v25, :cond_7

    const/4 v10, 0x1

    .line 567
    .local v10, "sampleCompositionTimeOffsetsPresent":Z
    :goto_4
    move-object/from16 v0, p6

    invoke-virtual {v0, v11}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->initTables(I)V

    .line 568
    move-object/from16 v0, p6

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    move-object/from16 v20, v0

    .line 569
    .local v20, "sampleSizeTable":[I
    move-object/from16 v0, p6

    iget-object v9, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleCompositionTimeOffsetTable:[I

    .line 570
    .local v9, "sampleCompositionTimeOffsetTable":[I
    move-object/from16 v0, p6

    iget-object v12, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDecodingTimeTable:[J

    .line 571
    .local v12, "sampleDecodingTimeTable":[J
    move-object/from16 v0, p6

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    move-object/from16 v17, v0

    .line 573
    .local v17, "sampleIsSyncFrameTable":[Z
    move-object/from16 v0, p0

    iget-wide v0, v0, Lcom/google/android/exoplayer/mp4/Track;->timescale:J

    move-wide/from16 v22, v0

    .line 574
    .local v22, "timescale":J
    move-wide/from16 v2, p2

    .line 575
    .local v2, "cumulativeTime":J
    move-object/from16 v0, p0

    iget v0, v0, Lcom/google/android/exoplayer/mp4/Track;->type:I

    move/from16 v25, v0

    const v26, 0x76696465

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_8

    and-int/lit8 v25, p4, 0x1

    const/16 v26, 0x1

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_8

    const/16 v24, 0x1

    .line 578
    .local v24, "workaroundEveryVideoFrameIsSyncFrame":Z
    :goto_5
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_6
    if-ge v8, v11, :cond_f

    .line 580
    if-eqz v14, :cond_9

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v13

    .line 582
    .local v13, "sampleDuration":I
    :goto_7
    if-eqz v21, :cond_a

    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v19

    .line 583
    .local v19, "sampleSize":I
    :goto_8
    if-nez v8, :cond_b

    if-eqz v5, :cond_b

    move v15, v4

    .line 585
    .local v15, "sampleFlags":I
    :goto_9
    if-eqz v10, :cond_d

    .line 591
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v18

    .line 592
    .local v18, "sampleOffset":I
    move/from16 v0, v18

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    div-long v26, v26, v22

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v25, v0

    aput v25, v9, v8

    .line 596
    .end local v18    # "sampleOffset":I
    :goto_a
    const-wide/16 v26, 0x3e8

    mul-long v26, v26, v2

    div-long v26, v26, v22

    aput-wide v26, v12, v8

    .line 597
    aput v19, v20, v8

    .line 598
    shr-int/lit8 v25, v15, 0x10

    and-int/lit8 v25, v25, 0x1

    if-nez v25, :cond_e

    if-eqz v24, :cond_2

    if-nez v8, :cond_e

    :cond_2
    const/16 v25, 0x1

    :goto_b
    aput-boolean v25, v17, v8

    .line 600
    int-to-long v0, v13

    move-wide/from16 v26, v0

    add-long v2, v2, v26

    .line 578
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    .line 555
    .end local v2    # "cumulativeTime":J
    .end local v4    # "firstSampleFlags":I
    .end local v5    # "firstSampleFlagsPresent":Z
    .end local v8    # "i":I
    .end local v9    # "sampleCompositionTimeOffsetTable":[I
    .end local v10    # "sampleCompositionTimeOffsetsPresent":Z
    .end local v12    # "sampleDecodingTimeTable":[J
    .end local v13    # "sampleDuration":I
    .end local v14    # "sampleDurationsPresent":Z
    .end local v15    # "sampleFlags":I
    .end local v16    # "sampleFlagsPresent":Z
    .end local v17    # "sampleIsSyncFrameTable":[Z
    .end local v19    # "sampleSize":I
    .end local v20    # "sampleSizeTable":[I
    .end local v21    # "sampleSizesPresent":Z
    .end local v22    # "timescale":J
    .end local v24    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_3
    const/4 v5, 0x0

    goto/16 :goto_0

    .line 561
    .restart local v4    # "firstSampleFlags":I
    .restart local v5    # "firstSampleFlagsPresent":Z
    :cond_4
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 562
    .restart local v14    # "sampleDurationsPresent":Z
    :cond_5
    const/16 v21, 0x0

    goto/16 :goto_2

    .line 563
    .restart local v21    # "sampleSizesPresent":Z
    :cond_6
    const/16 v16, 0x0

    goto/16 :goto_3

    .line 564
    .restart local v16    # "sampleFlagsPresent":Z
    :cond_7
    const/4 v10, 0x0

    goto/16 :goto_4

    .line 575
    .restart local v2    # "cumulativeTime":J
    .restart local v9    # "sampleCompositionTimeOffsetTable":[I
    .restart local v10    # "sampleCompositionTimeOffsetsPresent":Z
    .restart local v12    # "sampleDecodingTimeTable":[J
    .restart local v17    # "sampleIsSyncFrameTable":[Z
    .restart local v20    # "sampleSizeTable":[I
    .restart local v22    # "timescale":J
    :cond_8
    const/16 v24, 0x0

    goto :goto_5

    .line 580
    .restart local v8    # "i":I
    .restart local v24    # "workaroundEveryVideoFrameIsSyncFrame":Z
    :cond_9
    move-object/from16 v0, p1

    iget v13, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->duration:I

    goto :goto_7

    .line 582
    .restart local v13    # "sampleDuration":I
    :cond_a
    move-object/from16 v0, p1

    iget v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->size:I

    move/from16 v19, v0

    goto :goto_8

    .line 583
    .restart local v19    # "sampleSize":I
    :cond_b
    if-eqz v16, :cond_c

    .line 584
    invoke-virtual/range {p5 .. p5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v15

    goto :goto_9

    :cond_c
    move-object/from16 v0, p1

    iget v15, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;->flags:I

    goto :goto_9

    .line 594
    .restart local v15    # "sampleFlags":I
    :cond_d
    const/16 v25, 0x0

    aput v25, v9, v8

    goto :goto_a

    .line 598
    :cond_e
    const/16 v25, 0x0

    goto :goto_b

    .line 602
    .end local v13    # "sampleDuration":I
    .end local v15    # "sampleFlags":I
    .end local v19    # "sampleSize":I
    :cond_f
    return-void
.end method

.method private static parseUuid(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;[B)V
    .locals 2
    .param p0, "uuid"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p1, "out"    # Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;
    .param p2, "extendedTypeScratch"    # [B

    .prologue
    const/16 v1, 0x10

    .line 606
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 607
    const/4 v0, 0x0

    invoke-virtual {p0, p2, v0, v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 610
    sget-object v0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->PIFF_SAMPLE_ENCRYPTION_BOX_EXTENDED_TYPE:[B

    invoke-static {p2, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_0

    .line 618
    :goto_0
    return-void

    .line 617
    :cond_0
    invoke-static {p0, v1, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parseSenc(Lcom/google/android/exoplayer/util/ParsableByteArray;ILcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;)V

    goto :goto_0
.end method

.method private readAtomHeader(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 10
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    const/16 v8, 0x8

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 272
    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    rsub-int/lit8 v2, v6, 0x8

    .line 273
    .local v2, "remainingBytes":I
    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    invoke-interface {p1, v6, v7, v2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read([BII)I

    move-result v1

    .line 274
    .local v1, "bytesRead":I
    const/4 v6, -0x1

    if-ne v1, v6, :cond_0

    .line 312
    :goto_0
    return v3

    .line 277
    :cond_0
    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    .line 278
    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    .line 279
    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    if-eq v6, v8, :cond_1

    move v3, v4

    .line 280
    goto :goto_0

    .line 283
    :cond_1
    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 284
    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    .line 285
    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-virtual {v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v6

    iput v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomType:I

    .line 287
    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomType:I

    sget v7, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdat:I

    if-ne v6, v7, :cond_3

    .line 288
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-boolean v4, v4, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionDataNeedsFill:Z

    if-eqz v4, :cond_2

    .line 289
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    :goto_1
    move v3, v5

    .line 293
    goto :goto_0

    .line 291
    :cond_2
    const/4 v3, 0x3

    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    goto :goto_1

    .line 296
    :cond_3
    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 297
    .local v0, "atomTypeInteger":Ljava/lang/Integer;
    sget-object v3, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->PARSED_ATOMS:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 298
    sget-object v3, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->CONTAINER_TYPES:Ljava/util/Set;

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 299
    invoke-direct {p0, v5}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 300
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    new-instance v4, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomType:I

    iget v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    iget v8, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    add-int/2addr v7, v8

    add-int/lit8 v7, v7, -0x8

    int-to-long v8, v7

    invoke-direct {v4, v6, v8, v9}, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;-><init>(IJ)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->add(Ljava/lang/Object;)Z

    :goto_2
    move v3, v5

    .line 312
    goto :goto_0

    .line 303
    :cond_4
    new-instance v3, Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    invoke-direct {v3, v6}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>(I)V

    iput-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 304
    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomHeader:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v3, v3, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v6, v6, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    invoke-static {v3, v5, v6, v5, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 305
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    goto :goto_2

    .line 308
    :cond_5
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 309
    invoke-direct {p0, v4}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    goto :goto_2
.end method

.method private readAtomPayload(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 6
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    .line 317
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v2, :cond_0

    .line 318
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    iget-object v2, v2, Lcom/google/android/exoplayer/util/ParsableByteArray;->data:[B

    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    iget v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    sub-int/2addr v4, v5

    invoke-interface {p1, v2, v3, v4}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read([BII)I

    move-result v0

    .line 322
    .local v0, "bytesRead":I
    :goto_0
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 323
    const/4 v1, 0x2

    .line 341
    :goto_1
    return v1

    .line 320
    .end local v0    # "bytesRead":I
    :cond_0
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    sub-int/2addr v2, v3

    invoke-interface {p1, v2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->skip(I)I

    move-result v0

    .restart local v0    # "bytesRead":I
    goto :goto_0

    .line 325
    :cond_1
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    .line 326
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    .line 327
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomBytesRead:I

    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomSize:I

    if-eq v2, v3, :cond_2

    .line 328
    const/4 v1, 0x1

    goto :goto_1

    .line 331
    :cond_2
    const/4 v1, 0x0

    .line 332
    .local v1, "results":I
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    if-eqz v2, :cond_3

    .line 333
    new-instance v2, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;

    iget v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomType:I

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->atomData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v2, v3, v4}, Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;-><init>(ILcom/google/android/exoplayer/util/ParsableByteArray;)V

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->onLeafAtomRead(Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;)I

    move-result v2

    or-int/2addr v1, v2

    .line 336
    :cond_3
    :goto_2
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    iget-wide v2, v2, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;->endByteOffset:J

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->rootAtomBytesRead:I

    int-to-long v4, v4

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 337
    iget-object v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->onContainerAtomRead(Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;)I

    move-result v2

    or-int/2addr v1, v2

    goto :goto_2

    .line 340
    :cond_4
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    goto :goto_1
.end method

.method private readEncryptionData(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    .locals 2
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;

    .prologue
    .line 703
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    invoke-virtual {v1, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->fillEncryptionData(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)Z

    move-result v0

    .line 704
    .local v0, "success":Z
    if-nez v0, :cond_0

    .line 705
    const/4 v1, 0x1

    .line 708
    :goto_0
    return v1

    .line 707
    :cond_0
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 708
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private readOrSkipSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I
    .locals 6
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "out"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v1, 0x0

    .line 729
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    iget-object v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v3, v3, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-lt v2, v3, :cond_0

    .line 731
    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 741
    :goto_0
    return v1

    .line 734
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget v0, v1, v2

    .line 735
    .local v0, "sampleSize":I
    invoke-interface {p1}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->getAvailableByteCount()J

    move-result-wide v2

    int-to-long v4, v0

    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    .line 736
    const/4 v1, 0x1

    goto :goto_0

    .line 738
    :cond_1
    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekSyncSampleIndex:I

    if-ge v1, v2, :cond_2

    .line 739
    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->skipSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)I

    move-result v1

    goto :goto_0

    .line 741
    :cond_2
    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;ILcom/google/android/exoplayer/SampleHolder;)I

    move-result v1

    goto :goto_0
.end method

.method private readSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;ILcom/google/android/exoplayer/SampleHolder;)I
    .locals 7
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "sampleSize"    # I
    .param p3, "out"    # Lcom/google/android/exoplayer/SampleHolder;

    .prologue
    const/4 v6, 0x0

    .line 766
    if-nez p3, :cond_0

    .line 767
    const/16 v1, 0x20

    .line 798
    :goto_0
    return v1

    .line 769
    :cond_0
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    iput-wide v2, p3, Lcom/google/android/exoplayer/SampleHolder;->timeUs:J

    .line 770
    iput v6, p3, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 771
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_1

    .line 772
    iget v1, p3, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p3, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 773
    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->lastSyncSampleIndex:I

    .line 775
    :cond_1
    iget-object v1, p3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    if-eqz v1, :cond_2

    iget-object v1, p3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v1

    if-ge v1, p2, :cond_3

    .line 776
    :cond_2
    invoke-virtual {p3, p2}, Lcom/google/android/exoplayer/SampleHolder;->replaceBuffer(I)Z

    .line 778
    :cond_3
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-boolean v1, v1, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v1, :cond_4

    .line 779
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v1, v1, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {p0, v1, p3}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readSampleEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/SampleHolder;)V

    .line 782
    :cond_4
    iget-object v0, p3, Lcom/google/android/exoplayer/SampleHolder;->data:Ljava/nio/ByteBuffer;

    .line 783
    .local v0, "outputData":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_5

    .line 784
    invoke-interface {p1, p2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->skip(I)I

    .line 785
    iput v6, p3, Lcom/google/android/exoplayer/SampleHolder;->size:I

    .line 796
    :goto_1
    iget v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    .line 797
    const/4 v1, 0x3

    invoke-direct {p0, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 798
    const/4 v1, 0x4

    goto :goto_0

    .line 787
    :cond_5
    invoke-interface {p1, v0, p2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->read(Ljava/nio/ByteBuffer;I)I

    .line 788
    iget-object v1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget v1, v1, Lcom/google/android/exoplayer/mp4/Track;->type:I

    const v2, 0x76696465

    if-ne v1, v2, :cond_6

    .line 791
    invoke-static {v0, p2}, Lcom/google/android/exoplayer/mp4/Mp4Util;->replaceLengthPrefixesWithAvcStartCodes(Ljava/nio/ByteBuffer;I)V

    .line 793
    :cond_6
    iput p2, p3, Lcom/google/android/exoplayer/SampleHolder;->size:I

    goto :goto_1
.end method

.method private readSampleEncryptionData(Lcom/google/android/exoplayer/util/ParsableByteArray;Lcom/google/android/exoplayer/SampleHolder;)V
    .locals 13
    .param p1, "sampleEncryptionData"    # Lcom/google/android/exoplayer/util/ParsableByteArray;
    .param p2, "out"    # Lcom/google/android/exoplayer/SampleHolder;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    .prologue
    .line 803
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v6, v6, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDescriptionIndex:I

    aget-object v7, v0, v6

    .line 805
    .local v7, "encryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    iget-object v4, v7, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;->keyId:[B

    .line 806
    .local v4, "keyId":[B
    iget-boolean v9, v7, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;->isEncrypted:Z

    .line 807
    .local v9, "isEncrypted":Z
    iget v11, v7, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 808
    .local v11, "vectorSize":I
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v0, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget-boolean v10, v0, v6

    .line 810
    .local v10, "subsampleEncryption":Z
    iget-object v0, p2, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    iget-object v5, v0, Lcom/google/android/exoplayer/CryptoInfo;->iv:[B

    .line 811
    .local v5, "vector":[B
    if-eqz v5, :cond_0

    array-length v0, v5

    const/16 v6, 0x10

    if-eq v0, v6, :cond_1

    .line 812
    :cond_0
    const/16 v0, 0x10

    new-array v5, v0, [B

    .line 814
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p1, v5, v0, v11}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 816
    if-eqz v10, :cond_6

    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v1

    .line 817
    .local v1, "subsampleCount":I
    :goto_0
    iget-object v0, p2, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    iget-object v2, v0, Lcom/google/android/exoplayer/CryptoInfo;->numBytesOfClearData:[I

    .line 818
    .local v2, "clearDataSizes":[I
    if-eqz v2, :cond_2

    array-length v0, v2

    if-ge v0, v1, :cond_3

    .line 819
    :cond_2
    new-array v2, v1, [I

    .line 821
    :cond_3
    iget-object v0, p2, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    iget-object v3, v0, Lcom/google/android/exoplayer/CryptoInfo;->numBytesOfEncryptedData:[I

    .line 822
    .local v3, "encryptedDataSizes":[I
    if-eqz v3, :cond_4

    array-length v0, v3

    if-ge v0, v1, :cond_5

    .line 823
    :cond_4
    new-array v3, v1, [I

    .line 825
    :cond_5
    if-eqz v10, :cond_7

    .line 826
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_1
    if-ge v8, v1, :cond_8

    .line 827
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v0

    aput v0, v2, v8

    .line 828
    invoke-virtual {p1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v0

    aput v0, v3, v8

    .line 826
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 816
    .end local v1    # "subsampleCount":I
    .end local v2    # "clearDataSizes":[I
    .end local v3    # "encryptedDataSizes":[I
    .end local v8    # "i":I
    :cond_6
    const/4 v1, 0x1

    goto :goto_0

    .line 831
    .restart local v1    # "subsampleCount":I
    .restart local v2    # "clearDataSizes":[I
    .restart local v3    # "encryptedDataSizes":[I
    :cond_7
    const/4 v0, 0x0

    const/4 v6, 0x0

    aput v6, v2, v0

    .line 832
    const/4 v0, 0x0

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v6, v6, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleSizeTable:[I

    iget v12, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget v6, v6, v12

    aput v6, v3, v0

    .line 834
    :cond_8
    iget-object v0, p2, Lcom/google/android/exoplayer/SampleHolder;->cryptoInfo:Lcom/google/android/exoplayer/CryptoInfo;

    if-eqz v9, :cond_a

    const/4 v6, 0x1

    :goto_2
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/exoplayer/CryptoInfo;->set(I[I[I[B[BI)V

    .line 836
    if-eqz v9, :cond_9

    .line 837
    iget v0, p2, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p2, Lcom/google/android/exoplayer/SampleHolder;->flags:I

    .line 839
    :cond_9
    return-void

    .line 834
    :cond_a
    const/4 v6, 0x0

    goto :goto_2
.end method

.method private skipSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;I)I
    .locals 7
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "sampleSize"    # I

    .prologue
    .line 745
    iget-object v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-boolean v5, v5, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->definesEncryptionData:Z

    if-eqz v5, :cond_0

    .line 746
    iget-object v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v1, v5, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleEncryptionData:Lcom/google/android/exoplayer/util/ParsableByteArray;

    .line 747
    .local v1, "sampleEncryptionData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    iget-object v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget-object v5, v5, Lcom/google/android/exoplayer/mp4/Track;->sampleDescriptionEncryptionBoxes:[Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v6, v6, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleDescriptionIndex:I

    aget-object v0, v5, v6

    .line 749
    .local v0, "encryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    iget v4, v0, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;->initializationVectorSize:I

    .line 750
    .local v4, "vectorSize":I
    iget-object v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v5, v5, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleHasSubsampleEncryptionTable:[Z

    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    aget-boolean v3, v5, v6

    .line 751
    .local v3, "subsampleEncryption":Z
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 752
    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedShort()I

    move-result v2

    .line 753
    .local v2, "subsampleCount":I
    :goto_0
    if-eqz v3, :cond_0

    .line 754
    mul-int/lit8 v5, v2, 0x6

    invoke-virtual {v1, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skip(I)V

    .line 758
    .end local v0    # "encryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    .end local v1    # "sampleEncryptionData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .end local v2    # "subsampleCount":I
    .end local v3    # "subsampleEncryption":Z
    .end local v4    # "vectorSize":I
    :cond_0
    invoke-interface {p1, p2}, Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;->skip(I)I

    .line 760
    iget v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    add-int/lit8 v5, v5, 0x1

    iput v5, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    .line 761
    const/4 v5, 0x3

    invoke-direct {p0, v5}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 762
    const/4 v5, 0x0

    return v5

    .line 752
    .restart local v0    # "encryptionBox":Lcom/google/android/exoplayer/chunk/parser/mp4/TrackEncryptionBox;
    .restart local v1    # "sampleEncryptionData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    .restart local v3    # "subsampleEncryption":Z
    .restart local v4    # "vectorSize":I
    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method


# virtual methods
.method public getDurationUs()J
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    if-nez v0, :cond_0

    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget-wide v0, v0, Lcom/google/android/exoplayer/mp4/Track;->durationUs:J

    goto :goto_0
.end method

.method public getFormat()Lcom/google/android/exoplayer/MediaFormat;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    iget-object v0, v0, Lcom/google/android/exoplayer/mp4/Track;->mediaFormat:Lcom/google/android/exoplayer/MediaFormat;

    goto :goto_0
.end method

.method public getIndex()Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;
    .locals 1

    .prologue
    .line 188
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->segmentIndex:Lcom/google/android/exoplayer/chunk/parser/SegmentIndex;

    return-object v0
.end method

.method public getPsshInfo()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation

    .prologue
    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->psshData:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->psshData:Ljava/util/HashMap;

    goto :goto_0
.end method

.method public hasRelativeIndexOffsets()Z
    .locals 1

    .prologue
    .line 193
    const/4 v0, 0x1

    return v0
.end method

.method public read(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I
    .locals 3
    .param p1, "inputStream"    # Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;
    .param p2, "out"    # Lcom/google/android/exoplayer/SampleHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer/ParserException;
        }
    .end annotation

    .prologue
    .line 210
    const/4 v1, 0x0

    .line 211
    .local v1, "results":I
    :goto_0
    and-int/lit8 v2, v1, 0x27

    if-nez v2, :cond_0

    .line 212
    :try_start_0
    iget v2, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->parserState:I

    packed-switch v2, :pswitch_data_0

    .line 223
    invoke-direct {p0, p1, p2}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readOrSkipSample(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;Lcom/google/android/exoplayer/SampleHolder;)I

    move-result v2

    or-int/2addr v1, v2

    .line 224
    goto :goto_0

    .line 214
    :pswitch_0
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readAtomHeader(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v2

    or-int/2addr v1, v2

    .line 215
    goto :goto_0

    .line 217
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readAtomPayload(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I

    move-result v2

    or-int/2addr v1, v2

    .line 218
    goto :goto_0

    .line 220
    :pswitch_2
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->readEncryptionData(Lcom/google/android/exoplayer/upstream/NonBlockingInputStream;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    or-int/2addr v1, v2

    .line 221
    goto :goto_0

    .line 228
    :catch_0
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Lcom/google/android/exoplayer/ParserException;

    invoke-direct {v2, v0}, Lcom/google/android/exoplayer/ParserException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 227
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    return v1

    .line 212
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public seekTo(JZ)Z
    .locals 9
    .param p1, "seekTimeUs"    # J
    .param p3, "allowNoop"    # Z

    .prologue
    const/4 v3, 0x0

    .line 235
    const-wide/16 v4, 0x3e8

    div-long v4, p1, v4

    long-to-int v4, v4

    iput v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    .line 236
    if-eqz p3, :cond_3

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v4, v4, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-lez v4, :cond_3

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    int-to-long v4, v4

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    .line 237
    invoke-virtual {v6, v3}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-ltz v4, :cond_3

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    int-to-long v4, v4

    iget-object v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v7, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v7, v7, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    add-int/lit8 v7, v7, -0x1

    .line 238
    invoke-virtual {v6, v7}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    .line 239
    const/4 v1, 0x0

    .line 240
    .local v1, "sampleIndexFound":I
    const/4 v2, 0x0

    .line 241
    .local v2, "syncSampleIndexFound":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget v4, v4, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->length:I

    if-ge v0, v4, :cond_2

    .line 242
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    invoke-virtual {v4, v0}, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->getSamplePresentationTime(I)J

    move-result-wide v4

    iget v6, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    int-to-long v6, v6

    cmp-long v4, v4, v6

    if-gtz v4, :cond_1

    .line 243
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->fragmentRun:Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;

    iget-object v4, v4, Lcom/google/android/exoplayer/chunk/parser/mp4/TrackFragment;->sampleIsSyncFrameTable:[Z

    aget-boolean v4, v4, v0

    if-eqz v4, :cond_0

    .line 244
    move v2, v0

    .line 246
    :cond_0
    move v1, v0

    .line 241
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 249
    :cond_2
    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->lastSyncSampleIndex:I

    if-ne v2, v4, :cond_3

    iget v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->sampleIndex:I

    if-lt v1, v4, :cond_3

    .line 250
    iput v3, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->pendingSeekTimeMs:I

    .line 256
    .end local v0    # "i":I
    .end local v1    # "sampleIndexFound":I
    .end local v2    # "syncSampleIndexFound":I
    :goto_1
    return v3

    .line 254
    :cond_3
    iget-object v4, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->containerAtoms:Ljava/util/Stack;

    invoke-virtual {v4}, Ljava/util/Stack;->clear()V

    .line 255
    invoke-direct {p0, v3}, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->enterState(I)V

    .line 256
    const/4 v3, 0x1

    goto :goto_1
.end method

.method public setTrack(Lcom/google/android/exoplayer/mp4/Track;)V
    .locals 2
    .param p1, "track"    # Lcom/google/android/exoplayer/mp4/Track;

    .prologue
    const/4 v1, 0x0

    .line 177
    new-instance v0, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;-><init>(IIII)V

    iput-object v0, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->extendsDefaults:Lcom/google/android/exoplayer/chunk/parser/mp4/DefaultSampleValues;

    .line 178
    iput-object p1, p0, Lcom/google/android/exoplayer/chunk/parser/mp4/FragmentedMp4Extractor;->track:Lcom/google/android/exoplayer/mp4/Track;

    .line 179
    return-void
.end method
