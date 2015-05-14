.class Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;
.super Ljava/lang/Object;
.source "RangeStartMap.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;


# direct methods
.method constructor <init>(Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    .prologue
    .line 14
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;"
    iput-object p1, p0, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;->this$0:Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)I"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;"
    .local p1, "o1":Ljava/lang/Comparable;, "TK;"
    .local p2, "o2":Ljava/lang/Comparable;, "TK;"
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    neg-int v0, v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 14
    .local p0, "this":Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;, "Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;"
    check-cast p1, Ljava/lang/Comparable;

    check-cast p2, Ljava/lang/Comparable;

    invoke-virtual {p0, p1, p2}, Lco/getair/meerkat/video/broadcast/googlecode/mp4parser/util/RangeStartMap$1;->compare(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result v0

    return v0
.end method
