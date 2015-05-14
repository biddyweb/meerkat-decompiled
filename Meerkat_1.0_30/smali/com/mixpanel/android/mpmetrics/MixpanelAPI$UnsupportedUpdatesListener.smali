.class Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;
.super Ljava/lang/Object;
.source "MixpanelAPI.java"

# interfaces
.implements Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UpdatesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UnsupportedUpdatesListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;


# direct methods
.method private constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V
    .locals 0

    .prologue
    .line 1644
    iput-object p1, p0, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;->this$0:Lcom/mixpanel/android/mpmetrics/MixpanelAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI;
    .param p2, "x1"    # Lcom/mixpanel/android/mpmetrics/MixpanelAPI$1;

    .prologue
    .line 1644
    invoke-direct {p0, p1}, Lcom/mixpanel/android/mpmetrics/MixpanelAPI$UnsupportedUpdatesListener;-><init>(Lcom/mixpanel/android/mpmetrics/MixpanelAPI;)V

    return-void
.end method


# virtual methods
.method public addOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1653
    return-void
.end method

.method public onNewResults()V
    .locals 0

    .prologue
    .line 1648
    return-void
.end method

.method public removeOnMixpanelUpdatesReceivedListener(Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/mixpanel/android/mpmetrics/OnMixpanelUpdatesReceivedListener;

    .prologue
    .line 1658
    return-void
.end method
