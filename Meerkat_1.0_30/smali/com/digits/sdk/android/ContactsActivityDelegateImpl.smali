.class Lcom/digits/sdk/android/ContactsActivityDelegateImpl;
.super Ljava/lang/Object;
.source "ContactsActivityDelegateImpl.java"

# interfaces
.implements Lcom/digits/sdk/android/ContactsActivityDelegate;


# instance fields
.field final activity:Landroid/app/Activity;

.field final controller:Lcom/digits/sdk/android/ContactsController;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 13
    new-instance v0, Lcom/digits/sdk/android/ContactsControllerImpl;

    invoke-direct {v0}, Lcom/digits/sdk/android/ContactsControllerImpl;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;-><init>(Landroid/app/Activity;Lcom/digits/sdk/android/ContactsController;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lcom/digits/sdk/android/ContactsController;)V
    .locals 0
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "controller"    # Lcom/digits/sdk/android/ContactsController;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    .line 18
    iput-object p2, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->controller:Lcom/digits/sdk/android/ContactsController;

    .line 19
    return-void
.end method


# virtual methods
.method protected getApplicationName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getFormattedDescription()Ljava/lang/String;
    .locals 5

    .prologue
    .line 49
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v1, Lcom/digits/sdk/android/R$string;->dgts__upload_contacts:I

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->getApplicationName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public init()V
    .locals 0

    .prologue
    .line 22
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setContentView()V

    .line 23
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setUpViews()V

    .line 24
    return-void
.end method

.method protected setContentView()V
    .locals 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v1, Lcom/digits/sdk/android/R$layout;->dgts__activity_contacts:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(I)V

    .line 28
    return-void
.end method

.method protected setUpDescription(Landroid/widget/TextView;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 41
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->getFormattedDescription()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    return-void
.end method

.method protected setUpNotNowButton(Landroid/widget/Button;)V
    .locals 1
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 53
    new-instance v0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$1;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$1;-><init>(Lcom/digits/sdk/android/ContactsActivityDelegateImpl;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 59
    return-void
.end method

.method protected setUpOkayButton(Landroid/widget/Button;)V
    .locals 1
    .param p1, "button"    # Landroid/widget/Button;

    .prologue
    .line 62
    new-instance v0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl$2;-><init>(Lcom/digits/sdk/android/ContactsActivityDelegateImpl;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 69
    return-void
.end method

.method protected setUpViews()V
    .locals 5

    .prologue
    .line 31
    iget-object v3, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v4, Lcom/digits/sdk/android/R$id;->dgts__not_now:I

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 32
    .local v1, "notNowButton":Landroid/widget/Button;
    iget-object v3, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v4, Lcom/digits/sdk/android/R$id;->dgts__okay:I

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 33
    .local v2, "okayButton":Landroid/widget/Button;
    iget-object v3, p0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->activity:Landroid/app/Activity;

    sget v4, Lcom/digits/sdk/android/R$id;->dgts__upload_contacts:I

    invoke-virtual {v3, v4}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 35
    .local v0, "description":Landroid/widget/TextView;
    invoke-virtual {p0, v1}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setUpNotNowButton(Landroid/widget/Button;)V

    .line 36
    invoke-virtual {p0, v2}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setUpOkayButton(Landroid/widget/Button;)V

    .line 37
    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->setUpDescription(Landroid/widget/TextView;)V

    .line 38
    return-void
.end method
