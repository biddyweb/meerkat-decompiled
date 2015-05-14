.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;
.super Ljava/lang/Object;
.source "CencEncryptingSampleList.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EncryptedSampleImpl"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final cek:Ljavax/crypto/SecretKey;

.field private final cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

.field private final cipher:Ljavax/crypto/Cipher;

.field private final clearSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    const-class v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Ljavax/crypto/Cipher;Ljavax/crypto/SecretKey;)V
    .locals 0
    .param p2, "clearSample"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .param p3, "cencSampleAuxiliaryDataFormat"    # Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .param p4, "cipher"    # Ljavax/crypto/Cipher;
    .param p5, "cek"    # Ljavax/crypto/SecretKey;

    .prologue
    .line 111
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->clearSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    .line 114
    iput-object p3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 115
    iput-object p4, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    .line 116
    iput-object p5, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cek:Ljavax/crypto/SecretKey;

    .line 117
    return-void
.end method

.method synthetic constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Ljavax/crypto/Cipher;Ljavax/crypto/SecretKey;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$1;)V
    .locals 0
    .param p1, "x0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;
    .param p2, "x1"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;
    .param p3, "x2"    # Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    .param p4, "x3"    # Ljavax/crypto/Cipher;
    .param p5, "x4"    # Ljavax/crypto/SecretKey;
    .param p6, "x5"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$1;

    .prologue
    .line 100
    invoke-direct/range {p0 .. p5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;-><init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;Ljavax/crypto/Cipher;Ljavax/crypto/SecretKey;)V

    return-void
.end method


