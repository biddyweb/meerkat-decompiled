.class Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;
.super Landroid/view/View$AccessibilityDelegate;
.source "ViewVisitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TrackingAccessibilityDelegate"
.end annotation


# instance fields
.field private mRealDelegate:Landroid/view/View$AccessibilityDelegate;

.field final synthetic this$0:Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;


# direct methods
.method public constructor <init>(Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;Landroid/view/View$AccessibilityDelegate;)V
    .locals 0
    .param p2, "realDelegate"    # Landroid/view/View$AccessibilityDelegate;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->this$0:Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    .line 155
    iput-object p2, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    .line 156
    return-void
.end method


# virtual methods
.method public getRealDelegate()Landroid/view/View$AccessibilityDelegate;
    .locals 1

    .prologue
    .line 159
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    return-object v0
.end method

.method public removeFromDelegateChain(Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;)V
    .locals 2
    .param p1, "other"    # Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;

    .prologue
    .line 173
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    if-ne v1, p1, :cond_1

    .line 174
    invoke-virtual {p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->getRealDelegate()Landroid/view/View$AccessibilityDelegate;

    move-result-object v1

    iput-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    .line 181
    :cond_0
    :goto_0
    return-void

    .line 175
    :cond_1
    iget-object v1, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    instance-of v1, v1, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;

    if-eqz v1, :cond_0

    .line 176
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    check-cast v0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;

    .line 177
    .local v0, "child":Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;
    invoke-virtual {v0, p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->removeFromDelegateChain(Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;)V

    goto :goto_0
.end method

.method public sendAccessibilityEvent(Landroid/view/View;I)V
    .locals 1
    .param p1, "host"    # Landroid/view/View;
    .param p2, "eventType"    # I

    .prologue
    .line 185
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->this$0:Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    # getter for: Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;->mEventType:I
    invoke-static {v0}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;->access$000(Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;)I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 186
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->this$0:Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;->fireEvent(Landroid/view/View;)V

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    if-eqz v0, :cond_1

    .line 190
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    invoke-virtual {v0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->sendAccessibilityEvent(Landroid/view/View;I)V

    .line 192
    :cond_1
    return-void
.end method

.method public willFireEvent(Ljava/lang/String;)Z
    .locals 1
    .param p1, "eventName"    # Ljava/lang/String;

    .prologue
    .line 163
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->this$0:Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    invoke-virtual {v0}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;->getEventName()Ljava/lang/String;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 164
    const/4 v0, 0x1

    .line 168
    :goto_0
    return v0

    .line 165
    :cond_0
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    instance-of v0, v0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;

    if-eqz v0, :cond_1

    .line 166
    iget-object v0, p0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->mRealDelegate:Landroid/view/View$AccessibilityDelegate;

    check-cast v0, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;

    invoke-virtual {v0, p1}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor$TrackingAccessibilityDelegate;->willFireEvent(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    .line 168
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
