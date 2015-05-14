.class Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser$1;
.super Ljava/lang/ThreadLocal;
.source "AbstractBoxParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;

    .prologue
    .line 34
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser$1;->this$0:Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser;

    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 34
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/coremedia/iso/AbstractBoxParser$1;->initialValue()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 37
    const/16 v0, 0x20

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method
