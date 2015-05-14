.class Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;
.super Lcom/instabug/library/InstabugActivityDelegate;
.source "InstabugICSActivityDelegate.java"


# instance fields
.field private final mActivity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/instabug/library/InstabugActivityDelegate;-><init>(Landroid/app/Activity;)V

    .line 16
    iput-object p1, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    .line 17
    return-void
.end method


# virtual methods
.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 7
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    const/4 v6, 0x1

    .line 20
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v2

    invoke-virtual {v2}, Lcom/instabug/library/Instabug;->isEnableOverflowMenuItem()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 21
    iget-object v2, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 22
    .local v1, "r":Landroid/content/res/Resources;
    iget-object v2, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v2

    const-string v3, "instabug_support_activity_menu"

    const-string v4, "menu"

    iget-object v5, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 23
    const-string v2, "invoke_instabug_menu_item"

    const-string v3, "id"

    iget-object v4, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 24
    .local v0, "item":Landroid/view/MenuItem;
    invoke-interface {v0, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 26
    .end local v0    # "item":Landroid/view/MenuItem;
    .end local v1    # "r":Landroid/content/res/Resources;
    :cond_0
    return v6
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 5
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 30
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    iget-object v1, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "invoke_instabug_menu_item"

    const-string v3, "id"

    iget-object v4, p0, Lcom/instabug/wrapper/support/activity/InstabugICSActivityDelegate;->mActivity:Landroid/app/Activity;

    invoke-virtual {v4}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 31
    invoke-static {}, Lcom/instabug/library/Instabug;->getInstance()Lcom/instabug/library/Instabug;

    move-result-object v0

    invoke-virtual {v0}, Lcom/instabug/library/Instabug;->invoke()V

    .line 32
    const/4 v0, 0x1

    .line 34
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
