.class public Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
.super Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;
.source "ESDescriptorBox.java"


# static fields
.field public static final TYPE:Ljava/lang/String; = "esds"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const-string v0, "esds"

    invoke-direct {p0, v0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 43
    if-ne p0, p1, :cond_1

    .line 49
    :cond_0
    :goto_0
    return v1

    .line 44
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 46
    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;

    .line 48
    .local v0, "that":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;
    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    iget-object v4, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    goto :goto_0

    :cond_4
    iget-object v3, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getEsDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;
    .locals 1

    .prologue
    .line 34
    invoke-super {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->getDescriptor()Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/ESDescriptorBox;->data:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hashCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setEsDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;)V
    .locals 0
    .param p1, "esDescriptor"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/ESDescriptor;

    .prologue
    .line 38
    invoke-super {p0, p1}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/AbstractDescriptorBox;->setDescriptor(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/boxes/mp4/objectdescriptors/BaseDescriptor;)V

    .line 39
    return-void
.end method
