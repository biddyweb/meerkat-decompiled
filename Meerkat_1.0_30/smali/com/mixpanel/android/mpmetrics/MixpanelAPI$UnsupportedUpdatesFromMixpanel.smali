.class Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"

# interfaces
.implements Lcom/mixpanel/android/viewcrawler/UpdatesFromMixpanel;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnsupportedUpdatesFromMixpanel"
.end annotation


# instance fields
.field private final mEmptyTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 1

    .prologue
    .line 1695
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1696
    new-instance v0, Lcom/mixpanel/android/mpmetrics/Tweaks;

    invoke-direct {v0}, Lcom/mixpanel/android/mpmetrics/Tweaks;-><init>()V

    iput-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;->mEmptyTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

    .line 1697
    return-void
.end method


# virtual methods
.method public getTweaks()Lcom/mixpanel/android/mpmetrics/Tweaks;
    .locals 1

    .prologue
    .line 1706
    iget-object v0, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesFromMixpanel;->mEmptyTweaks:Lcom/mixpanel/android/mpmetrics/Tweaks;

    return-object v0
.end method

.method public setEventBindings(Lorg/json/JSONArray;)V
    .locals 0
    .param p1, "bindings"    # Lorg/json/JSONArray;

    .prologue
    .line 1702
    return-void
.end method
