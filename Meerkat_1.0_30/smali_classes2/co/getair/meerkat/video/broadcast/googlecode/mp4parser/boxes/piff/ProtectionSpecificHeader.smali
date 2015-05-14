.class public abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
.super Ljava/lang/Object;
.source "ProtectionSpecificHeader.java"


# static fields
.field protected static uuidRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Ljava/lang/Class",
            "<+",
            "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->uuidRegistry:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFor(Ljava/util/UUID;Ljava/nio/ByteBuffer;)Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    .locals 4
    .param p0, "systemId"    # Ljava/util/UUID;
    .param p1, "bufferWrapper"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 24
    sget-object v3, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->uuidRegistry:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 26
    .local v0, "aClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;>;"
    const/4 v2, 0x0

    .line 27
    .local v2, "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    if-eqz v0, :cond_0

    .line 29
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    check-cast v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    .line 38
    .restart local v2    # "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    :cond_0
    if-nez v2, :cond_1

    .line 39
    new-instance v2, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/contentprotection/GenericHeader;

    .end local v2    # "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    invoke-direct {v2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/contentprotection/GenericHeader;-><init>()V

    .line 41
    .restart local v2    # "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    :cond_1
    invoke-virtual {v2, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->parse(Ljava/nio/ByteBuffer;)V

    .line 42
    return-object v2

    .line 31
    .end local v2    # "protectionSpecificHeader":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;
    :catch_0
    move-exception v1

    .line 32
    .local v1, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 33
    .end local v1    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v1

    .line 34
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 20
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "somebody called equals on me but that\'s not supposed to happen."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract getData()Ljava/nio/ByteBuffer;
.end method

.method public abstract getSystemId()Ljava/util/UUID;
.end method

.method public abstract parse(Ljava/nio/ByteBuffer;)V
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 52
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .local v2, "sb":Ljava/lang/StringBuilder;
    const-string v3, "ProtectionSpecificHeader"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    const-string v3, "{data="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/piff/ProtectionSpecificHeader;->getData()Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 56
    .local v1, "data":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 57
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v3

    new-array v0, v3, [B

    .line 58
    .local v0, "bytes":[B
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 59
    invoke-static {v0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/Hex;->encodeHex([B)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    const/16 v3, 0x7d

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 61
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
