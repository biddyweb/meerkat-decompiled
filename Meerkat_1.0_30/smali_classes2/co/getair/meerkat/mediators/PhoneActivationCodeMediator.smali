.class public Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;
.super Lorg/puremvc/java/multicore/patterns/mediator/Mediator;
.source "PhoneActivationCodeMediator.java"


# static fields
.field private static final NAME:Ljava/lang/String; = "PhoneActivationMediator"

.field private static final NUMBER_OF_DIGITS:I = 0x4


# instance fields
.field private currentEditText:Landroid/widget/EditText;

.field private digitEditText1:Landroid/widget/EditText;

.field private digitEditText2:Landroid/widget/EditText;

.field private digitEditText3:Landroid/widget/EditText;

.field private digitEditText4:Landroid/widget/EditText;

.field private digits:[Landroid/view/View;

.field private editTextFocusListener:Landroid/view/View$OnFocusChangeListener;

.field private inputView:Landroid/view/View;

.field private phoneImageView:Landroid/widget/ImageView;

.field private progressBar:Landroid/widget/ProgressBar;

.field private resendSmsContainerView:Landroid/view/View;

.field private rootView:Landroid/view/View;

.field private secondsToResend:Landroid/widget/TextView;

.field private sendSmsToTextView:Landroid/widget/TextView;

.field private textWatcher:Landroid/text/TextWatcher;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 5
    .param p1, "mediatorName"    # Ljava/lang/String;
    .param p2, "viewComponent"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x4

    .line 137
    invoke-direct {p0, p1, p2}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 57
    new-instance v1, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$1;-><init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->editTextFocusListener:Landroid/view/View$OnFocusChangeListener;

    .line 69
    new-instance v1, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;

    invoke-direct {v1, p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$2;-><init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->textWatcher:Landroid/text/TextWatcher;

    .line 139
    check-cast p2, Landroid/view/View;

    .end local p2    # "viewComponent":Ljava/lang/Object;
    iput-object p2, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    .line 141
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e006a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->inputView:Landroid/view/View;

    .line 142
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e006d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->progressBar:Landroid/widget/ProgressBar;

    .line 143
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e009c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->sendSmsToTextView:Landroid/widget/TextView;

    .line 144
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00a2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->secondsToResend:Landroid/widget/TextView;

    .line 145
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00a1

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->resendSmsContainerView:Landroid/view/View;

    .line 146
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e009d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText1:Landroid/widget/EditText;

    .line 147
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e009e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText2:Landroid/widget/EditText;

    .line 148
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e009f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText3:Landroid/widget/EditText;

    .line 149
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->rootView:Landroid/view/View;

    const v2, 0x7f0e00a0

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;

    .line 151
    new-array v1, v4, [Landroid/view/View;

    iput-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    .line 152
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    const/4 v2, 0x0

    iget-object v3, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText1:Landroid/widget/EditText;

    aput-object v3, v1, v2

    .line 153
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    const/4 v2, 0x1

    iget-object v3, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText2:Landroid/widget/EditText;

    aput-object v3, v1, v2

    .line 154
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    const/4 v2, 0x2

    iget-object v3, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText3:Landroid/widget/EditText;

    aput-object v3, v1, v2

    .line 155
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    const/4 v2, 0x3

    iget-object v3, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;

    aput-object v3, v1, v2

    .line 157
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->resendSmsContainerView:Landroid/view/View;

    new-instance v2, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$3;

    invoke-direct {v2, p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$3;-><init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 164
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v4, :cond_0

    .line 166
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    aget-object v1, v1, v0

    iget-object v2, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->editTextFocusListener:Landroid/view/View$OnFocusChangeListener;

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 167
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    aget-object v1, v1, v0

    check-cast v1, Landroid/widget/EditText;

    iget-object v2, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 164
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 170
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$002(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;Landroid/widget/EditText;)Landroid/widget/EditText;
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;
    .param p1, "x1"    # Landroid/widget/EditText;

    .prologue
    .line 42
    iput-object p1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    return-object p1
.end method

.method static synthetic access$100(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->markCurrentEditText()V

    return-void
.end method

.method static synthetic access$200(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText1:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$300(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText2:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$400(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText3:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$500(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;

    return-object v0
.end method

.method static synthetic access$600(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V
    .locals 0
    .param p0, "x0"    # Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;

    .prologue
    .line 42
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->submitActivationCode()V

    return-void
.end method

.method public static getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    const-string v0, "PhoneActivationMediator"

    return-object v0
.end method

.method private getOwnerActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 198
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v0}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method private markCurrentEditText()V
    .locals 3

    .prologue
    .line 219
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    if-nez v1, :cond_0

    .line 229
    :goto_0
    return-void

    .line 221
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 223
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    aget-object v1, v1, v0

    const v2, 0x7f0201e9

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 224
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    aget-object v1, v1, v0

    check-cast v1, Landroid/widget/EditText;

    iget-object v2, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->textWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 221
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 227
    :cond_1
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 228
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    const v2, 0x7f0201ea

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setBackgroundResource(I)V

    goto :goto_0
.end method

.method private promptInvalidNumberMessage()V
    .locals 4

    .prologue
    .line 204
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v1

    check-cast v1, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v1}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    .line 205
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Invalid Phone Number"

    .line 206
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Please double check that you have entered your number correctly."

    .line 207
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Ok"

    new-instance v3, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$4;

    invoke-direct {v3, p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator$4;-><init>(Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;)V

    .line 208
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 212
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 213
    return-void
.end method

.method private showError()V
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->inputView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 234
    iget-object v0, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->progressBar:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 236
    return-void
.end method

.method private submitActivationCode()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 241
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    if-nez v6, :cond_0

    .line 243
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText4:Landroid/widget/EditText;

    iput-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    .line 247
    :cond_0
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v6

    const-string v7, "input_method"

    invoke-virtual {v6, v7}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/inputmethod/InputMethodManager;

    .line 248
    .local v5, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->currentEditText:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 251
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 253
    .local v2, "codeBuffer":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    const/4 v6, 0x4

    if-ge v4, v6, :cond_1

    .line 255
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digits:[Landroid/view/View;

    aget-object v3, v6, v4

    check-cast v3, Landroid/widget/EditText;

    .line 256
    .local v3, "digitEditText":Landroid/widget/EditText;
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_2

    .line 258
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 253
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 264
    .end local v3    # "digitEditText":Landroid/widget/EditText;
    :cond_1
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->inputView:Landroid/view/View;

    const/16 v7, 0x8

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 265
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v6, v8}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 267
    iget-object v6, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->digitEditText1:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->requestFocus()Z

    .line 269
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 270
    .local v1, "code":Ljava/lang/String;
    new-instance v0, Lco/getair/meerkat/dtos/ActivationCodeParams;

    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v6

    check-cast v6, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;

    invoke-virtual {v6}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getPhoneNumber()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6, v1}, Lco/getair/meerkat/dtos/ActivationCodeParams;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 272
    .local v0, "activationCodeParams":Lco/getair/meerkat/dtos/ActivationCodeParams;
    const-string v6, "eventSendActivationCode"

    const/4 v7, 0x0

    invoke-virtual {p0, v6, v0, v7}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->sendNotification(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    .line 273
    .end local v0    # "activationCodeParams":Lco/getair/meerkat/dtos/ActivationCodeParams;
    .end local v1    # "code":Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public activationCodeVerified()V
    .locals 3

    .prologue
    .line 278
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v2

    check-cast v2, Lco/getair/meerkat/facades/BaseFacade;

    invoke-virtual {v2}, Lco/getair/meerkat/facades/BaseFacade;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v1

    .line 279
    .local v1, "ownerActivity":Landroid/app/Activity;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lco/getair/meerkat/activities/AddressbookUploadActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 280
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {v1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 281
    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 282
    return-void
.end method

.method public handleNotification(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 2
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    .line 185
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventSendActivationCodeFail"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 187
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->showError()V

    .line 190
    :cond_0
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "eventSendActivationCodeAccepted"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 192
    invoke-virtual {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->activationCodeVerified()V

    .line 195
    :cond_1
    return-void
.end method

.method public listNotificationInterests()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 175
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "eventSendActivationCodeFail"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "eventSendActivationCodeAccepted"

    aput-object v2, v0, v1

    return-object v0
.end method

.method public onRegister()V
    .locals 6

    .prologue
    .line 128
    invoke-super {p0}, Lorg/puremvc/java/multicore/patterns/mediator/Mediator;->onRegister()V

    .line 130
    invoke-direct {p0}, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->getOwnerActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;

    .line 131
    .local v0, "activity":Lco/getair/meerkat/activities/PhoneActivationCodeActivity;
    iget-object v1, p0, Lco/getair/meerkat/mediators/PhoneActivationCodeMediator;->sendSmsToTextView:Landroid/widget/TextView;

    const v2, 0x7f0900ad

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getPhoneNumber()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    invoke-virtual {v0}, Lco/getair/meerkat/activities/PhoneActivationCodeActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 134
    return-void
.end method
