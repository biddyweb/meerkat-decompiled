.class Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;
.super Ljava/lang/Object;
.source "PhoneActivationCodeMediator.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;


# direct methods
.method constructor <init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V
    .locals 0
    .param p1, "this$0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 69
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 83
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 114
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText1:Landroid/widget/EditText;
    invoke-static {v1}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$200(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_2

    .line 87
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText2:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$300(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    .line 88
    :cond_2
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText2:Landroid/widget/EditText;
    invoke-static {v1}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$300(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_3

    .line 90
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText3:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$400(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    .line 91
    :cond_3
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText3:Landroid/widget/EditText;
    invoke-static {v1}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$400(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_4

    .line 93
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$500(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    goto :goto_0

    .line 94
    :cond_4
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;
    invoke-static {v0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;->this$0:Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    # getter for: Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;
    invoke-static {v1}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->access$500(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 96
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    new-instance v1, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2$1;-><init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;)V

    const-wide/16 v2, 0x2ee

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 73
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 78
    return-void
.end method
