.class public Lco/getair/meerkat/utilities/JSONObjectParser;
.super Ljava/lang/Object;
.source "JSONObjectParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static fromJson(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "json"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 66
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne p0, v0, :cond_1

    .line 67
    const/4 p0, 0x0

    .line 73
    .end local p0    # "json":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-object p0

    .line 68
    .restart local p0    # "json":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_2

    .line 69
    check-cast p0, Lorg/json/JSONObject;

    .end local p0    # "json":Ljava/lang/Object;
    invoke-static {p0}, Lco/getair/meerkat/utilities/JSONObjectParser;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p0

    goto :goto_0

    .line 70
    .restart local p0    # "json":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Lorg/json/JSONArray;

    if-eqz v0, :cond_0

    .line 71
    check-cast p0, Lorg/json/JSONArray;

    .end local p0    # "json":Ljava/lang/Object;
    invoke-static {p0}, Lco/getair/meerkat/utilities/JSONObjectParser;->toList(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object p0

    goto :goto_0
.end method

.method public static getList(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "object"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/utilities/JSONObjectParser;->toList(Lorg/json/JSONArray;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public static getMap(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 1
    .param p0, "object"    # Lorg/json/JSONObject;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {v0}, Lco/getair/meerkat/utilities/JSONObjectParser;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public static isEmptyObject(Lorg/json/JSONObject;)Z
    .locals 1
    .param p0, "object"    # Lorg/json/JSONObject;

    .prologue
    .line 36
    invoke-virtual {p0}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static toJSON(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p0, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 17
    instance-of v4, p0, Ljava/util/HashMap;

    if-eqz v4, :cond_0

    .line 18
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .local v0, "json":Lorg/json/JSONObject;
    move-object v2, p0

    .line 19
    check-cast v2, Ljava/util/HashMap;

    .line 20
    .local v2, "map":Ljava/util/HashMap;
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 21
    .local v1, "key":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lco/getair/meerkat/utilities/JSONObjectParser;->toJSON(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 24
    .end local v0    # "json":Lorg/json/JSONObject;
    .end local v1    # "key":Ljava/lang/Object;
    .end local v2    # "map":Ljava/util/HashMap;
    :cond_0
    instance-of v4, p0, Ljava/lang/Iterable;

    if-eqz v4, :cond_1

    .line 25
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 26
    .local v0, "json":Lorg/json/JSONArray;
    check-cast p0, Ljava/lang/Iterable;

    .end local p0    # "object":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 27
    .local v3, "value":Ljava/lang/Object;
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .end local v0    # "json":Lorg/json/JSONArray;
    .end local v3    # "value":Ljava/lang/Object;
    .restart local p0    # "object":Ljava/lang/Object;
    :cond_1
    move-object v0, p0

    .line 31
    .end local p0    # "object":Ljava/lang/Object;
    :cond_2
    return-object v0
.end method

.method public static toList(Lorg/json/JSONArray;)Ljava/util/ArrayList;
    .locals 3
    .param p0, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .local v1, "list":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 60
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lco/getair/meerkat/utilities/JSONObjectParser;->fromJson(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    :cond_0
    return-object v1
.end method

.method public static toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;
    .locals 4
    .param p0, "object"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 49
    .local v2, "map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 50
    .local v1, "keys":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 51
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 52
    .local v0, "key":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lco/getair/meerkat/utilities/JSONObjectParser;->fromJson(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 54
    .end local v0    # "key":Ljava/lang/String;
    :cond_0
    return-object v2
.end method