# virtual methods
.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .locals 20

    .prologue
    .line 168
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->clearSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v12}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v10

    check-cast v10, Ljava/nio/ByteBuffer;

    .line 169
    .local v10, "sample":Ljava/nio/ByteBuffer;
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->limit()I

    move-result v12

    invoke-static {v12}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v4

    .line 171
    .local v4, "encSample":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v7, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    .line 172
    .local v7, "entry":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    iget-object v13, v13, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    move-object/from16 v0, p0

    iget-object v14, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cek:Ljavax/crypto/SecretKey;

    invoke-virtual {v12, v13, v14}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->initCipher([BLjavax/crypto/SecretKey;)V

    .line 174
    :try_start_0
    iget-object v12, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v12, :cond_3

    .line 175
    iget-object v13, v7, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v14, v13

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v14, :cond_4

    aget-object v9, v13, v12

    .line 176
    .local v9, "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->clear()I

    move-result v15

    new-array v2, v15, [B

    .line 177
    .local v2, "clears":[B
    invoke-virtual {v10, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 178
    invoke-virtual {v4, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 179
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-lez v15, :cond_2

    .line 180
    invoke-interface {v9}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v15

    new-array v11, v15, [B

    .line 181
    .local v11, "toBeEncrypted":[B
    invoke-virtual {v10, v11}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 182
    sget-boolean v15, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->$assertionsDisabled:Z

    if-nez v15, :cond_0

    array-length v15, v11

    rem-int/lit8 v15, v15, 0x10

    if-eqz v15, :cond_0

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12
    :try_end_0
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    .line 202
    .end local v2    # "clears":[B
    .end local v9    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    .end local v11    # "toBeEncrypted":[B
    :catch_0
    move-exception v3

    .line 203
    .local v3, "e":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 183
    .end local v3    # "e":Ljavax/crypto/IllegalBlockSizeException;
    .restart local v2    # "clears":[B
    .restart local v9    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    .restart local v11    # "toBeEncrypted":[B
    :cond_0
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v15, v11}, Ljavax/crypto/Cipher;->update([B)[B

    move-result-object v5

    .line 184
    .local v5, "encrypted":[B
    sget-boolean v15, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->$assertionsDisabled:Z

    if-nez v15, :cond_1

    array-length v15, v5

    array-length v0, v11

    move/from16 v16, v0

    move/from16 v0, v16

    if-eq v15, v0, :cond_1

    new-instance v12, Ljava/lang/AssertionError;

    invoke-direct {v12}, Ljava/lang/AssertionError;-><init>()V

    throw v12
    :try_end_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_1

    .line 204
    .end local v2    # "clears":[B
    .end local v5    # "encrypted":[B
    .end local v9    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    .end local v11    # "toBeEncrypted":[B
    :catch_1
    move-exception v3

    .line 205
    .local v3, "e":Ljavax/crypto/BadPaddingException;
    new-instance v12, Ljava/lang/RuntimeException;

    invoke-direct {v12, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v12

    .line 185
    .end local v3    # "e":Ljavax/crypto/BadPaddingException;
    .restart local v2    # "clears":[B
    .restart local v5    # "encrypted":[B
    .restart local v9    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    .restart local v11    # "toBeEncrypted":[B
    :cond_1
    :try_start_2
    invoke-virtual {v4, v5}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 175
    .end local v5    # "encrypted":[B
    .end local v11    # "toBeEncrypted":[B
    :cond_2
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 191
    .end local v2    # "clears":[B
    .end local v9    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    :cond_3
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->limit()I

    move-result v12

    new-array v8, v12, [B

    .line 192
    .local v8, "fullyEncryptedSample":[B
    invoke-virtual {v10, v8}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 193
    const-string v12, "cbc1"

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;
    invoke-static {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 194
    array-length v12, v8

    div-int/lit8 v12, v12, 0x10

    mul-int/lit8 v6, v12, 0x10

    .line 195
    .local v6, "encryptedLength":I
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    const/4 v13, 0x0

    invoke-virtual {v12, v8, v13, v6}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 196
    array-length v12, v8

    sub-int/2addr v12, v6

    invoke-virtual {v4, v8, v6, v12}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 201
    .end local v6    # "encryptedLength":I
    .end local v8    # "fullyEncryptedSample":[B
    :cond_4
    :goto_1
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;
    :try_end_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2 .. :try_end_2} :catch_1

    .line 207
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 208
    return-object v4

    .line 197
    .restart local v8    # "fullyEncryptedSample":[B
    :cond_5
    :try_start_3
    const-string v12, "cenc"

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;
    invoke-static {v13}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 198
    move-object/from16 v0, p0

    iget-object v12, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v12, v8}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v12

    invoke-virtual {v4, v12}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;
    :try_end_3
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1
.end method

.method public getSize()J
    .locals 2

    .prologue
    .line 163
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->clearSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->getSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;)V
    .locals 18
    .param p1, "channel"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 120
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->clearSample:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;

    invoke-interface {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Sample;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-result-object v12

    check-cast v12, Ljava/nio/ByteBuffer;

    .line 121
    .local v12, "sample":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    iget-object v5, v5, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->iv:[B

    move-object/from16 v0, p0

    iget-object v6, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cek:Ljavax/crypto/SecretKey;

    invoke-virtual {v2, v5, v6}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->initCipher([BLjavax/crypto/SecretKey;)V

    .line 123
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    if-eqz v2, :cond_3

    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    iget-object v2, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v2, v2

    if-lez v2, :cond_3

    .line 124
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    new-array v3, v2, [B

    .line 125
    .local v3, "fullSample":[B
    invoke-virtual {v12, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 126
    const/4 v4, 0x0

    .line 128
    .local v4, "offset":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cencSampleAuxiliaryDataFormat:Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;

    iget-object v14, v2, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;->pairs:[Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;

    array-length v15, v14

    const/4 v2, 0x0

    move v13, v2

    :goto_0
    if-ge v13, v15, :cond_1

    aget-object v11, v14, v13

    .line 129
    .local v11, "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->clear()I

    move-result v2

    add-int/2addr v4, v2

    .line 130
    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v6

    const-wide/16 v16, 0x0

    cmp-long v2, v6, v16

    if-lez v2, :cond_0

    .line 131
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    .line 133
    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v6

    invoke-static {v6, v7}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/CastUtils;->l2i(J)I

    move-result v5

    move-object v6, v3

    move v7, v4

    .line 131
    invoke-virtual/range {v2 .. v7}, Ljavax/crypto/Cipher;->update([BII[BI)I

    .line 136
    int-to-long v6, v4

    invoke-interface {v11}, Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;->encrypted()J

    move-result-wide v16

    add-long v6, v6, v16

    long-to-int v4, v6

    .line 128
    :cond_0
    add-int/lit8 v2, v13, 0x1

    move v13, v2

    goto :goto_0

    .line 139
    .end local v11    # "pair":Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat$Pair;
    :cond_1
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 151
    .end local v3    # "fullSample":[B
    .end local v4    # "offset":I
    :cond_2
    :goto_1
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 160
    return-void

    .line 141
    :cond_3
    invoke-virtual {v12}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    new-array v10, v2, [B

    .line 142
    .local v10, "fullyEncryptedSample":[B
    invoke-virtual {v12, v10}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 143
    const-string v2, "cbc1"

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;
    invoke-static {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 144
    array-length v2, v10

    div-int/lit8 v2, v2, 0x10

    mul-int/lit8 v9, v2, 0x10

    .line 145
    .local v9, "encryptedLength":I
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    const/4 v5, 0x0

    invoke-virtual {v2, v10, v5, v9}, Ljavax/crypto/Cipher;->doFinal([BII)[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 146
    array-length v2, v10

    sub-int/2addr v2, v9

    invoke-static {v10, v9, v2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_0
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_1

    .line 152
    .end local v9    # "encryptedLength":I
    .end local v10    # "fullyEncryptedSample":[B
    :catch_0
    move-exception v8

    .line 153
    .local v8, "e":Ljavax/crypto/IllegalBlockSizeException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 147
    .end local v8    # "e":Ljavax/crypto/IllegalBlockSizeException;
    .restart local v10    # "fullyEncryptedSample":[B
    :cond_4
    :try_start_1
    const-string v2, "cenc"

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;

    # getter for: Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->encryptionAlgo:Ljava/lang/String;
    invoke-static {v5}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;->access$100(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 148
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/cenc/CencEncryptingSampleList$EncryptedSampleImpl;->cipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2, v10}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-interface {v0, v2}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_1
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljavax/crypto/ShortBufferException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    .line 154
    .end local v10    # "fullyEncryptedSample":[B
    :catch_1
    move-exception v8

    .line 155
    .local v8, "e":Ljavax/crypto/BadPaddingException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 156
    .end local v8    # "e":Ljavax/crypto/BadPaddingException;
    :catch_2
    move-exception v8

    .line 157
    .local v8, "e":Ljavax/crypto/ShortBufferException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
