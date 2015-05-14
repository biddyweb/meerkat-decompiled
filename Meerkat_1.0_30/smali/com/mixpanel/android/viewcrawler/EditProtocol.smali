.class Lcom/mixpanel/android/viewcrawler/EditProtocol;
.super Ljava/lang/Object;
.source "EditProtocol.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;,
        Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "MixpanelAPI.EditProtocol"

.field private static final NEVER_MATCH_PATH:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;",
            ">;"
        }
    .end annotation
.end field

.field private static final NO_PARAMS:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field private final mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 277
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->NO_PARAMS:[Ljava/lang/Class;

    .line 278
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->NEVER_MATCH_PATH:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lcom/mixpanel/android/mpmetrics/ResourceIds;)V
    .locals 0
    .param p1, "resourceIds"    # Lcom/mixpanel/android/mpmetrics/ResourceIds;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    .line 43
    return-void
.end method

.method private convertArgument(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p1, "jsonArgument"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
        }
    .end annotation

    .prologue
    .line 256
    :try_start_0
    const-string v3, "java.lang.CharSequence"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 266
    .end local p1    # "jsonArgument":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object p1

    .line 258
    .restart local p1    # "jsonArgument":Ljava/lang/Object;
    :cond_1
    const-string v3, "boolean"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "java.lang.Boolean"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 260
    const-string v3, "int"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "java.lang.Integer"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 261
    :cond_2
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    .line 262
    :cond_3
    const-string v3, "float"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    const-string v3, "java.lang.Float"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 263
    :cond_4
    move-object v0, p1

    check-cast v0, Ljava/lang/Number;

    move-object v3, v0

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    goto :goto_0

    .line 264
    :cond_5
    const-string v3, "android.graphics.Bitmap"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 265
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    move-object v3, v0

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v1

    .line 266
    .local v1, "bytes":[B
    const/4 v3, 0x0

    array-length v4, v1

    invoke-static {v1, v3, v4}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    goto :goto_0

    .line 268
    .end local v1    # "bytes":[B
    :cond_6
    new-instance v3, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Don\'t know how to interpret type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " (arg was "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    :catch_0
    move-exception v2

    .line 271
    .local v2, "e":Ljava/lang/ClassCastException;
    new-instance v3, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t interpret <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "> as "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private readPropertyDescription(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    .locals 11
    .param p2, "propertyDesc"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/mixpanel/android/viewcrawler/PropertyDescription;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
        }
    .end annotation

    .prologue
    .line 224
    .local p1, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_0
    const-string v9, "name"

    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 226
    .local v8, "propName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 227
    .local v0, "accessor":Lcom/mixpanel/android/viewcrawler/Caller;
    const-string v9, "get"

    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 228
    const-string v9, "get"

    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 229
    .local v1, "accessorConfig":Lorg/json/JSONObject;
    const-string v9, "selector"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 230
    .local v2, "accessorName":Ljava/lang/String;
    const-string v9, "result"

    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "type"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 231
    .local v4, "accessorResultTypeName":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 232
    .local v3, "accessorResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/mixpanel/android/viewcrawler/Caller;

    .end local v0    # "accessor":Lcom/mixpanel/android/viewcrawler/Caller;
    sget-object v9, Lcom/mixpanel/android/viewcrawler/EditProtocol;->NO_PARAMS:[Ljava/lang/Class;

    invoke-direct {v0, p1, v2, v9, v3}, Lcom/mixpanel/android/viewcrawler/Caller;-><init>(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Class;)V

    .line 236
    .end local v1    # "accessorConfig":Lorg/json/JSONObject;
    .end local v2    # "accessorName":Ljava/lang/String;
    .end local v3    # "accessorResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "accessorResultTypeName":Ljava/lang/String;
    .restart local v0    # "accessor":Lcom/mixpanel/android/viewcrawler/Caller;
    :cond_0
    const-string v9, "set"

    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 237
    const-string v9, "set"

    invoke-virtual {p2, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 238
    .local v6, "mutatorConfig":Lorg/json/JSONObject;
    const-string v9, "selector"

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 243
    .end local v6    # "mutatorConfig":Lorg/json/JSONObject;
    .local v7, "mutatorName":Ljava/lang/String;
    :goto_0
    new-instance v9, Lcom/mixpanel/android/viewcrawler/PropertyDescription;

    invoke-direct {v9, v8, p1, v0, v7}, Lcom/mixpanel/android/viewcrawler/PropertyDescription;-><init>(Ljava/lang/String;Ljava/lang/Class;Lcom/mixpanel/android/viewcrawler/Caller;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    return-object v9

    .line 240
    .end local v7    # "mutatorName":Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    .restart local v7    # "mutatorName":Ljava/lang/String;
    goto :goto_0

    .line 244
    .end local v0    # "accessor":Lcom/mixpanel/android/viewcrawler/Caller;
    .end local v7    # "mutatorName":Ljava/lang/String;
    .end local v8    # "propName":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 245
    .local v5, "e":Ljava/lang/NoSuchMethodException;
    new-instance v9, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v10, "Can\'t create property reader"

    invoke-direct {v9, v10, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9

    .line 246
    .end local v5    # "e":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v5

    .line 247
    .local v5, "e":Lorg/json/JSONException;
    new-instance v9, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v10, "Can\'t read property JSON"

    invoke-direct {v9, v10, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9

    .line 248
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v5

    .line 249
    .local v5, "e":Ljava/lang/ClassNotFoundException;
    new-instance v9, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v10, "Can\'t read property JSON, relevant arg/return class not found"

    invoke-direct {v9, v10, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v9
.end method

.method private reconcileIdsInPath(ILjava/lang/String;Lcom/mixpanel/android/mpmetrics/ResourceIds;)Ljava/lang/Integer;
    .locals 5
    .param p1, "explicitId"    # I
    .param p2, "idName"    # Ljava/lang/String;
    .param p3, "idNameToId"    # Lcom/mixpanel/android/mpmetrics/ResourceIds;

    .prologue
    const/4 v1, 0x0

    const/4 v3, -0x1

    .line 195
    if-eqz p2, :cond_1

    .line 196
    invoke-interface {p3, p2}, Lcom/mixpanel/android/mpmetrics/ResourceIds;->knownIdName(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    invoke-interface {p3, p2}, Lcom/mixpanel/android/mpmetrics/ResourceIds;->idFromName(Ljava/lang/String;)I

    move-result v0

    .line 210
    .local v0, "idFromName":I
    :goto_0
    if-eq v3, v0, :cond_2

    if-eq v3, p1, :cond_2

    if-eq v0, p1, :cond_2

    .line 211
    const-string v2, "MixpanelAPI.EditProtocol"

    const-string v3, "Path contains both a named and an explicit id, and they don\'t match. No views will be matched."

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    .end local v0    # "idFromName":I
    :goto_1
    return-object v1

    .line 199
    :cond_0
    const-string v2, "MixpanelAPI.EditProtocol"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Path element contains an id name not known to the system. No views will be matched.\nMake sure that you\'re not stripping your packages R class out with proguard.\nid name was \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 207
    :cond_1
    const/4 v0, -0x1

    .restart local v0    # "idFromName":I
    goto :goto_0

    .line 215
    :cond_2
    if-eq v3, v0, :cond_3

    .line 216
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1

    .line 219
    :cond_3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1
.end method


# virtual methods
.method public readEdit(Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    .locals 18
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
        }
    .end annotation

    .prologue
    .line 85
    :try_start_0
    const-string v15, "path"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 86
    .local v10, "pathDesc":Lorg/json/JSONArray;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v15}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readPath(Lorg/json/JSONArray;Lcom/mixpanel/android/mpmetrics/ResourceIds;)Ljava/util/List;

    move-result-object v9

    .line 88
    .local v9, "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v15

    if-nez v15, :cond_0

    .line 89
    new-instance v15, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;

    const-string v16, "Edit will not be bound to any element in the UI."

    invoke-direct/range {v15 .. v16}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;-><init>(Ljava/lang/String;)V

    throw v15
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 118
    .end local v9    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .end local v10    # "pathDesc":Lorg/json/JSONArray;
    :catch_0
    move-exception v4

    .line 119
    .local v4, "e":Ljava/lang/NoSuchMethodException;
    new-instance v15, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v16, "Can\'t create property mutator"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v4}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v15

    .line 92
    .end local v4    # "e":Ljava/lang/NoSuchMethodException;
    .restart local v9    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .restart local v10    # "pathDesc":Lorg/json/JSONArray;
    :cond_0
    :try_start_1
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v15

    add-int/lit8 v15, v15, -0x1

    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;

    .line 93
    .local v11, "pathEnd":Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;
    iget-object v14, v11, Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;->viewClassName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 96
    .local v14, "targetClassName":Ljava/lang/String;
    :try_start_2
    invoke-static {v14}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v13

    .line 101
    .local v13, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_3
    const-string v15, "property"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v15}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readPropertyDescription(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/PropertyDescription;

    move-result-object v12

    .line 103
    .local v12, "prop":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    const-string v15, "args"

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 104
    .local v3, "argsAndTypes":Lorg/json/JSONArray;
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v15

    new-array v7, v15, [Ljava/lang/Object;

    .line 105
    .local v7, "methodArgs":[Ljava/lang/Object;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-ge v5, v15, :cond_1

    .line 106
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    .line 107
    .local v1, "argPlusType":Lorg/json/JSONArray;
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 108
    .local v6, "jsonArg":Ljava/lang/Object;
    const/4 v15, 0x1

    invoke-virtual {v1, v15}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "argType":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v2}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->convertArgument(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    aput-object v15, v7, v5

    .line 105
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 97
    .end local v1    # "argPlusType":Lorg/json/JSONArray;
    .end local v2    # "argType":Ljava/lang/String;
    .end local v3    # "argsAndTypes":Lorg/json/JSONArray;
    .end local v5    # "i":I
    .end local v6    # "jsonArg":Ljava/lang/Object;
    .end local v7    # "methodArgs":[Ljava/lang/Object;
    .end local v12    # "prop":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    .end local v13    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_1
    move-exception v4

    .line 98
    .local v4, "e":Ljava/lang/ClassNotFoundException;
    new-instance v15, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Can\'t find class for visit path: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v4}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v15
    :try_end_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    .line 120
    .end local v4    # "e":Ljava/lang/ClassNotFoundException;
    .end local v9    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .end local v10    # "pathDesc":Lorg/json/JSONArray;
    .end local v11    # "pathEnd":Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;
    .end local v14    # "targetClassName":Ljava/lang/String;
    :catch_2
    move-exception v4

    .line 121
    .local v4, "e":Lorg/json/JSONException;
    new-instance v15, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v16, "Can\'t interpret instructions due to JSONException"

    move-object/from16 v0, v16

    invoke-direct {v15, v0, v4}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v15

    .line 112
    .end local v4    # "e":Lorg/json/JSONException;
    .restart local v3    # "argsAndTypes":Lorg/json/JSONArray;
    .restart local v5    # "i":I
    .restart local v7    # "methodArgs":[Ljava/lang/Object;
    .restart local v9    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .restart local v10    # "pathDesc":Lorg/json/JSONArray;
    .restart local v11    # "pathEnd":Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;
    .restart local v12    # "prop":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    .restart local v13    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v14    # "targetClassName":Ljava/lang/String;
    :cond_1
    :try_start_4
    invoke-virtual {v12, v7}, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->makeMutator([Ljava/lang/Object;)Lcom/mixpanel/android/viewcrawler/Caller;

    move-result-object v8

    .line 113
    .local v8, "mutator":Lcom/mixpanel/android/viewcrawler/Caller;
    if-nez v8, :cond_2

    .line 114
    new-instance v15, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Can\'t update a read-only property "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    iget-object v0, v12, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->name:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " (add a mutator to make this work)"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 117
    :cond_2
    new-instance v15, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;

    iget-object v0, v12, Lcom/mixpanel/android/viewcrawler/PropertyDescription;->accessor:Lcom/mixpanel/android/viewcrawler/Caller;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v15, v9, v8, v0}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$PropertySetVisitor;-><init>(Ljava/util/List;Lcom/mixpanel/android/viewcrawler/Caller;Lcom/mixpanel/android/viewcrawler/Caller;)V
    :try_end_4
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    return-object v15
.end method

.method public readEventBinding(Lorg/json/JSONObject;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)Lcom/mixpanel/android/viewcrawler/ViewVisitor;
    .locals 8
    .param p1, "source"    # Lorg/json/JSONObject;
    .param p2, "listener"    # Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
        }
    .end annotation

    .prologue
    .line 47
    :try_start_0
    const-string v5, "event_name"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "eventName":Ljava/lang/String;
    const-string v5, "event_type"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "eventType":Ljava/lang/String;
    const-string v5, "path"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 51
    .local v4, "pathDesc":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    invoke-virtual {p0, v4, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readPath(Lorg/json/JSONArray;Lcom/mixpanel/android/mpmetrics/ResourceIds;)Ljava/util/List;

    move-result-object v3

    .line 53
    .local v3, "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_0

    .line 54
    new-instance v5, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "event \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\' will not be bound to any element in the UI."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/mixpanel/android/viewcrawler/EditProtocol$InapplicableInstructionsException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .end local v1    # "eventName":Ljava/lang/String;
    .end local v2    # "eventType":Ljava/lang/String;
    .end local v3    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .end local v4    # "pathDesc":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 79
    .local v0, "e":Lorg/json/JSONException;
    new-instance v5, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v6, "Can\'t interpret instructions due to JSONException"

    invoke-direct {v5, v6, v0}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v5

    .line 57
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "eventName":Ljava/lang/String;
    .restart local v2    # "eventType":Ljava/lang/String;
    .restart local v3    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .restart local v4    # "pathDesc":Lorg/json/JSONArray;
    :cond_0
    :try_start_1
    const-string v5, "click"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 58
    new-instance v5, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    const/4 v6, 0x1

    invoke-direct {v5, v3, v6, v1, p2}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;-><init>(Ljava/util/List;ILjava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)V

    .line 74
    :goto_0
    return-object v5

    .line 64
    :cond_1
    const-string v5, "selected"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 65
    new-instance v5, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;

    const/4 v6, 0x4

    invoke-direct {v5, v3, v6, v1, p2}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddAccessibilityEventVisitor;-><init>(Ljava/util/List;ILjava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)V

    goto :goto_0

    .line 71
    :cond_2
    const-string v5, "text_changed"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 72
    new-instance v5, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddTextChangeListener;

    invoke-direct {v5, v3, v1, p2}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$AddTextChangeListener;-><init>(Ljava/util/List;Ljava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)V

    goto :goto_0

    .line 73
    :cond_3
    const-string v5, "detected"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 74
    new-instance v5, Lcom/mixpanel/android/viewcrawler/ViewVisitor$ViewDetectorVisitor;

    invoke-direct {v5, v3, v1, p2}, Lcom/mixpanel/android/viewcrawler/ViewVisitor$ViewDetectorVisitor;-><init>(Ljava/util/List;Ljava/lang/String;Lcom/mixpanel/android/viewcrawler/ViewVisitor$OnEventListener;)V

    goto :goto_0

    .line 76
    :cond_4
    new-instance v5, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Mixpanel can\'t track event type \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method readPath(Lorg/json/JSONArray;Lcom/mixpanel/android/mpmetrics/ResourceIds;)Ljava/util/List;
    .locals 18
    .param p1, "pathDesc"    # Lorg/json/JSONArray;
    .param p2, "idNameToId"    # Lcom/mixpanel/android/mpmetrics/ResourceIds;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            "Lcom/mixpanel/android/mpmetrics/ResourceIds;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 154
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v10, "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v9, v2, :cond_0

    .line 157
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    .line 159
    .local v15, "targetView":Lorg/json/JSONObject;
    const-string v2, "prefix"

    invoke-static {v15, v2}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 160
    .local v11, "prefixCode":Ljava/lang/String;
    const-string v2, "view_class"

    invoke-static {v15, v2}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 161
    .local v4, "targetViewClass":Ljava/lang/String;
    const-string v2, "index"

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v15, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    .line 162
    .local v5, "targetIndex":I
    const-string v2, "contentDescription"

    invoke-static {v15, v2}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 163
    .local v7, "targetDescription":Ljava/lang/String;
    const-string v2, "id"

    const/16 v16, -0x1

    move/from16 v0, v16

    invoke-virtual {v15, v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v12

    .line 164
    .local v12, "targetExplicitId":I
    const-string v2, "mp_id_name"

    invoke-static {v15, v2}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 165
    .local v13, "targetIdName":Ljava/lang/String;
    const-string v2, "tag"

    invoke-static {v15, v2}, Lcom/mixpanel/android/util/JSONUtils;->optionalStringKey(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 168
    .local v8, "targetTag":Ljava/lang/String;
    const-string v2, "shortest"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 169
    const/4 v3, 0x1

    .line 179
    .local v3, "prefix":I
    :goto_1
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v12, v13, v1}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->reconcileIdsInPath(ILjava/lang/String;Lcom/mixpanel/android/mpmetrics/ResourceIds;)Ljava/lang/Integer;

    move-result-object v14

    .line 180
    .local v14, "targetIdOrNull":Ljava/lang/Integer;
    if-nez v14, :cond_3

    .line 181
    sget-object v10, Lcom/mixpanel/android/viewcrawler/EditProtocol;->NEVER_MATCH_PATH:Ljava/util/List;

    .line 189
    .end local v3    # "prefix":I
    .end local v4    # "targetViewClass":Ljava/lang/String;
    .end local v5    # "targetIndex":I
    .end local v7    # "targetDescription":Ljava/lang/String;
    .end local v8    # "targetTag":Ljava/lang/String;
    .end local v10    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .end local v11    # "prefixCode":Ljava/lang/String;
    .end local v12    # "targetExplicitId":I
    .end local v13    # "targetIdName":Ljava/lang/String;
    .end local v14    # "targetIdOrNull":Ljava/lang/Integer;
    .end local v15    # "targetView":Lorg/json/JSONObject;
    :cond_0
    :goto_2
    return-object v10

    .line 170
    .restart local v4    # "targetViewClass":Ljava/lang/String;
    .restart local v5    # "targetIndex":I
    .restart local v7    # "targetDescription":Ljava/lang/String;
    .restart local v8    # "targetTag":Ljava/lang/String;
    .restart local v10    # "path":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;>;"
    .restart local v11    # "prefixCode":Ljava/lang/String;
    .restart local v12    # "targetExplicitId":I
    .restart local v13    # "targetIdName":Ljava/lang/String;
    .restart local v15    # "targetView":Lorg/json/JSONObject;
    :cond_1
    if-nez v11, :cond_2

    .line 171
    const/4 v3, 0x0

    .restart local v3    # "prefix":I
    goto :goto_1

    .line 173
    .end local v3    # "prefix":I
    :cond_2
    const-string v2, "MixpanelAPI.EditProtocol"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Unrecognized prefix type \""

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "\". No views will be matched"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    sget-object v10, Lcom/mixpanel/android/viewcrawler/EditProtocol;->NEVER_MATCH_PATH:Ljava/util/List;

    goto :goto_2

    .line 183
    .restart local v3    # "prefix":I
    .restart local v14    # "targetIdOrNull":Ljava/lang/Integer;
    :cond_3
    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 186
    .local v6, "targetId":I
    new-instance v2, Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;

    invoke-direct/range {v2 .. v8}, Lcom/mixpanel/android/viewcrawler/Pathfinder$PathElement;-><init>(ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v10, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_0
.end method

.method public readSnapshotConfig(Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/ViewSnapshot;
    .locals 14
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;
        }
    .end annotation

    .prologue
    .line 126
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v7, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/mixpanel/android/viewcrawler/PropertyDescription;>;"
    :try_start_0
    const-string v12, "config"

    invoke-virtual {p1, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 130
    .local v3, "config":Lorg/json/JSONObject;
    const-string v12, "classes"

    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 131
    .local v2, "classes":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "classIx":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v1, v12, :cond_1

    .line 132
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    .line 133
    .local v0, "classDesc":Lorg/json/JSONObject;
    const-string v12, "name"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 134
    .local v11, "targetClassName":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 136
    .local v10, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v12, "properties"

    invoke-virtual {v0, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    .line 137
    .local v9, "propertyDescs":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v6, v12, :cond_0

    .line 138
    invoke-virtual {v9, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 139
    .local v8, "propertyDesc":Lorg/json/JSONObject;
    invoke-direct {p0, v10, v8}, Lcom/mixpanel/android/viewcrawler/EditProtocol;->readPropertyDescription(Ljava/lang/Class;Lorg/json/JSONObject;)Lcom/mixpanel/android/viewcrawler/PropertyDescription;

    move-result-object v4

    .line 140
    .local v4, "desc":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 131
    .end local v4    # "desc":Lcom/mixpanel/android/viewcrawler/PropertyDescription;
    .end local v8    # "propertyDesc":Lorg/json/JSONObject;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 144
    .end local v0    # "classDesc":Lorg/json/JSONObject;
    .end local v6    # "i":I
    .end local v9    # "propertyDescs":Lorg/json/JSONArray;
    .end local v10    # "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v11    # "targetClassName":Ljava/lang/String;
    :cond_1
    new-instance v12, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;

    iget-object v13, p0, Lcom/mixpanel/android/viewcrawler/EditProtocol;->mResourceIds:Lcom/mixpanel/android/mpmetrics/ResourceIds;

    invoke-direct {v12, v7, v13}, Lcom/mixpanel/android/viewcrawler/ViewSnapshot;-><init>(Ljava/util/List;Lcom/mixpanel/android/mpmetrics/ResourceIds;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v12

    .line 145
    .end local v1    # "classIx":I
    .end local v2    # "classes":Lorg/json/JSONArray;
    .end local v3    # "config":Lorg/json/JSONObject;
    :catch_0
    move-exception v5

    .line 146
    .local v5, "e":Lorg/json/JSONException;
    new-instance v12, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v13, "Can\'t read snapshot configuration"

    invoke-direct {v12, v13, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12

    .line 147
    .end local v5    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v5

    .line 148
    .local v5, "e":Ljava/lang/ClassNotFoundException;
    new-instance v12, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;

    const-string v13, "Can\'t resolve types for snapshot configuration"

    invoke-direct {v12, v13, v5}, Lcom/mixpanel/android/viewcrawler/EditProtocol$BadInstructionsException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v12
.end method
