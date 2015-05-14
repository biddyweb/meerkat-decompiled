.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;
.super Ljava/util/AbstractList;
.source "CencEncryptingSampleList.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList",
        "<",
        "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
        ">;"
    }
.end annotation


# instance fields
.field auxiliaryDataFormats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation
.end field

.field ceks:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
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

.field cipher:Ljavax/crypto/Cipher;

.field private final encryptionAlgo:Ljava/lang/String;

.field parent:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V
    .locals 3
    .param p4, "encryptionAlgo"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljavax/crypto/SecretKey;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "ceks":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap<Ljava/lang/Integer;Ljavax/crypto/SecretKey;>;"
    .local p2, "parent":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    .local p3, "auxiliaryDataFormats":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    .line 36
    new-instance v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-direct {v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;-><init>()V

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->ceks:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .line 51
    iput-object p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->auxiliaryDataFormats:Ljava/util/List;

    .line 52
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->ceks:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .line 53
    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->parent:Ljava/util/List;

    .line 56
    :try_start_0
    const-string v1, "cenc"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    const-string v1, "AES/CTR/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->cipher:Ljavax/crypto/Cipher;

    .line 68
    :goto_0
    return-void

    .line 58
    :cond_0
    const-string v1, "cbc1"

    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 59
    const-string v1, "AES/CBC/NoPadding"

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->cipher:Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 61
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Only cenc & cbc1 is supported as encryptionAlgo"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 65
    :catch_1
    move-exception v0

    .line 66
    .local v0, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Ljavax/crypto/SecretKey;Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .param p1, "defaultCek"    # Ljavax/crypto/SecretKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/crypto/SecretKey;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p2, "parent":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;>;"
    .local p3, "auxiliaryDataFormats":Ljava/util/List;, "Ljava/util/List<Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;>;"
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;-><init>(Ljava/lang/Comparable;Ljava/lang/Object;)V

    const-string v1, "cenc"

    invoke-direct {p0, v0, p2, p3, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;Ljava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method static synthetic access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    .prologue
    .line 31
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 72
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->parent:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 73
    .local v2, "clearSample":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->ceks:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->auxiliaryDataFormats:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 75
    .local v3, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    new-instance v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;

    iget-object v4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->cipher:Ljavax/crypto/Cipher;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->ceks:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljavax/crypto/SecretKey;

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Ljavax/crypto/Cipher;Ljavax/crypto/SecretKey;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$1;)V

    .line 77
    .end local v3    # "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    :goto_0
    return-object v0

    :cond_0
    move-object v0, v2

    goto :goto_0
.end method

.method public bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->get(I)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    move-result-object v0

    return-object v0
.end method

.method protected initCipher([BLjavax/crypto/SecretKey;)V
    .locals 5
    .param p1, "iv"    # [B
    .param p2, "cek"    # Ljavax/crypto/SecretKey;

    .prologue
    .line 84
    const/16 v2, 0x10

    :try_start_0
    new-array v1, v2, [B

    .line 85
    .local v1, "fullIv":[B
    const/4 v2, 0x0

    const/4 v3, 0x0

    array-length v4, p1

    invoke-static {p1, v2, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 87
    iget-object v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->cipher:Ljavax/crypto/Cipher;

    const/4 v3, 0x1

    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v4, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {v2, v3, p2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_1

    .line 93
    return-void

    .line 88
    .end local v1    # "fullIv":[B
    :catch_0
    move-exception v0

    .line 89
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 90
    .end local v0    # "e":Ljava/security/InvalidAlgorithmParameterException;
    :catch_1
    move-exception v0

    .line 91
    .local v0, "e":Ljava/security/InvalidKeyException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public size()I
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->parent:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
