.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;
.super Ljava/lang/Object;
.source "LazyList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field pos:I

.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;)V
    .locals 1
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    .prologue
    .line 51
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    const/4 v0, 0x0

    iput v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->pos:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 55
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;"
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->pos:I

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->underlying:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->elementSource:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;"
    iget v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->pos:I

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->underlying:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 60
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->underlying:Ljava/util/List;

    iget v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->pos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 63
    :goto_0
    return-object v0

    .line 62
    :cond_0
    iget-object v0, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v0, v0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->underlying:Ljava/util/List;

    iget-object v1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;

    iget-object v1, v1, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList;->elementSource:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    invoke-virtual {p0}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;->next()Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 68
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/LazyList$1;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
