.class public Lcom/digits/sdk/android/ContactsActivity;
.super Landroid/app/Activity;
.source "ContactsActivity.java"


# instance fields
.field delegate:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/digits/sdk/android/ContactsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "THEME_RESOURCE_ID"

    sget v2, Lcom/digits/sdk/android/R$style;->Digits_default:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/digits/sdk/android/ContactsActivity;->setTheme(I)V

    .line 13
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 15
    new-instance v0, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    invoke-direct {v0, p0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/digits/sdk/android/ContactsActivity;->delegate:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    .line 16
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsActivity;->delegate:Lcom/digits/sdk/android/ContactsActivityDelegateImpl;

    invoke-virtual {v0}, Lcom/digits/sdk/android/ContactsActivityDelegateImpl;->init()V

    .line 17
    return-void
.end method
