.class public Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;
.super Lcom/mixpanel/android/viewcrawler/ViewVisitor;
.source "ViewVisitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/ViewVisitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PropertySetVisitor"
.end annotation


# instance fields
.field private final mAccessor:Lcom/mixpanel/android/viewcrawler/Caller;

.field private final mMutator:Lcom/mixpanel/android/viewcrawler/Caller;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/mixpanel/android/viewcrawler/Caller;Lcom/mixpanel/android/viewcrawler/Caller;)V
    .locals 0
    .param p2, "mutator"    # Lcom/mixpanel/android/viewcrawler/Caller;
    .param p3, "accessor"    # Lcom/mixpanel/android/viewcrawler/Caller;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;",
            ">;",
            "Lcom/mixpanel/android/viewcrawler/Caller;",
            "Lcom/mixpanel/android/viewcrawler/Caller;",
            ")V"
        }
    .end annotation

    .prologue
    .line 39
    .local p1, "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    invoke-direct {p0, p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor;-><init>(Ljava/util/List;)V

    .line 40
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mMutator:Lcom/mixpanel/android/viewcrawler/Caller;

    .line 41
    iput-object p3, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mAccessor:Lcom/mixpanel/android/viewcrawler/Caller;

    .line 42
    return-void
.end method


# virtual methods
.method public accumulate(Landroid/view/View;)V
    .locals 7
    .param p1, "found"    # Landroid/view/View;

    .prologue
    .line 51
    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mAccessor:Lcom/mixpanel/android/viewcrawler/Caller;

    if-eqz v5, :cond_2

    .line 52
    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mMutator:Lcom/mixpanel/android/viewcrawler/Caller;

    invoke-virtual {v5}, Lcom/mixpanel/android/viewcrawler/Caller;->getArgs()[Ljava/lang/Object;

    move-result-object v4

    .line 53
    .local v4, "setArgs":[Ljava/lang/Object;
    const/4 v5, 0x1

    array-length v6, v4

    if-ne v5, v6, :cond_2

    .line 54
    const/4 v5, 0x0

    aget-object v3, v4, v5

    .line 55
    .local v3, "desiredValue":Ljava/lang/Object;
    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mAccessor:Lcom/mixpanel/android/viewcrawler/Caller;

    invoke-virtual {v5, p1}, Lcom/mixpanel/android/viewcrawler/Caller;->applyMethod(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    .line 57
    .local v1, "currentValue":Ljava/lang/Object;
    if-ne v3, v1, :cond_1

    .line 76
    .end local v1    # "currentValue":Ljava/lang/Object;
    .end local v3    # "desiredValue":Ljava/lang/Object;
    .end local v4    # "setArgs":[Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 61
    .restart local v1    # "currentValue":Ljava/lang/Object;
    .restart local v3    # "desiredValue":Ljava/lang/Object;
    .restart local v4    # "setArgs":[Ljava/lang/Object;
    :cond_1
    if-eqz v3, :cond_2

    .line 62
    instance-of v5, v3, Landroid/graphics/Bitmap;

    if-eqz v5, :cond_3

    instance-of v5, v1, Landroid/graphics/Bitmap;

    if-eqz v5, :cond_3

    move-object v2, v3

    .line 63
    check-cast v2, Landroid/graphics/Bitmap;

    .local v2, "desiredBitmap":Landroid/graphics/Bitmap;
    move-object v0, v1

    .line 64
    check-cast v0, Landroid/graphics/Bitmap;

    .line 65
    .local v0, "currentBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v2, v0}, Landroid/graphics/Bitmap;->sameAs(Landroid/graphics/Bitmap;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 75
    .end local v0    # "currentBitmap":Landroid/graphics/Bitmap;
    .end local v1    # "currentValue":Ljava/lang/Object;
    .end local v2    # "desiredBitmap":Landroid/graphics/Bitmap;
    .end local v3    # "desiredValue":Ljava/lang/Object;
    .end local v4    # "setArgs":[Ljava/lang/Object;
    :cond_2
    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;->mMutator:Lcom/mixpanel/android/viewcrawler/Caller;

    invoke-virtual {v5, p1}, Lcom/mixpanel/android/viewcrawler/Caller;->applyMethod(Landroid/view/View;)Ljava/lang/Object;

    goto :goto_0

    .line 68
    .restart local v1    # "currentValue":Ljava/lang/Object;
    .restart local v3    # "desiredValue":Ljava/lang/Object;
    .restart local v4    # "setArgs":[Ljava/lang/Object;
    :cond_3
    invoke-virtual {v3, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_0
.end method

.method public cleanup()V
    .locals 0

    .prologue
    .line 47
    return-void
.end method

.method protected name()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string v0, "Property Mutator"

    return-object v0
.end method

.method public bridge synthetic visit(Landroid/view/View;)V
    .locals 0

    .prologue
    .line 37
    invoke-super {p0, p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->visit(Landroid/view/View;)V

    return-void
.end method
