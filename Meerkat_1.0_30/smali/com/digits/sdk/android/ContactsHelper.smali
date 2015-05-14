.class Lcom/digits/sdk/android/ContactsHelper;
.super Ljava/lang/Object;
.source "ContactsHelper.java"


# static fields
.field private static final MAX_CONTACTS:I = 0x9c4

.field private static final allProjectionColumns:[Ljava/lang/String;

.field private static final selectionArgs:[Ljava/lang/String;

.field private static final selectionQuery:Ljava/lang/String; = "mimetype=? OR mimetype=? OR mimetype=?"


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 26
    const/16 v0, 0xd

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "mimetype"

    aput-object v1, v0, v3

    const-string v1, "lookup"

    aput-object v1, v0, v4

    const-string v1, "data2"

    aput-object v1, v0, v5

    const-string v1, "data3"

    aput-object v1, v0, v6

    const/4 v1, 0x4

    const-string v2, "is_primary"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "data2"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "data3"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "is_primary"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "data1"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "data2"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "data3"

    aput-object v2, v0, v1

    sput-object v0, Lcom/digits/sdk/android/ContactsHelper;->allProjectionColumns:[Ljava/lang/String;

    .line 36
    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "vnd.android.cursor.item/phone_v2"

    aput-object v1, v0, v3

    const-string v1, "vnd.android.cursor.item/email_v2"

    aput-object v1, v0, v4

    const-string v1, "vnd.android.cursor.item/name"

    aput-object v1, v0, v5

    sput-object v0, Lcom/digits/sdk/android/ContactsHelper;->selectionArgs:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/digits/sdk/android/ContactsHelper;->context:Landroid/content/Context;

    .line 44
    return-void
.end method

.method private processContactsMap(Ljava/util/Map;)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "mapContactsData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v11, "vCards":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 111
    .local v2, "contactMimeTypeMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    new-instance v1, Lcom/digits/sdk/vcard/VCardBuilder;

    const v13, -0x3fffffff    # -2.0000002f

    const-string v14, "UTF-8"

    invoke-direct {v1, v13, v14}, Lcom/digits/sdk/vcard/VCardBuilder;-><init>(ILjava/lang/String;)V

    .line 113
    .local v1, "builder":Lcom/digits/sdk/vcard/VCardBuilder;
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_0
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 114
    .local v9, "key":Ljava/lang/String;
    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 115
    .local v3, "contentValuesList":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const/4 v6, 0x0

    .line 116
    .local v6, "hasPhoneOrEmail":Z
    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 117
    invoke-virtual {v1}, Lcom/digits/sdk/vcard/VCardBuilder;->clear()V

    .line 118
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/ContentValues;

    .line 119
    .local v4, "cv":Landroid/content/ContentValues;
    const-string v13, "mimetype"

    invoke-virtual {v4, v13}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 120
    .local v10, "mimeType":Ljava/lang/String;
    const-string v13, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string v13, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v13, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 122
    :cond_1
    const/4 v6, 0x1

    .line 124
    :cond_2
    invoke-interface {v2, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 125
    .local v5, "group":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    if-nez v5, :cond_3

    .line 126
    new-instance v5, Ljava/util/ArrayList;

    .end local v5    # "group":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .restart local v5    # "group":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-interface {v2, v10, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    :cond_3
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 131
    .end local v4    # "cv":Landroid/content/ContentValues;
    .end local v5    # "group":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    .end local v10    # "mimeType":Ljava/lang/String;
    :cond_4
    if-eqz v6, :cond_0

    .line 135
    const-string v13, "vnd.android.cursor.item/name"

    invoke-interface {v2, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    invoke-virtual {v1, v13}, Lcom/digits/sdk/vcard/VCardBuilder;->appendNameProperties(Ljava/util/List;)Lcom/digits/sdk/vcard/VCardBuilder;

    move-result-object v14

    const-string v13, "vnd.android.cursor.item/phone_v2"

    invoke-interface {v2, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    const/4 v15, 0x0

    invoke-virtual {v14, v13, v15}, Lcom/digits/sdk/vcard/VCardBuilder;->appendPhones(Ljava/util/List;Lcom/digits/sdk/vcard/VCardPhoneNumberTranslationCallback;)Lcom/digits/sdk/vcard/VCardBuilder;

    move-result-object v14

    const-string v13, "vnd.android.cursor.item/email_v2"

    invoke-interface {v2, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    invoke-virtual {v14, v13}, Lcom/digits/sdk/vcard/VCardBuilder;->appendEmails(Ljava/util/List;)Lcom/digits/sdk/vcard/VCardBuilder;

    .line 140
    invoke-virtual {v1}, Lcom/digits/sdk/vcard/VCardBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 141
    .local v12, "vcard":Ljava/lang/String;
    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    .line 144
    .end local v3    # "contentValuesList":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    .end local v6    # "hasPhoneOrEmail":Z
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v9    # "key":Ljava/lang/String;
    .end local v12    # "vcard":Ljava/lang/String;
    :cond_5
    return-object v11
.end method


# virtual methods
.method public createContactList(Landroid/database/Cursor;)Ljava/util/List;
    .locals 9
    .param p1, "cursor"    # Landroid/database/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 59
    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v7

    if-nez v7, :cond_1

    .line 60
    :cond_0
    sget-object v7, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 105
    :goto_0
    return-object v7

    .line 63
    :cond_1
    const-string v7, "mimetype"

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 64
    .local v6, "mimeTypeColumnIndex":I
    const-string v7, "lookup"

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 66
    .local v3, "lookupKeyColumnIndex":I
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 67
    .local v4, "mapContactsData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Landroid/content/ContentValues;>;>;"
    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 68
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 69
    .local v5, "mimeType":Ljava/lang/String;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 70
    .local v1, "cv":Landroid/content/ContentValues;
    const-string v7, "mimetype"

    invoke-virtual {v1, v7, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    const/4 v7, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_2
    :goto_2
    packed-switch v7, :pswitch_data_0

    goto :goto_1

    .line 73
    :pswitch_0
    const-string v7, "data2"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorIntToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 74
    const-string v7, "data3"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 75
    const-string v7, "is_primary"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorIntToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 76
    const-string v7, "data1"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 96
    :goto_3
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "lookupKey":Ljava/lang/String;
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 98
    .local v0, "contactDetails":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    if-nez v0, :cond_3

    .line 99
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "contactDetails":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .restart local v0    # "contactDetails":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    invoke-interface {v4, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_3
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 71
    .end local v0    # "contactDetails":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    .end local v2    # "lookupKey":Ljava/lang/String;
    :sswitch_0
    const-string v8, "vnd.android.cursor.item/phone_v2"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const/4 v7, 0x0

    goto :goto_2

    :sswitch_1
    const-string v8, "vnd.android.cursor.item/email_v2"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const/4 v7, 0x1

    goto :goto_2

    :sswitch_2
    const-string v8, "vnd.android.cursor.item/name"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    const/4 v7, 0x2

    goto :goto_2

    .line 79
    :pswitch_1
    const-string v7, "data1"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 80
    const-string v7, "data2"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorIntToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 81
    const-string v7, "data3"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 82
    const-string v7, "is_primary"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorIntToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    goto :goto_3

    .line 85
    :pswitch_2
    const-string v7, "data1"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 87
    const-string v7, "data2"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    .line 89
    const-string v7, "data3"

    invoke-static {p1, v1, v7}, Landroid/database/DatabaseUtils;->cursorStringToContentValuesIfPresent(Landroid/database/Cursor;Landroid/content/ContentValues;Ljava/lang/String;)V

    goto :goto_3

    .line 105
    .end local v1    # "cv":Landroid/content/ContentValues;
    .end local v5    # "mimeType":Ljava/lang/String;
    :cond_4
    invoke-direct {p0, v4}, Lcom/digits/sdk/android/ContactsHelper;->processContactsMap(Ljava/util/Map;)Ljava/util/List;

    move-result-object v7

    goto/16 :goto_0

    .line 71
    nop

    :sswitch_data_0
    .sparse-switch
        -0x5d8d3afc -> :sswitch_1
        -0x4053a7f0 -> :sswitch_2
        0x28c7a9f2 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public getContactsCursor()Landroid/database/Cursor;
    .locals 7

    .prologue
    .line 48
    new-instance v6, Ljava/util/HashSet;

    sget-object v0, Lcom/digits/sdk/android/ContactsHelper;->allProjectionColumns:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 49
    .local v6, "tempSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/HashSet;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 51
    .local v2, "projectionColumns":[Ljava/lang/String;
    sget-object v0, Landroid/provider/ContactsContract$Data;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v3, "limit"

    const/16 v4, 0x9c4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    .line 54
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/digits/sdk/android/ContactsHelper;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "mimetype=? OR mimetype=? OR mimetype=?"

    sget-object v4, Lcom/digits/sdk/android/ContactsHelper;->selectionArgs:[Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0
.end method
