.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;
.super Ljava/lang/Object;
.source "CencEncryptingTrackImpl.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;


# instance fields
.field cencSampleAuxiliaryData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation
.end field

.field defaultKeyId:Ljava/util/UUID;

.field dummyIvs:Z

.field private final encryptionAlgo:Ljava/lang/String;

.field indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljavax/crypto/SecretKey;",
            ">;"
        }
    .end annotation
.end field

.field keys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljavax/crypto/SecretKey;",
            ">;"
        }
    .end annotation
.end field

.field sampleGroups:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;"
        }
    .end annotation
.end field

.field samples:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field

.field source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

.field stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

.field subSampleEncryption:Z


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/UUID;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Z)V
    .locals 8
    .param p1, "source"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "defaultKeyId"    # Ljava/util/UUID;
    .param p5, "encryptionAlgo"    # Ljava/lang/String;
    .param p6, "dummyIvs"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Ljava/util/UUID;",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljavax/crypto/SecretKey;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;",
            "[J>;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p3, "keys":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;Ljavax/crypto/SecretKey;>;"
    .local p4, "keyRotation":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;[J>;"
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/UUID;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;ZZ)V

    .line 78
    return-void
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/UUID;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;ZZ)V
    .locals 38
    .param p1, "source"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "defaultKeyId"    # Ljava/util/UUID;
    .param p5, "encryptionAlgo"    # Ljava/lang/String;
    .param p6, "dummyIvs"    # Z
    .param p7, "encryptButAllClear"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;",
            "Ljava/util/UUID;",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljavax/crypto/SecretKey;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;",
            "[J>;",
            "Ljava/lang/String;",
            "ZZ)V"
        }
    .end annotation

    .prologue
    .line 93
    .local p3, "keys":Ljava/util/Map;, "Ljava/util/Map<Ljava/util/UUID;Ljavax/crypto/SecretKey;>;"
    .local p4, "keyRotation":Ljava/util/Map;, "Ljava/util/Map<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;[J>;"
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v32, Ljava/util/HashMap;

    invoke-direct/range {v32 .. v32}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->keys:Ljava/util/Map;

    .line 60
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->dummyIvs:Z

    .line 61
    const/16 v32, 0x0

    move/from16 v0, v32

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->subSampleEncryption:Z

    .line 62
    const/16 v32, 0x0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    .line 94
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    .line 95
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->keys:Ljava/util/Map;

    .line 96
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;

    .line 97
    move/from16 v0, p6

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->dummyIvs:Z

    .line 98
    move-object/from16 v0, p5

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->encryptionAlgo:Ljava/lang/String;

    .line 99
    new-instance v32, Ljava/util/HashMap;

    invoke-direct/range {v32 .. v32}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    .line 100
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleGroups()Ljava/util/Map;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :cond_0
    :goto_0
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_1

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 101
    .local v11, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v33

    move-object/from16 v0, v33

    instance-of v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;

    move/from16 v33, v0

    if-nez v33, :cond_0

    .line 102
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    move-object/from16 v33, v0

    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v34

    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v35

    invoke-interface/range {v33 .. v35}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 105
    .end local v11    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;[J>;"
    :cond_1
    if-eqz p4, :cond_2

    .line 106
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :goto_1
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_2

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 107
    .local v10, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;[J>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    move-object/from16 v33, v0

    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v34

    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v35

    invoke-interface/range {v33 .. v35}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 110
    .end local v10    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;[J>;"
    :cond_2
    new-instance v32, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl$1;

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    move-object/from16 v33, v0

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl$1;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;Ljava/util/Map;)V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    .line 121
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->samples:Ljava/util/List;

    .line 122
    new-instance v32, Ljava/util/ArrayList;

    invoke-direct/range {v32 .. v32}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->cencSampleAuxiliaryData:Ljava/util/List;

    .line 124
    new-instance v25, Ljava/math/BigInteger;

    const-string v32, "1"

    move-object/from16 v0, v25

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 125
    .local v25, "one":Ljava/math/BigInteger;
    const/16 v32, 0x8

    move/from16 v0, v32

    new-array v0, v0, [B

    move-object/from16 v17, v0

    fill-array-data v17, :array_0

    .line 127
    .local v17, "init":[B
    if-nez p6, :cond_3

    .line 128
    new-instance v28, Ljava/security/SecureRandom;

    invoke-direct/range {v28 .. v28}, Ljava/security/SecureRandom;-><init>()V

    .line 129
    .local v28, "random":Ljava/util/Random;
    move-object/from16 v0, v28

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 131
    .end local v28    # "random":Ljava/util/Random;
    :cond_3
    new-instance v19, Ljava/math/BigInteger;

    const/16 v32, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v32

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 133
    .local v19, "ivInt":Ljava/math/BigInteger;
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v12, "groupEntries":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;>;"
    if-eqz p4, :cond_4

    .line 136
    invoke-interface/range {p4 .. p4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-interface {v12, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 138
    :cond_4
    new-instance v32, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-direct/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;-><init>()V

    move-object/from16 v0, v32

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .line 139
    const/16 v21, -0x1

    .line 140
    .local v21, "lastSampleGroupDescriptionIndex":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_2
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v32

    invoke-interface/range {v32 .. v32}, Ljava/util/List;->size()I

    move-result v32

    move/from16 v0, v32

    if-ge v15, v0, :cond_b

    .line 141
    const/16 v16, 0x0

    .line 142
    .local v16, "index":I
    const/16 v20, 0x0

    .local v20, "j":I
    :goto_3
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v32

    move/from16 v0, v20

    move/from16 v1, v32

    if-ge v0, v1, :cond_6

    .line 143
    move/from16 v0, v20

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;

    .line 144
    .local v13, "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    invoke-virtual/range {p0 .. p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->getSampleGroups()Ljava/util/Map;

    move-result-object v32

    move-object/from16 v0, v32

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    check-cast v30, [J

    .line 145
    .local v30, "sampleNums":[J
    int-to-long v0, v15

    move-wide/from16 v32, v0

    move-object/from16 v0, v30

    move-wide/from16 v1, v32

    invoke-static {v0, v1, v2}, Ljava/util/Arrays;->binarySearch([JJ)I

    move-result v32

    if-ltz v32, :cond_5

    .line 146
    add-int/lit8 v16, v20, 0x1

    .line 142
    :cond_5
    add-int/lit8 v20, v20, 0x1

    goto :goto_3

    .line 149
    .end local v13    # "groupEntry":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;
    .end local v30    # "sampleNums":[J
    :cond_6
    move/from16 v0, v21

    move/from16 v1, v16

    if-eq v0, v1, :cond_7

    .line 150
    if-nez v16, :cond_8

    .line 151
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    move-object/from16 v32, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, p3

    move-object/from16 v1, p2

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v34

    invoke-virtual/range {v32 .. v34}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    :goto_4
    move/from16 v21, v16

    .line 140
    :cond_7
    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    .line 153
    :cond_8
    add-int/lit8 v32, v16, -0x1

    move/from16 v0, v32

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;

    invoke-virtual/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;->getKid()Ljava/util/UUID;

    move-result-object v32

    if-eqz v32, :cond_a

    .line 154
    add-int/lit8 v32, v16, -0x1

    move/from16 v0, v32

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;

    invoke-virtual/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;->getKid()Ljava/util/UUID;

    move-result-object v32

    move-object/from16 v0, p3

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljavax/crypto/SecretKey;

    .line 155
    .local v31, "sk":Ljavax/crypto/SecretKey;
    if-nez v31, :cond_9

    .line 156
    new-instance v33, Ljava/lang/RuntimeException;

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v34, "Key "

    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    add-int/lit8 v32, v16, -0x1

    move/from16 v0, v32

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;

    invoke-virtual/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/CencSampleEncryptionInformationGroupEntry;->getKid()Ljava/util/UUID;

    move-result-object v32

    move-object/from16 v0, v34

    move-object/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v34, " was not supplied for decryption"

    move-object/from16 v0, v32

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, v33

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v33

    .line 158
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    move-object/from16 v32, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v32

    move-object/from16 v1, v33

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 160
    .end local v31    # "sk":Ljavax/crypto/SecretKey;
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    move-object/from16 v32, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    const/16 v34, 0x0

    invoke-virtual/range {v32 .. v34}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->put(Ljava/lang/Comparable;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    .line 170
    .end local v16    # "index":I
    .end local v20    # "j":I
    :cond_b
    invoke-interface/range {p1 .. p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;->getBoxes()Ljava/util/List;

    move-result-object v6

    .line 171
    .local v6, "boxes":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;>;"
    const/16 v24, -0x1

    .line 172
    .local v24, "nalLengthSize":I
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v32

    :cond_c
    :goto_5
    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->hasNext()Z

    move-result v33

    if-eqz v33, :cond_e

    invoke-interface/range {v32 .. v32}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;

    .line 173
    .local v5, "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    instance-of v0, v5, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    move/from16 v33, v0

    if-eqz v33, :cond_d

    move-object v4, v5

    .line 174
    check-cast v4, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;

    .line 175
    .local v4, "avcC":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;
    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->subSampleEncryption:Z

    .line 176
    invoke-virtual {v4}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;->getLengthSizeMinusOne()I

    move-result v33

    add-int/lit8 v24, v33, 0x1

    .line 178
    .end local v4    # "avcC":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/AvcConfigurationBox;
    :cond_d
    instance-of v0, v5, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;

    move/from16 v33, v0

    if-eqz v33, :cond_c

    move-object v14, v5

    .line 179
    check-cast v14, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;

    .line 180
    .local v14, "hvcC":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;
    const/16 v33, 0x1

    move/from16 v0, v33

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->subSampleEncryption:Z

    .line 181
    invoke-virtual {v14}, Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;->getLengthSizeMinusOne()I

    move-result v33

    add-int/lit8 v24, v33, 0x1

    goto :goto_5

    .line 186
    .end local v5    # "box":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;
    .end local v14    # "hvcC":Lco/getair/meerkat/video/broadcast/mp4parser/iso14496/part15/HevcConfigurationBox;
    :cond_e
    const/4 v15, 0x0

    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v32, v0

    invoke-interface/range {v32 .. v32}, Ljava/util/List;->size()I

    move-result v32

    move/from16 v0, v32

    if-ge v15, v0, :cond_17

    .line 187
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->samples:Ljava/util/List;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 188
    .local v26, "origSample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    new-instance v8, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    invoke-direct {v8}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;-><init>()V

    .line 189
    .local v8, "e":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->cencSampleAuxiliaryData:Ljava/util/List;

    move-object/from16 v32, v0

    move-object/from16 v0, v32

    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    move-object/from16 v32, v0

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    invoke-virtual/range {v32 .. v33}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    if-eqz v32, :cond_10

    .line 191
    invoke-virtual/range {v19 .. v19}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v18

    .line 192
    .local v18, "iv":[B
    const/16 v32, 0x8

    move/from16 v0, v32

    new-array v9, v0, [B

    fill-array-data v9, :array_1

    .line 193
    .local v9, "eightByteIv":[B
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v32, v0

    add-int/lit8 v32, v32, -0x8

    if-lez v32, :cond_11

    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v32, v0

    add-int/lit8 v32, v32, -0x8

    :goto_7
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v33, v0

    rsub-int/lit8 v33, v33, 0x8

    if-gez v33, :cond_12

    const/16 v33, 0x0

    :goto_8
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v34, v0

    const/16 v35, 0x8

    move/from16 v0, v34

    move/from16 v1, v35

    if-le v0, v1, :cond_13

    const/16 v34, 0x8

    :goto_9
    move-object/from16 v0, v18

    move/from16 v1, v32

    move/from16 v2, v33

    move/from16 v3, v34

    invoke-static {v0, v1, v9, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 200
    iput-object v9, v8, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    .line 202
    invoke-interface/range {v26 .. v26}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v29

    check-cast v29, Ljava/nio/ByteBuffer;

    .line 205
    .local v29, "sample":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->subSampleEncryption:Z

    move/from16 v32, v0

    if-eqz v32, :cond_f

    .line 206
    if-eqz p7, :cond_14

    .line 207
    const/16 v32, 0x1

    move/from16 v0, v32

    new-array v0, v0, [Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-object/from16 v32, v0

    const/16 v33, 0x0

    invoke-virtual/range {v29 .. v29}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v34

    const-wide/16 v36, 0x0

    move/from16 v0, v34

    move-wide/from16 v1, v36

    invoke-virtual {v8, v0, v1, v2}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->createPair(IJ)Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-result-object v34

    aput-object v34, v32, v33

    move-object/from16 v0, v32

    iput-object v0, v8, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    .line 226
    :cond_f
    :goto_a
    move-object/from16 v0, v19

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v19

    .line 186
    .end local v9    # "eightByteIv":[B
    .end local v18    # "iv":[B
    .end local v29    # "sample":Ljava/nio/ByteBuffer;
    :cond_10
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_6

    .line 193
    .restart local v9    # "eightByteIv":[B
    .restart local v18    # "iv":[B
    :cond_11
    const/16 v32, 0x0

    goto :goto_7

    :cond_12
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v33, v0

    rsub-int/lit8 v33, v33, 0x8

    goto :goto_8

    :cond_13
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v34, v0

    goto :goto_9

    .line 209
    .restart local v29    # "sample":Ljava/nio/ByteBuffer;
    :cond_14
    new-instance v27, Ljava/util/ArrayList;

    const/16 v32, 0x5

    move-object/from16 v0, v27

    move/from16 v1, v32

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 210
    .local v27, "pairs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;>;"
    :goto_b
    invoke-virtual/range {v29 .. v29}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v32

    if-lez v32, :cond_16

    .line 211
    move-object/from16 v0, v29

    move/from16 v1, v24

    invoke-static {v0, v1}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoTypeReaderVariable;->read(Ljava/nio/ByteBuffer;I)J

    move-result-wide v32

    invoke-static/range {v32 .. v33}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v23

    .line 213
    .local v23, "nalLength":I
    add-int v22, v23, v24

    .line 214
    .local v22, "nalGrossSize":I
    const/16 v32, 0x70

    move/from16 v0, v22

    move/from16 v1, v32

    if-lt v0, v1, :cond_15

    .line 215
    rem-int/lit8 v32, v22, 0x10

    add-int/lit8 v7, v32, 0x60

    .line 219
    .local v7, "clearBytes":I
    :goto_c
    sub-int v32, v22, v7

    move/from16 v0, v32

    int-to-long v0, v0

    move-wide/from16 v32, v0

    move-wide/from16 v0, v32

    invoke-virtual {v8, v7, v0, v1}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->createPair(IJ)Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-result-object v32

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    invoke-virtual/range {v29 .. v29}, Ljava/nio/ByteBuffer;->position()I

    move-result v32

    add-int v32, v32, v23

    move-object/from16 v0, v29

    move/from16 v1, v32

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_b

    .line 217
    .end local v7    # "clearBytes":I
    :cond_15
    move/from16 v7, v22

    .restart local v7    # "clearBytes":I
    goto :goto_c

    .line 222
    .end local v7    # "clearBytes":I
    .end local v22    # "nalGrossSize":I
    .end local v23    # "nalLength":I
    :cond_16
    invoke-interface/range {v27 .. v27}, Ljava/util/List;->size()I

    move-result v32

    move/from16 v0, v32

    new-array v0, v0, [Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-object/from16 v32, v0

    move-object/from16 v0, v27

    move-object/from16 v1, v32

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v32

    check-cast v32, [Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    move-object/from16 v0, v32

    iput-object v0, v8, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    goto/16 :goto_a

    .line 230
    .end local v8    # "e":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .end local v9    # "eightByteIv":[B
    .end local v18    # "iv":[B
    .end local v26    # "origSample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .end local v27    # "pairs":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;>;"
    .end local v29    # "sample":Ljava/nio/ByteBuffer;
    :cond_17
    sget-object v32, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string v33, ""

    invoke-virtual/range {v32 .. v33}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 231
    return-void

    .line 125
    nop

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data

    .line 192
    :array_1
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/UUID;Ljavax/crypto/SecretKey;Z)V
    .locals 7
    .param p1, "source"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;
    .param p2, "defaultKeyId"    # Ljava/util/UUID;
    .param p3, "key"    # Ljavax/crypto/SecretKey;
    .param p4, "dummyIvs"    # Z

    .prologue
    .line 68
    invoke-static {p2, p3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "cenc"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;Ljava/util/UUID;Ljava/util/Map;Ljava/util/Map;Ljava/lang/String;Z)V

    .line 71
    return-void
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
    .line 325
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->close()V

    .line 326
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
    .line 297
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getCompositionTimeEntries()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDefaultKeyId()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;

    return-object v0
.end method

.method public getDuration()J
    .locals 2

    .prologue
    .line 293
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getDuration()J

    move-result-wide v0

    return-wide v0
.end method

.method public getEdits()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Edit;",
            ">;"
        }
    .end annotation

    .prologue
    .line 333
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getEdits()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHandler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getHandler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 329
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "enc("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

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
    .line 305
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDependencies()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    .locals 12

    .prologue
    const/4 v8, 0x0

    .line 246
    monitor-enter p0

    :try_start_0
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    if-nez v7, :cond_0

    .line 247
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_1
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDescriptionBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    move-result-object v7

    invoke-static {v0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/OutputStream;)Ljava/nio/channels/WritableByteChannel;

    move-result-object v9

    invoke-virtual {v7, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getBox(Ljava/nio/channels/WritableByteChannel;)V

    .line 250
    new-instance v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;

    new-instance v9, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    invoke-direct {v9, v10}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/MemoryDataSourceImpl;-><init>([B)V

    invoke-direct {v7, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/DataSource;)V

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/IsoFile;->getBoxes()Ljava/util/List;

    move-result-object v7

    const/4 v9, 0x0

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    iput-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 256
    :try_start_2
    new-instance v2, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;

    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;-><init>()V

    .line 257
    .local v2, "originalFormatBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;->getType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;->setDataFormat(Ljava/lang/String;)V

    .line 259
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    instance-of v7, v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    if-eqz v7, :cond_1

    .line 260
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;

    const-string v9, "enca"

    invoke-virtual {v7, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AudioSampleEntry;->setType(Ljava/lang/String;)V

    .line 266
    :goto_0
    new-instance v5, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;

    invoke-direct {v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;-><init>()V

    .line 267
    .local v5, "sinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;
    invoke-virtual {v5, v2}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 269
    new-instance v4, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;

    invoke-direct {v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;-><init>()V

    .line 270
    .local v4, "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->encryptionAlgo:Ljava/lang/String;

    invoke-virtual {v4, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->setSchemeType(Ljava/lang/String;)V

    .line 271
    const/high16 v7, 0x10000

    invoke-virtual {v4, v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;->setSchemeVersion(I)V

    .line 272
    invoke-virtual {v5, v4}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 274
    new-instance v3, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;

    invoke-direct {v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;-><init>()V

    .line 275
    .local v3, "schi":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;
    new-instance v6, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;

    invoke-direct {v6}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;-><init>()V

    .line 276
    .local v6, "trackEncryptionBox":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;

    if-nez v7, :cond_3

    move v7, v8

    :goto_1
    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;->setDefaultIvSize(I)V

    .line 277
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;

    if-nez v7, :cond_4

    move v7, v8

    :goto_2
    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;->setDefaultAlgorithmId(I)V

    .line 278
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;

    if-nez v7, :cond_5

    new-instance v7, Ljava/util/UUID;

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    invoke-direct {v7, v8, v9, v10, v11}, Ljava/util/UUID;-><init>(JJ)V

    :goto_3
    invoke-virtual {v6, v7}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;->setDefault_KID(Ljava/util/UUID;)V

    .line 279
    invoke-virtual {v3, v6}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 281
    invoke-virtual {v5, v3}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 282
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    invoke-virtual {v7, v5}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;->addBox(Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/Box;)V

    .line 284
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v2    # "originalFormatBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
    .end local v3    # "schi":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;
    .end local v4    # "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    .end local v5    # "sinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;
    .end local v6    # "trackEncryptionBox":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;
    :cond_0
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v7

    .line 251
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    :catch_0
    move-exception v1

    .line 252
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    new-instance v7, Ljava/lang/RuntimeException;

    const-string v8, "Dumping stsd to memory failed"

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 246
    .end local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 261
    .restart local v0    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v2    # "originalFormatBox":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/OriginalFormatBox;
    :cond_1
    :try_start_4
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    instance-of v7, v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    if-eqz v7, :cond_2

    .line 262
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v7}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v7

    check-cast v7, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;

    const-string v9, "encv"

    invoke-virtual {v7, v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/VisualSampleEntry;->setType(Ljava/lang/String;)V

    goto :goto_0

    .line 264
    :cond_2
    new-instance v7, Ljava/lang/RuntimeException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "I don\'t know how to cenc "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->stsd:Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;

    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SampleDescriptionBox;->getSampleEntry()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;

    move-result-object v9

    invoke-virtual {v9}, Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/sampleentry/AbstractSampleEntry;->getType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 276
    .restart local v3    # "schi":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeInformationBox;
    .restart local v4    # "schm":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SchemeTypeBox;
    .restart local v5    # "sinf":Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/ProtectionSchemeInformationBox;
    .restart local v6    # "trackEncryptionBox":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/TrackEncryptionBox;
    :cond_3
    const/16 v7, 0x8

    goto :goto_1

    .line 277
    :cond_4
    const/4 v7, 0x1

    goto :goto_2

    .line 278
    :cond_5
    iget-object v7, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->defaultKeyId:Ljava/util/UUID;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_3
.end method

.method public getSampleDurations()[J
    .locals 1

    .prologue
    .line 289
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSampleDurations()[J

    move-result-object v0

    return-object v0
.end method

.method public getSampleEncryptionEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation

    .prologue
    .line 242
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->cencSampleAuxiliaryData:Ljava/util/List;

    return-object v0
.end method

.method public getSampleGroups()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/samplegrouping/GroupEntry;",
            "[J>;"
        }
    .end annotation

    .prologue
    .line 337
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->sampleGroups:Ljava/util/Map;

    return-object v0
.end method

.method public getSamples()Ljava/util/List;
    .locals 5
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
    .line 317
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->indexToKey:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSamples()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->cencSampleAuxiliaryData:Ljava/util/List;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->encryptionAlgo:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    return-object v0
.end method

.method public getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;
    .locals 1

    .prologue
    .line 321
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSubsampleInformationBox()Lco/getair/meerkat/video/broadcast/coremedia/iso/boxes/SubSampleInformationBox;

    move-result-object v0

    return-object v0
.end method

.method public getSyncSamples()[J
    .locals 1

    .prologue
    .line 301
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getSyncSamples()[J

    move-result-object v0

    return-object v0
.end method

.method public getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->source:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;->getTrackMetaData()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/TrackMetaData;

    move-result-object v0

    return-object v0
.end method

.method public hasSubSampleEncryption()Z
    .locals 1

    .prologue
    .line 238
    iget-boolean v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptingTrackImpl;->subSampleEncryption:Z

    return v0
.end method
