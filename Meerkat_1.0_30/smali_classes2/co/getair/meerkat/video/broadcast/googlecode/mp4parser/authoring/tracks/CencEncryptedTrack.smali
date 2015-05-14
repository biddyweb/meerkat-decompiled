.class public interface abstract Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/tracks/CencEncryptedTrack;
.super Ljava/lang/Object;
.source "CencEncryptedTrack.java"

# interfaces
.implements Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/authoring/Track;


# virtual methods
.method public abstract getDefaultKeyId()Ljava/util/UUID;
.end method

.method public abstract getSampleEncryptionEntries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lco/getair/meerkat/video/broadcast/mp4parser/iso23001/part7/CencSampleAuxiliaryDataFormat;",
            ">;"
        }
    .end annotation
.end method

.method public abstract hasSubSampleEncryption()Z
.end method
