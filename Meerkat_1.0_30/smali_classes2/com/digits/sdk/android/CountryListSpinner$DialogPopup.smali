.class public Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;
.super Ljava/lang/Object;
.source "CountryListSpinner.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/digits/sdk/android/CountryListSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DialogPopup"
.end annotation


# static fields
.field private static final DELAY_MILLIS:J = 0xaL


# instance fields
.field private dialog:Landroid/app/AlertDialog;

.field private final listAdapter:Lcom/digits/sdk/android/CountryListAdapter;

.field final synthetic this$0:Lcom/digits/sdk/android/CountryListSpinner;


# direct methods
.method constructor <init>(Lcom/digits/sdk/android/CountryListSpinner;Lcom/digits/sdk/android/CountryListAdapter;)V
    .locals 0
    .param p2, "adapter"    # Lcom/digits/sdk/android/CountryListAdapter;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->this$0:Lcom/digits/sdk/android/CountryListSpinner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->listAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    .line 125
    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 129
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    .line 130
    return-void
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 157
    iget-object v1, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->listAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    invoke-virtual {v1, p2}, Lcom/digits/sdk/android/CountryListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/digits/sdk/android/CountryInfo;

    .line 158
    .local v0, "countryInfo":Lcom/digits/sdk/android/CountryInfo;
    iget-object v1, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->this$0:Lcom/digits/sdk/android/CountryListSpinner;

    iget-object v2, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    # setter for: Lcom/digits/sdk/android/CountryListSpinner;->selectedCountryName:Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/digits/sdk/android/CountryListSpinner;->access$002(Lcom/digits/sdk/android/CountryListSpinner;Ljava/lang/String;)Ljava/lang/String;

    .line 159
    iget-object v1, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->this$0:Lcom/digits/sdk/android/CountryListSpinner;

    iget v2, v0, Lcom/digits/sdk/android/CountryInfo;->countryCode:I

    iget-object v3, v0, Lcom/digits/sdk/android/CountryInfo;->country:Ljava/lang/String;

    # invokes: Lcom/digits/sdk/android/CountryListSpinner;->setSpinnerText(ILjava/lang/String;)V
    invoke-static {v1, v2, v3}, Lcom/digits/sdk/android/CountryListSpinner;->access$100(Lcom/digits/sdk/android/CountryListSpinner;ILjava/lang/String;)V

    .line 160
    invoke-virtual {p0}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dismiss()V

    .line 161
    return-void
.end method

.method public show(I)V
    .locals 6
    .param p1, "selected"    # I

    .prologue
    const/4 v4, 0x1

    .line 137
    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->listAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    if-nez v2, :cond_0

    .line 153
    :goto_0
    return-void

    .line 141
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->this$0:Lcom/digits/sdk/android/CountryListSpinner;

    invoke-virtual {v2}, Lcom/digits/sdk/android/CountryListSpinner;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 142
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->listAdapter:Lcom/digits/sdk/android/CountryListAdapter;

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, p0}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems(Landroid/widget/ListAdapter;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v2

    iput-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    .line 143
    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2, v4}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 144
    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v1

    .line 145
    .local v1, "listView":Landroid/widget/ListView;
    invoke-virtual {v1, v4}, Landroid/widget/ListView;->setFastScrollEnabled(Z)V

    .line 146
    new-instance v2, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup$1;

    invoke-direct {v2, p0, v1, p1}, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup$1;-><init>(Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;Landroid/widget/ListView;I)V

    const-wide/16 v4, 0xa

    invoke-virtual {v1, v2, v4, v5}, Landroid/widget/ListView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 152
    iget-object v2, p0, Lcom/digits/sdk/android/CountryListSpinner$DialogPopup;->dialog:Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    goto :goto_0
.end method
