.class public abstract Lcom/google/android/exoplayer/mp4/Atom;
.super Ljava/lang/Object;
.source "Atom.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer/mp4/Atom$ContainerAtom;,
        Lcom/google/android/exoplayer/mp4/Atom$LeafAtom;
    }
.end annotation


# static fields
.field public static final TYPE_TTML:I

.field public static final TYPE_ac_3:I

.field public static final TYPE_avc1:I

.field public static final TYPE_avc3:I

.field public static final TYPE_avcC:I

.field public static final TYPE_co64:I

.field public static final TYPE_ctts:I

.field public static final TYPE_dac3:I

.field public static final TYPE_dec3:I

.field public static final TYPE_ec_3:I

.field public static final TYPE_enca:I

.field public static final TYPE_encv:I

.field public static final TYPE_esds:I

.field public static final TYPE_frma:I

.field public static final TYPE_hdlr:I

.field public static final TYPE_mdat:I

.field public static final TYPE_mdhd:I

.field public static final TYPE_mdia:I

.field public static final TYPE_minf:I

.field public static final TYPE_moof:I

.field public static final TYPE_moov:I

.field public static final TYPE_mp4a:I

.field public static final TYPE_mp4v:I

.field public static final TYPE_mvex:I

.field public static final TYPE_mvhd:I

.field public static final TYPE_pasp:I

.field public static final TYPE_pssh:I

.field public static final TYPE_saiz:I

.field public static final TYPE_schi:I

.field public static final TYPE_schm:I

.field public static final TYPE_senc:I

.field public static final TYPE_sidx:I

.field public static final TYPE_sinf:I

.field public static final TYPE_smhd:I

.field public static final TYPE_stbl:I

.field public static final TYPE_stco:I

.field public static final TYPE_stsc:I

.field public static final TYPE_stsd:I

.field public static final TYPE_stss:I

.field public static final TYPE_stsz:I

.field public static final TYPE_stts:I

.field public static final TYPE_tenc:I

.field public static final TYPE_tfdt:I

.field public static final TYPE_tfhd:I

.field public static final TYPE_tkhd:I

.field public static final TYPE_traf:I

.field public static final TYPE_trak:I

.field public static final TYPE_trex:I

.field public static final TYPE_trun:I

.field public static final TYPE_uuid:I

.field public static final TYPE_vmhd:I


# instance fields
.field public final type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-string v0, "avc1"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc1:I

    .line 28
    const-string v0, "avc3"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avc3:I

    .line 29
    const-string v0, "esds"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_esds:I

    .line 30
    const-string v0, "mdat"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdat:I

    .line 31
    const-string v0, "mp4a"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4a:I

    .line 32
    const-string v0, "ac-3"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ac_3:I

    .line 33
    const-string v0, "dac3"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_dac3:I

    .line 34
    const-string v0, "ec-3"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ec_3:I

    .line 35
    const-string v0, "dec3"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_dec3:I

    .line 36
    const-string v0, "tfdt"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfdt:I

    .line 37
    const-string v0, "tfhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tfhd:I

    .line 38
    const-string v0, "trex"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trex:I

    .line 39
    const-string v0, "trun"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trun:I

    .line 40
    const-string v0, "sidx"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sidx:I

    .line 41
    const-string v0, "moov"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moov:I

    .line 42
    const-string v0, "mvhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvhd:I

    .line 43
    const-string v0, "trak"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_trak:I

    .line 44
    const-string v0, "mdia"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdia:I

    .line 45
    const-string v0, "minf"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_minf:I

    .line 46
    const-string v0, "stbl"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stbl:I

    .line 47
    const-string v0, "avcC"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_avcC:I

    .line 48
    const-string v0, "moof"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_moof:I

    .line 49
    const-string v0, "traf"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_traf:I

    .line 50
    const-string v0, "mvex"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mvex:I

    .line 51
    const-string v0, "tkhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tkhd:I

    .line 52
    const-string v0, "mdhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mdhd:I

    .line 53
    const-string v0, "hdlr"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_hdlr:I

    .line 54
    const-string v0, "stsd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsd:I

    .line 55
    const-string v0, "pssh"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pssh:I

    .line 56
    const-string v0, "sinf"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_sinf:I

    .line 57
    const-string v0, "schm"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_schm:I

    .line 58
    const-string v0, "schi"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_schi:I

    .line 59
    const-string v0, "tenc"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_tenc:I

    .line 60
    const-string v0, "encv"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_encv:I

    .line 61
    const-string v0, "enca"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_enca:I

    .line 62
    const-string v0, "frma"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_frma:I

    .line 63
    const-string v0, "saiz"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_saiz:I

    .line 64
    const-string v0, "uuid"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_uuid:I

    .line 65
    const-string v0, "senc"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_senc:I

    .line 66
    const-string v0, "pasp"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_pasp:I

    .line 67
    const-string v0, "TTML"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_TTML:I

    .line 68
    const-string v0, "vmhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_vmhd:I

    .line 69
    const-string v0, "smhd"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_smhd:I

    .line 70
    const-string v0, "mp4v"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_mp4v:I

    .line 71
    const-string v0, "stts"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stts:I

    .line 72
    const-string v0, "stss"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stss:I

    .line 73
    const-string v0, "ctts"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_ctts:I

    .line 74
    const-string v0, "stsc"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsc:I

    .line 75
    const-string v0, "stsz"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stsz:I

    .line 76
    const-string v0, "stco"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_stco:I

    .line 77
    const-string v0, "co64"

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeInteger(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/google/android/exoplayer/mp4/Atom;->TYPE_co64:I

    return-void
.end method

.method constructor <init>(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput p1, p0, Lcom/google/android/exoplayer/mp4/Atom;->type:I

    .line 83
    return-void
.end method

.method static synthetic access$000(I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # I

    .prologue
    .line 25
    invoke-static {p0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getAtomTypeInteger(Ljava/lang/String;)I
    .locals 4
    .param p0, "typeName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    .line 164
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    :goto_0
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 165
    const/4 v1, 0x0

    .line 166
    .local v1, "result":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    if-ge v0, v3, :cond_1

    .line 167
    shl-int/lit8 v1, v1, 0x8

    .line 168
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    or-int/2addr v1, v2

    .line 166
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 164
    .end local v0    # "i":I
    .end local v1    # "result":I
    :cond_0
    const/4 v2, 0x0

    goto :goto_0

    .line 170
    .restart local v0    # "i":I
    .restart local v1    # "result":I
    :cond_1
    return v1
.end method

.method private static getAtomTypeString(I)Ljava/lang/String;
    .locals 2
    .param p0, "type"    # I

    .prologue
    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x18

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    shr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    and-int/lit16 v1, p0, 0xff

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget v0, p0, Lcom/google/android/exoplayer/mp4/Atom;->type:I

    invoke-static {v0}, Lcom/google/android/exoplayer/mp4/Atom;->getAtomTypeString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
