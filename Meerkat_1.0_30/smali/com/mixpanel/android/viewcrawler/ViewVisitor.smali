.class abstract Lcom/mixpanel/android/viewcrawler/ViewVisitor;
.super Ljava/lang/Object;
.source "ViewVisitor.java"

# interfaces
.implements Lcom/mixpanel/android/viewcrawler/Pathfinder$Accumulator;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x10
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$EventTriggeringVisitor;,
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$ViewDetectorVisitor;,
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddTextChangeListener;,
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;,
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;,
        Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.ViewVisitor"


# instance fields
.field private final mPath:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;",
            ">;"
        }
    .end annotation
.end field

.field private final mPathfinder:Lcom/mixpanel/android/viewcrawler/Pathfinder;


# direct methods
.method protected constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 332
    .local p1, "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 333
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->mPath:Ljava/util/List;

    .line 334
    new-instance v0, Lcom/mixpanel/android/viewcrawler/Pathfinder;

    invoke-direct {v0}, Lcom/mixpanel/android/viewcrawler/Pathfinder;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->mPathfinder:Lcom/mixpanel/android/viewcrawler/Pathfinder;

    .line 335
    return-void
.end method


# virtual methods
.method public abstract cleanup()V
.end method

.method protected abstract name()Ljava/lang/String;
.end method

.method public visit(Landroid/view/View;)V
    .locals 2
    .param p1, "rootView"    # Landroid/view/View;

    .prologue
    .line 323
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->mPathfinder:Lcom/mixpanel/android/viewcrawler/Pathfinder;

    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor;->mPath:Ljava/util/List;

    invoke-virtual {v0, p1, v1, p0}, Lcom/mixpanel/android/viewcrawler/Pathfinder;->findTargetsInRoot(Landroid/view/View;Ljava/util/List;Lcom/mixpanel/android/viewcrawler/Pathfinder$Accumulator;)V

    .line 324
    return-void
.end method
