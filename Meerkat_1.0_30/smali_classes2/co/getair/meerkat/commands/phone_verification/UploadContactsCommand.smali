.class public Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;
.super Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;
.source "UploadContactsCommand.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;Landroid/content/Context;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->getContactsPhoneNumbers(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;)Lorg/puremvc/java/multicore/patterns/facade/Facade;
    .locals 1
    .param p0, "x0"    # Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;

    .prologue
    .line 26
    invoke-virtual {p0}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;->getFacade()Lorg/puremvc/java/multicore/patterns/facade/Facade;

    move-result-object v0

    return-object v0
.end method

.method private getContactsPhoneNumbers(Landroid/content/Context;)Ljava/util/List;
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 51
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .line 52
    .local v1, "cr":Landroid/content/ContentResolver;
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 53
    .local v9, "cursor":Landroid/database/Cursor;
    new-instance v2, Lco/getair/meerkat/utilities/ApplicationPreferences;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Lco/getair/meerkat/utilities/ApplicationPreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lco/getair/meerkat/utilities/ApplicationPreferences;->getDefaultCountryCode()Ljava/lang/String;

    move-result-object v8

    .line 55
    .local v8, "countryCode":Ljava/lang/String;
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 56
    .local v17, "phoneNumbers":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 60
    :cond_0
    const-string v2, "_id"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 62
    .local v11, "id":Ljava/lang/String;
    const-string v2, "has_phone_number"

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_3

    .line 64
    sget-object v2, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    const-string v4, "contact_id = ?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v11, v5, v6

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 65
    .local v14, "pCur":Landroid/database/Cursor;
    invoke-interface {v14}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 67
    const-string v2, "data1"

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 71
    .local v7, "contactNumber":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/google/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v16

    .line 74
    .local v16, "phoneNumberUtil":Lcom/google/i18n/phonenumbers/PhoneNumberUtil;
    move-object/from16 v0, v16

    invoke-virtual {v0, v7, v8}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;

    move-result-object v15

    .line 75
    .local v15, "phoneNumber":Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;
    sget-object v2, Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;->E164:Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;

    move-object/from16 v0, v16

    invoke-virtual {v0, v15, v2}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->format(Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberFormat;)Ljava/lang/String;

    move-result-object v12

    .line 77
    .local v12, "normalizedNumber":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getNumberType(Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;)Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;

    move-result-object v13

    .line 79
    .local v13, "numberType":Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;
    sget-object v2, Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;->MOBILE:Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;

    if-eq v13, v2, :cond_1

    sget-object v2, Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;->FIXED_LINE_OR_MOBILE:Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;

    if-ne v13, v2, :cond_2

    .line 80
    :cond_1
    move-object/from16 v0, v17

    invoke-interface {v0, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/google/i18n/phonenumbers/NumberParseException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .end local v7    # "contactNumber":Ljava/lang/String;
    .end local v12    # "normalizedNumber":Ljava/lang/String;
    .end local v13    # "numberType":Lcom/google/i18n/phonenumbers/PhoneNumberUtil$PhoneNumberType;
    .end local v15    # "phoneNumber":Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;
    .end local v16    # "phoneNumberUtil":Lcom/google/i18n/phonenumbers/PhoneNumberUtil;
    :cond_2
    :goto_0
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 91
    .end local v14    # "pCur":Landroid/database/Cursor;
    :cond_3
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    .line 93
    .end local v11    # "id":Ljava/lang/String;
    :cond_4
    return-object v17

    .line 82
    .restart local v7    # "contactNumber":Ljava/lang/String;
    .restart local v11    # "id":Ljava/lang/String;
    .restart local v14    # "pCur":Landroid/database/Cursor;
    :catch_0
    move-exception v10

    .line 83
    .local v10, "e":Lcom/google/i18n/phonenumbers/NumberParseException;
    invoke-virtual {v10}, Lcom/google/i18n/phonenumbers/NumberParseException;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V
    .locals 5
    .param p1, "notification"    # Lorg/puremvc/java/multicore/interfaces/INotification;

    .prologue
    const/4 v4, 0x0

    .line 30
    invoke-super {p0, p1}, Lorg/puremvc/java/multicore/patterns/command/SimpleCommand;->execute(Lorg/puremvc/java/multicore/interfaces/INotification;)V

    .line 32
    invoke-interface {p1}, Lorg/puremvc/java/multicore/interfaces/INotification;->getBody()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 34
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;

    invoke-direct {v1, p0, v0}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;-><init>(Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand;Landroid/content/Context;)V

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Void;

    const/4 v3, 0x0

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object v4, v2, v3

    const/4 v3, 0x2

    aput-object v4, v2, v3

    .line 47
    invoke-virtual {v1, v2}, Lco/getair/meerkat/commands/phone_verification/UploadContactsCommand$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 48
    return-void
.end method
