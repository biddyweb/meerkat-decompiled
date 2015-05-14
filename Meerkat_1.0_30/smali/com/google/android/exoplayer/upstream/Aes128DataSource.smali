.class public Lcom/google/android/exoplayer/upstream/Aes128DataSource;
.super Ljava/lang/Object;
.source "Aes128DataSource.java"

# interfaces
.implements Lcom/google/android/exoplayer/upstream/DataSource;


# instance fields
.field private cipherInputStream:Ljavax/crypto/CipherInputStream;

.field private final iv:[B

.field private final secretKey:[B

.field private final upstream:Lcom/google/android/exoplayer/upstream/DataSource;


# direct methods
.method public constructor <init>([B[BLcom/google/android/exoplayer/upstream/DataSource;)V
    .locals 0
    .param p1, "secretKey"    # [B
    .param p2, "iv"    # [B
    .param p3, "upstream"    # Lcom/google/android/exoplayer/upstream/DataSource;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p3, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    .line 49
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->secretKey:[B

    .line 50
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->iv:[B

    .line 51
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
    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    .line 84
    iget-object v0, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-interface {v0}, Lcom/google/android/exoplayer/upstream/DataSource;->close()V

    .line 85
    return-void
.end method

.method public open(Lcom/google/android/exoplayer/upstream/DataSpec;)J
    .locals 7
    .param p1, "dataSpec"    # Lcom/google/android/exoplayer/upstream/DataSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    :try_start_0
    const-string v4, "AES/CBC/PKCS7Padding"

    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 64
    .local v0, "cipher":Ljavax/crypto/Cipher;
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->secretKey:[B

    const-string v5, "AES"

    invoke-direct {v2, v4, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 65
    .local v2, "cipherKey":Ljava/security/Key;
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v4, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->iv:[B

    invoke-direct {v1, v4}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 68
    .local v1, "cipherIV":Ljava/security/spec/AlgorithmParameterSpec;
    const/4 v4, 0x2

    :try_start_1
    invoke-virtual {v0, v4, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_3

    .line 75
    new-instance v4, Ljavax/crypto/CipherInputStream;

    new-instance v5, Lcom/google/android/exoplayer/upstream/DataSourceInputStream;

    iget-object v6, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->upstream:Lcom/google/android/exoplayer/upstream/DataSource;

    invoke-direct {v5, v6, p1}, Lcom/google/android/exoplayer/upstream/DataSourceInputStream;-><init>(Lcom/google/android/exoplayer/upstream/DataSource;Lcom/google/android/exoplayer/upstream/DataSpec;)V

    invoke-direct {v4, v5, v0}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V

    iput-object v4, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    .line 78
    const-wide/16 v4, -0x1

    return-wide v4

    .line 58
    .end local v0    # "cipher":Ljavax/crypto/Cipher;
    .end local v1    # "cipherIV":Ljava/security/spec/AlgorithmParameterSpec;
    .end local v2    # "cipherKey":Ljava/security/Key;
    :catch_0
    move-exception v3

    .line 59
    .local v3, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 60
    .end local v3    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v3

    .line 61
    .local v3, "e":Ljavax/crypto/NoSuchPaddingException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 69
    .end local v3    # "e":Ljavax/crypto/NoSuchPaddingException;
    .restart local v0    # "cipher":Ljavax/crypto/Cipher;
    .restart local v1    # "cipherIV":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v2    # "cipherKey":Ljava/security/Key;
    :catch_2
    move-exception v3

    .line 70
    .local v3, "e":Ljava/security/InvalidKeyException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 71
    .end local v3    # "e":Ljava/security/InvalidKeyException;
    :catch_3
    move-exception v3

    .line 72
    .local v3, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-direct {v4, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method public read([BII)I
    .locals 2
    .param p1, "buffer"    # [B
    .param p2, "offset"    # I
    .param p3, "readLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/google/android/exoplayer/util/Assertions;->checkState(Z)V

    .line 90
    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/Aes128DataSource;->cipherInputStream:Ljavax/crypto/CipherInputStream;

    invoke-virtual {v1, p1, p2, p3}, Ljavax/crypto/CipherInputStream;->read([BII)I

    move-result v0

    .line 91
    .local v0, "bytesRead":I
    if-gez v0, :cond_0

    .line 92
    const/4 v0, -0x1

    .line 94
    .end local v0    # "bytesRead":I
    :cond_0
    return v0

    .line 89
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method
