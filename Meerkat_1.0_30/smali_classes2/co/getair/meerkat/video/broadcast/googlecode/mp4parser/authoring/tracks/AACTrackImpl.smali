.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;
.source "AACTrackImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    }
.end annotation


# static fields
.field static audioObjectTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static samplingFrequencyIndexMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field avgBitRate:J

.field bufferSizeDB:I

.field private dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

.field decTimes:[J

.field firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

.field private lang:Ljava/lang/String;

.field maxBitRate:J

.field sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field private samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 49
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    .line 52
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AAC Main"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AAC LC (Low Complexity)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AAC SSR (Scalable Sample Rate)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AAC LTP (Long Term Prediction)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SBR (Spectral Band Replication)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "AAC Scalable"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "TwinVQ"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "CELP (Code Excited Linear Prediction)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "HXVC (Harmonic Vector eXcitation Coding)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reserved"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reserved"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xc

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "TTSI (Text-To-Speech Interface)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xd

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Main Synthesis"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xe

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Wavetable Synthesis"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "General MIDI"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x10

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Algorithmic Synthesis and Audio Effects"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER (Error Resilient) AAC LC"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x12

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Reserved"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x13

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER AAC LTP"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER AAC Scalable"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x15

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER TwinVQ"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x16

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER BSAC (Bit-Sliced Arithmetic Coding)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x17

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER AAC LD (Low Delay)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x18

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER CELP"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x19

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER HVXC"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER HILN (Harmonic and Individual Lines plus Noise)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER Parametric"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SSC (SinuSoidal Coding)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "PS (Parametric Stereo)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1e

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "MPEG Surround"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x1f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "(Escape value)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Layer-1"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x21

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Layer-2"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x22

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "Layer-3"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x23

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "DST (Direct Stream Transfer)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x24

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ALS (Audio Lossless)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x25

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SLS (Scalable LosslesS)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x26

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SLS non-core"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x27

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "ER AAC ELD (Enhanced Low Delay)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x28

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SMR (Symbolic Music Representation) Simple"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x29

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SMR Main"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x2a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "USAC (Unified Speech and Audio Coding) (no SBR)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x2b

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "SAOC (Spatial Audio Object Coding)"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x2c

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "LD MPEG Surround"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->audioObjectTypes:Ljava/util/Map;

    const/16 v1, 0x2d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "USAC"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    .line 102
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const v1, 0x17700

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const v1, 0x15888

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const v1, 0xfa00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const v1, 0xbb80

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const v1, 0xac44

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x7d00

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x5dc0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x5622

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x3e80

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x2ee0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x2b11

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x1f40

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x17700

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0x15888

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0xfa00

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0xbb80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const v2, 0xac44

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x7d00

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x5dc0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x5622

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x3e80

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x2ee0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0xa

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x2b11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    sget-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    const/16 v1, 0xb

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v2, 0x1f40

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V
    .locals 1
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 149
    const-string v0, "eng"

    invoke-direct {p0, p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V

    .line 150
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;Ljava/lang/String;)V
    .locals 30
    .param p1, "dataSource"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .param p2, "lang"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/AbstractTrack;-><init>(Ljava/lang/String;)V

    .line 128
    new-instance v24, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    invoke-direct/range {v24 .. v24}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    .line 139
    const-string v24, "eng"

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->lang:Ljava/lang/String;

    .line 153
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->lang:Ljava/lang/String;

    .line 154
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    .line 155
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    .line 156
    invoke-direct/range {p0 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    .line 158
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleRate:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-double v0, v0

    move-wide/from16 v24, v0

    const-wide/high16 v26, 0x4090000000000000L    # 1024.0

    div-double v18, v24, v26

    .line 159
    .local v18, "packetsPerSecond":D
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    int-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v16, v24, v18

    .line 161
    .local v16, "duration":D
    const-wide/16 v12, 0x0

    .line 162
    .local v12, "dataSize":J
    new-instance v20, Ljava/util/LinkedList;

    invoke-direct/range {v20 .. v20}, Ljava/util/LinkedList;-><init>()V

    .line 163
    .local v20, "queue":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v24

    :cond_0
    :goto_0
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_3

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 164
    .local v21, "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    invoke-interface/range {v21 .. v21}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v26

    move-wide/from16 v0, v26

    long-to-int v0, v0

    move/from16 v22, v0

    .line 165
    .local v22, "size":I
    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v26, v0

    add-long v12, v12, v26

    .line 166
    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    move-object/from16 v0, v20

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 167
    :goto_1
    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->size()I

    move-result v25

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v26, v0

    cmpl-double v25, v26, v18

    if-lez v25, :cond_1

    .line 168
    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->pop()Ljava/lang/Object;

    goto :goto_1

    .line 170
    :cond_1
    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->size()I

    move-result v25

    move-wide/from16 v0, v18

    double-to-int v0, v0

    move/from16 v26, v0

    move/from16 v0, v25

    move/from16 v1, v26

    if-ne v0, v1, :cond_0

    .line 171
    const/4 v7, 0x0

    .line 172
    .local v7, "currSize":I
    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v25

    :goto_2
    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->hasNext()Z

    move-result v26

    if-eqz v26, :cond_2

    invoke-interface/range {v25 .. v25}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 173
    .local v4, "aQueue":Ljava/lang/Integer;
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v26

    add-int v7, v7, v26

    .line 174
    goto :goto_2

    .line 175
    .end local v4    # "aQueue":Ljava/lang/Integer;
    :cond_2
    const-wide/high16 v26, 0x4020000000000000L    # 8.0

    int-to-double v0, v7

    move-wide/from16 v28, v0

    mul-double v26, v26, v28

    invoke-virtual/range {v20 .. v20}, Ljava/util/LinkedList;->size()I

    move-result v25

    move/from16 v0, v25

    int-to-double v0, v0

    move-wide/from16 v28, v0

    div-double v26, v26, v28

    mul-double v8, v26, v18

    .line 176
    .local v8, "currBitrate":D
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->maxBitRate:J

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    long-to-double v0, v0

    move-wide/from16 v26, v0

    cmpl-double v25, v8, v26

    if-lez v25, :cond_0

    .line 177
    double-to-int v0, v8

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->maxBitRate:J

    goto/16 :goto_0

    .line 182
    .end local v7    # "currSize":I
    .end local v8    # "currBitrate":D
    .end local v21    # "sample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .end local v22    # "size":I
    :cond_3
    const-wide/16 v24, 0x8

    mul-long v24, v24, v12

    move-wide/from16 v0, v24

    long-to-double v0, v0

    move-wide/from16 v24, v0

    div-double v24, v24, v16

    move-wide/from16 v0, v24

    double-to-int v0, v0

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    move-object/from16 v2, p0

    iput-wide v0, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->avgBitRate:J

    .line 184
    const/16 v24, 0x600

    move/from16 v0, v24

    move-object/from16 v1, p0

    iput v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->bufferSizeDB:I

    .line 186
    new-instance v24, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-direct/range {v24 .. v24}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 187
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    const-string v24, "mp4a"

    move-object/from16 v0, v24

    invoke-direct {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;-><init>(Ljava/lang/String;)V

    .line 188
    .local v5, "audioSampleEntry":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->channelconfig:I

    move/from16 v24, v0

    const/16 v25, 0x7

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_4

    .line 189
    const/16 v24, 0x8

    move/from16 v0, v24

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    .line 193
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleRate:I

    move/from16 v24, v0

    move/from16 v0, v24

    int-to-long v0, v0

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v5, v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleRate(J)V

    .line 194
    const/16 v24, 0x1

    move/from16 v0, v24

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setDataReferenceIndex(I)V

    .line 195
    const/16 v24, 0x10

    move/from16 v0, v24

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setSampleSize(I)V

    .line 198
    new-instance v15, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    invoke-direct {v15}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;-><init>()V

    .line 199
    .local v15, "esds":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    new-instance v14, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    invoke-direct {v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;-><init>()V

    .line 200
    .local v14, "descriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-virtual {v14, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setEsId(I)V

    .line 202
    new-instance v23, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;

    invoke-direct/range {v23 .. v23}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;-><init>()V

    .line 203
    .local v23, "slConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;
    const/16 v24, 0x2

    invoke-virtual/range {v23 .. v24}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;->setPredefined(I)V

    .line 204
    move-object/from16 v0, v23

    invoke-virtual {v14, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setSlConfigDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;)V

    .line 206
    new-instance v11, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;

    invoke-direct {v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;-><init>()V

    .line 207
    .local v11, "decoderConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    const/16 v24, 0x40

    move/from16 v0, v24

    invoke-virtual {v11, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setObjectTypeIndication(I)V

    .line 208
    const/16 v24, 0x5

    move/from16 v0, v24

    invoke-virtual {v11, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setStreamType(I)V

    .line 209
    move-object/from16 v0, p0

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->bufferSizeDB:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-virtual {v11, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setBufferSizeDB(I)V

    .line 210
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->maxBitRate:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v11, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setMaxBitRate(J)V

    .line 211
    move-object/from16 v0, p0

    iget-wide v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->avgBitRate:J

    move-wide/from16 v24, v0

    move-wide/from16 v0, v24

    invoke-virtual {v11, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setAvgBitRate(J)V

    .line 213
    new-instance v6, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;-><init>()V

    .line 214
    .local v6, "audioSpecificConfig":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;
    const/16 v24, 0x2

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;->setAudioObjectType(I)V

    .line 215
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleFrequencyIndex:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;->setSamplingFrequencyIndex(I)V

    .line 216
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->channelconfig:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-virtual {v6, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;->setChannelConfiguration(I)V

    .line 217
    invoke-virtual {v11, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;->setAudioSpecificInfo(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;)V

    .line 219
    invoke-virtual {v14, v11}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->setDecoderConfigDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;)V

    .line 221
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;->serialize()Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 222
    .local v10, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v15, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setEsDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;)V

    .line 223
    invoke-virtual {v15, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->setData(Ljava/nio/ByteBuffer;)V

    .line 224
    invoke-virtual {v5, v15}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    invoke-virtual {v0, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 227
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v24, v0

    new-instance v25, Ljava/util/Date;

    invoke-direct/range {v25 .. v25}, Ljava/util/Date;-><init>()V

    invoke-virtual/range {v24 .. v25}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setCreationTime(Ljava/util/Date;)V

    .line 228
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v24, v0

    new-instance v25, Ljava/util/Date;

    invoke-direct/range {v25 .. v25}, Ljava/util/Date;-><init>()V

    invoke-virtual/range {v24 .. v25}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setModificationTime(Ljava/util/Date;)V

    .line 229
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setLanguage(Ljava/lang/String;)V

    .line 230
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v24, v0

    const/high16 v25, 0x3f800000    # 1.0f

    invoke-virtual/range {v24 .. v25}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setVolume(F)V

    .line 231
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-object/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleRate:I

    move/from16 v25, v0

    move/from16 v0, v25

    int-to-long v0, v0

    move-wide/from16 v26, v0

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;->setTimescale(J)V

    .line 232
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v24, v0

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->size()I

    move-result v24

    move/from16 v0, v24

    new-array v0, v0, [J

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->decTimes:[J

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->decTimes:[J

    move-object/from16 v24, v0

    const-wide/16 v26, 0x400

    move-object/from16 v0, v24

    move-wide/from16 v1, v26

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->fill([JJ)V

    .line 234
    return-void

    .line 191
    .end local v6    # "audioSpecificConfig":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/AudioSpecificConfig;
    .end local v10    # "data":Ljava/nio/ByteBuffer;
    .end local v11    # "decoderConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/DecoderConfigDescriptor;
    .end local v14    # "descriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .end local v15    # "esds":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    .end local v23    # "slConfigDescriptor":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/SLConfigDescriptor;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    iget v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->channelconfig:I

    move/from16 v24, v0

    move/from16 v0, v24

    invoke-virtual {v5, v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setChannelCount(I)V

    goto/16 :goto_3
.end method

.method static synthetic access$000(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;

    .prologue
    .line 47
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    return-object v0
.end method

.method private readADTSHeader(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    .locals 9
    .param p1, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x7

    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 296
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    invoke-direct {v2, p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;)V

    .line 297
    .local v2, "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 298
    .local v0, "bb":Ljava/nio/ByteBuffer;
    :cond_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v4

    if-ge v4, v8, :cond_2

    .line 299
    invoke-interface {p1, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 300
    const/4 v2, 0x0

    .line 332
    .end local v2    # "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    :cond_1
    :goto_0
    return-object v2

    .line 304
    .restart local v2    # "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    :cond_2
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v4

    check-cast v4, Ljava/nio/ByteBuffer;

    invoke-direct {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;-><init>(Ljava/nio/ByteBuffer;)V

    .line 305
    .local v1, "brb":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;
    const/16 v4, 0xc

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v3

    .line 306
    .local v3, "syncword":I
    const/16 v4, 0xfff

    if-eq v3, v4, :cond_3

    .line 307
    new-instance v4, Ljava/io/IOException;

    const-string v5, "Expected Start Word 0xfff"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 309
    :cond_3
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->mpegVersion:I

    .line 310
    invoke-virtual {v1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->layer:I

    .line 311
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->protectionAbsent:I

    .line 312
    invoke-virtual {v1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->profile:I

    .line 314
    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleFrequencyIndex:I

    .line 315
    sget-object v4, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samplingFrequencyIndexMap:Ljava/util/Map;

    iget v5, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleFrequencyIndex:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleRate:I

    .line 316
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    .line 317
    const/4 v4, 0x3

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->channelconfig:I

    .line 318
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->original:I

    .line 319
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->home:I

    .line 320
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->copyrightedStream:I

    .line 321
    invoke-virtual {v1, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->copyrightStart:I

    .line 322
    const/16 v4, 0xd

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->frameLength:I

    .line 324
    const/16 v4, 0xb

    invoke-virtual {v1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->bufferFullness:I

    .line 325
    invoke-virtual {v1, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BitReaderBuffer;->readBits(I)I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    iput v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->numAacFramesPerAdtsFrame:I

    .line 326
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->numAacFramesPerAdtsFrame:I

    if-eq v4, v6, :cond_4

    .line 327
    new-instance v4, Ljava/io/IOException;

    const-string v5, "This muxer can only work with 1 AAC frame per ADTS frame"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 329
    :cond_4
    iget v4, v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->protectionAbsent:I

    if-nez v4, :cond_1

    .line 330
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {p1, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->read(Ljava/nio/ByteBuffer;)I

    goto/16 :goto_0
.end method

.method private readSamples(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    .locals 10
    .param p1, "channel"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    const/4 v6, 0x0

    .line 339
    .local v6, "first":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    :goto_0
    invoke-direct {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->readADTSHeader(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    move-result-object v7

    .local v7, "hdr":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;
    if-eqz v7, :cond_1

    .line 340
    if-nez v6, :cond_0

    .line 341
    move-object v6, v7

    .line 344
    :cond_0
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v2

    .line 345
    .local v2, "currentPosition":J
    iget v0, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->frameLength:I

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->getSize()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-long v4, v0

    .line 346
    .local v4, "frameSize":J
    iget-object v8, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;JJ)V

    invoke-interface {v8, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    invoke-interface {p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position()J

    move-result-wide v0

    iget v8, v7, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->frameLength:I

    int-to-long v8, v8

    add-long/2addr v0, v8

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->getSize()I

    move-result v8

    int-to-long v8, v8

    sub-long/2addr v0, v8

    invoke-interface {p1, v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->position(J)V

    goto :goto_0

    .line 365
    .end local v2    # "currentPosition":J
    .end local v4    # "frameSize":J
    :cond_1
    return-object v6
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
    .line 143
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->dataSource:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;->close()V

    .line 144
    return-void
.end method

.method public getCompositionTimeEntries()Ljava/util/List;
    .locals 1
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
    .line 245
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 261
    const-string v0, "soun"

    return-object v0
.end method

.method public getSampleDependencies()Ljava/util/List;
    .locals 1
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
    .line 253
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->sampleDescriptionBox:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    return-object v0
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->decTimes:[J

    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 1
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
    .line 265
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->samples:Ljava/util/List;

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 269
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 249
    const/4 v0, 0x0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->trackMetaData:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    return-object v0
.end method

.method public setDecodeTimes([J)V
    .locals 0
    .param p1, "decodeTimes"    # [J

    .prologue
    .line 146
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->decTimes:[J

    .line 147
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 370
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AACTrackImpl{sampleRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    iget v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->sampleRate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", channelconfig="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl;->firstHeader:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;

    iget v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/AACTrackImpl$AdtsHeader;->channelconfig:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
