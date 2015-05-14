package com.google.android.gms.analytics;

import android.text.TextUtils;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class HitBuilders
{
  @Deprecated
  public static class AppViewBuilder extends HitBuilders.HitBuilder<AppViewBuilder>
  {
    public AppViewBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzEf);
      set("&t", "screenview");
    }
  }

  public static class EventBuilder extends HitBuilders.HitBuilder<EventBuilder>
  {
    public EventBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDT);
      set("&t", "event");
    }

    public EventBuilder(String paramString1, String paramString2)
    {
      this();
      setCategory(paramString1);
      setAction(paramString2);
    }

    public EventBuilder setAction(String paramString)
    {
      set("&ea", paramString);
      return this;
    }

    public EventBuilder setCategory(String paramString)
    {
      set("&ec", paramString);
      return this;
    }

    public EventBuilder setLabel(String paramString)
    {
      set("&el", paramString);
      return this;
    }

    public EventBuilder setValue(long paramLong)
    {
      set("&ev", Long.toString(paramLong));
      return this;
    }
  }

  public static class ExceptionBuilder extends HitBuilders.HitBuilder<ExceptionBuilder>
  {
    public ExceptionBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDC);
      set("&t", "exception");
    }

    public ExceptionBuilder setDescription(String paramString)
    {
      set("&exd", paramString);
      return this;
    }

    public ExceptionBuilder setFatal(boolean paramBoolean)
    {
      set("&exf", zzan.zzG(paramBoolean));
      return this;
    }
  }

  protected static class HitBuilder<T extends HitBuilder>
  {
    private Map<String, String> zzED = new HashMap();
    ProductAction zzEE;
    Map<String, List<Product>> zzEF = new HashMap();
    List<Promotion> zzEG = new ArrayList();
    List<Product> zzEH = new ArrayList();

    public T addImpression(Product paramProduct, String paramString)
    {
      if (paramProduct == null)
      {
        zzae.zzac("product should be non-null");
        return this;
      }
      if (paramString == null)
        paramString = "";
      if (!this.zzEF.containsKey(paramString))
        this.zzEF.put(paramString, new ArrayList());
      ((List)this.zzEF.get(paramString)).add(paramProduct);
      return this;
    }

    public T addProduct(Product paramProduct)
    {
      if (paramProduct == null)
      {
        zzae.zzac("product should be non-null");
        return this;
      }
      this.zzEH.add(paramProduct);
      return this;
    }

    public T addPromotion(Promotion paramPromotion)
    {
      if (paramPromotion == null)
      {
        zzae.zzac("promotion should be non-null");
        return this;
      }
      this.zzEG.add(paramPromotion);
      return this;
    }

    public Map<String, String> build()
    {
      HashMap localHashMap = new HashMap(this.zzED);
      if (this.zzEE != null)
        localHashMap.putAll(this.zzEE.build());
      Iterator localIterator1 = this.zzEG.iterator();
      for (int i = 1; localIterator1.hasNext(); i++)
        localHashMap.putAll(((Promotion)localIterator1.next()).zzaw(zzs.zzH(i)));
      Iterator localIterator2 = this.zzEH.iterator();
      for (int j = 1; localIterator2.hasNext(); j++)
        localHashMap.putAll(((Product)localIterator2.next()).zzaw(zzs.zzG(j)));
      Iterator localIterator3 = this.zzEF.entrySet().iterator();
      for (int k = 1; localIterator3.hasNext(); k++)
      {
        Map.Entry localEntry = (Map.Entry)localIterator3.next();
        List localList = (List)localEntry.getValue();
        String str = zzs.zzJ(k);
        Iterator localIterator4 = localList.iterator();
        for (int m = 1; localIterator4.hasNext(); m++)
          localHashMap.putAll(((Product)localIterator4.next()).zzaw(str + zzs.zzI(m)));
        if (!TextUtils.isEmpty((CharSequence)localEntry.getKey()))
          localHashMap.put(str + "nm", localEntry.getKey());
      }
      return localHashMap;
    }

    protected String get(String paramString)
    {
      return (String)this.zzED.get(paramString);
    }

    public final T set(String paramString1, String paramString2)
    {
      zzy.zzfV().zza(zzy.zza.zzCV);
      if (paramString1 != null)
      {
        this.zzED.put(paramString1, paramString2);
        return this;
      }
      zzae.zzac(" HitBuilder.set() called with a null paramName.");
      return this;
    }

    public final T setAll(Map<String, String> paramMap)
    {
      zzy.zzfV().zza(zzy.zza.zzCW);
      if (paramMap == null)
        return this;
      this.zzED.putAll(new HashMap(paramMap));
      return this;
    }

    public T setCampaignParamsFromUrl(String paramString)
    {
      zzy.zzfV().zza(zzy.zza.zzCY);
      String str = zzan.zzau(paramString);
      if (TextUtils.isEmpty(str))
        return this;
      Map localMap = zzan.zzat(str);
      set("&cc", (String)localMap.get("utm_content"));
      set("&cm", (String)localMap.get("utm_medium"));
      set("&cn", (String)localMap.get("utm_campaign"));
      set("&cs", (String)localMap.get("utm_source"));
      set("&ck", (String)localMap.get("utm_term"));
      set("&ci", (String)localMap.get("utm_id"));
      set("&gclid", (String)localMap.get("gclid"));
      set("&dclid", (String)localMap.get("dclid"));
      set("&gmob_t", (String)localMap.get("gmob_t"));
      return this;
    }

    public T setCustomDimension(int paramInt, String paramString)
    {
      set(zzs.zzE(paramInt), paramString);
      return this;
    }

    public T setCustomMetric(int paramInt, float paramFloat)
    {
      set(zzs.zzF(paramInt), Float.toString(paramFloat));
      return this;
    }

    protected T setHitType(String paramString)
    {
      set("&t", paramString);
      return this;
    }

    public T setNewSession()
    {
      set("&sc", "start");
      return this;
    }

    public T setNonInteraction(boolean paramBoolean)
    {
      set("&ni", zzan.zzG(paramBoolean));
      return this;
    }

    public T setProductAction(ProductAction paramProductAction)
    {
      this.zzEE = paramProductAction;
      return this;
    }

    public T setPromotionAction(String paramString)
    {
      this.zzED.put("&promoa", paramString);
      return this;
    }
  }

  @Deprecated
  public static class ItemBuilder extends HitBuilders.HitBuilder<ItemBuilder>
  {
    public ItemBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDU);
      set("&t", "item");
    }

    public ItemBuilder setCategory(String paramString)
    {
      set("&iv", paramString);
      return this;
    }

    public ItemBuilder setCurrencyCode(String paramString)
    {
      set("&cu", paramString);
      return this;
    }

    public ItemBuilder setName(String paramString)
    {
      set("&in", paramString);
      return this;
    }

    public ItemBuilder setPrice(double paramDouble)
    {
      set("&ip", Double.toString(paramDouble));
      return this;
    }

    public ItemBuilder setQuantity(long paramLong)
    {
      set("&iq", Long.toString(paramLong));
      return this;
    }

    public ItemBuilder setSku(String paramString)
    {
      set("&ic", paramString);
      return this;
    }

    public ItemBuilder setTransactionId(String paramString)
    {
      set("&ti", paramString);
      return this;
    }
  }

  public static class ScreenViewBuilder extends HitBuilders.HitBuilder<ScreenViewBuilder>
  {
    public ScreenViewBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzEf);
      set("&t", "screenview");
    }
  }

  public static class SocialBuilder extends HitBuilders.HitBuilder<SocialBuilder>
  {
    public SocialBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDF);
      set("&t", "social");
    }

    public SocialBuilder setAction(String paramString)
    {
      set("&sa", paramString);
      return this;
    }

    public SocialBuilder setNetwork(String paramString)
    {
      set("&sn", paramString);
      return this;
    }

    public SocialBuilder setTarget(String paramString)
    {
      set("&st", paramString);
      return this;
    }
  }

  public static class TimingBuilder extends HitBuilders.HitBuilder<TimingBuilder>
  {
    public TimingBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDE);
      set("&t", "timing");
    }

    public TimingBuilder(String paramString1, String paramString2, long paramLong)
    {
      this();
      setVariable(paramString2);
      setValue(paramLong);
      setCategory(paramString1);
    }

    public TimingBuilder setCategory(String paramString)
    {
      set("&utc", paramString);
      return this;
    }

    public TimingBuilder setLabel(String paramString)
    {
      set("&utl", paramString);
      return this;
    }

    public TimingBuilder setValue(long paramLong)
    {
      set("&utt", Long.toString(paramLong));
      return this;
    }

    public TimingBuilder setVariable(String paramString)
    {
      set("&utv", paramString);
      return this;
    }
  }

  @Deprecated
  public static class TransactionBuilder extends HitBuilders.HitBuilder<TransactionBuilder>
  {
    public TransactionBuilder()
    {
      zzy.zzfV().zza(zzy.zza.zzDB);
      set("&t", "transaction");
    }

    public TransactionBuilder setAffiliation(String paramString)
    {
      set("&ta", paramString);
      return this;
    }

    public TransactionBuilder setCurrencyCode(String paramString)
    {
      set("&cu", paramString);
      return this;
    }

    public TransactionBuilder setRevenue(double paramDouble)
    {
      set("&tr", Double.toString(paramDouble));
      return this;
    }

    public TransactionBuilder setShipping(double paramDouble)
    {
      set("&ts", Double.toString(paramDouble));
      return this;
    }

    public TransactionBuilder setTax(double paramDouble)
    {
      set("&tt", Double.toString(paramDouble));
      return this;
    }

    public TransactionBuilder setTransactionId(String paramString)
    {
      set("&ti", paramString);
      return this;
    }
  }
}