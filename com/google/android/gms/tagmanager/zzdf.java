package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.analytics.HitBuilders.ScreenViewBuilder;
import com.google.android.gms.analytics.Tracker;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.internal.zza;
import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class zzdf extends zzdc
{
  private static final String ID = zza.zzaO.toString();
  private static final String zzaBA = zzb.zzeN.toString();
  private static final String zzaBB = zzb.zzeQ.toString();
  private static final String zzaBC = zzb.zzeS.toString();
  private static final List<String> zzaBD = Arrays.asList(new String[] { "detail", "checkout", "checkout_option", "click", "add", "remove", "purchase", "refund" });
  private static final Pattern zzaBE = Pattern.compile("dimension(\\d+)");
  private static final Pattern zzaBF = Pattern.compile("metric(\\d+)");
  private static Map<String, String> zzaBG;
  private static Map<String, String> zzaBH;
  private static final String zzaBu = zzb.zzbj.toString();
  private static final String zzaBv = zzb.zzbs.toString();
  private static final String zzaBw = zzb.zzcE.toString();
  private static final String zzaBx = zzb.zzcz.toString();
  private static final String zzaBy = zzb.zzcy.toString();
  private static final String zzaBz = zzb.zzbr.toString();
  private final Set<String> zzaBI;
  private final zzdb zzaBJ;
  private final DataLayer zzaxx;

  public zzdf(Context paramContext, DataLayer paramDataLayer)
  {
    this(paramContext, paramDataLayer, new zzdb(paramContext));
  }

  zzdf(Context paramContext, DataLayer paramDataLayer, zzdb paramzzdb)
  {
    super(ID, new String[0]);
    this.zzaxx = paramDataLayer;
    this.zzaBJ = paramzzdb;
    this.zzaBI = new HashSet();
    this.zzaBI.add("");
    this.zzaBI.add("0");
    this.zzaBI.add("false");
  }

  private Double zzB(Object paramObject)
  {
    if ((paramObject instanceof String))
      try
      {
        Double localDouble = Double.valueOf((String)paramObject);
        return localDouble;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new RuntimeException("Cannot convert the object to Double: " + localNumberFormatException.getMessage());
      }
    if ((paramObject instanceof Integer))
      return Double.valueOf(((Integer)paramObject).doubleValue());
    if ((paramObject instanceof Double))
      return (Double)paramObject;
    throw new RuntimeException("Cannot convert the object to Double: " + paramObject.toString());
  }

  private Integer zzC(Object paramObject)
  {
    if ((paramObject instanceof String))
      try
      {
        Integer localInteger = Integer.valueOf((String)paramObject);
        return localInteger;
      }
      catch (NumberFormatException localNumberFormatException)
      {
        throw new RuntimeException("Cannot convert the object to Integer: " + localNumberFormatException.getMessage());
      }
    if ((paramObject instanceof Double))
      return Integer.valueOf(((Double)paramObject).intValue());
    if ((paramObject instanceof Integer))
      return (Integer)paramObject;
    throw new RuntimeException("Cannot convert the object to Integer: " + paramObject.toString());
  }

  private Promotion zzR(Map<String, String> paramMap)
  {
    Promotion localPromotion = new Promotion();
    String str1 = (String)paramMap.get("id");
    if (str1 != null)
      localPromotion.setId(String.valueOf(str1));
    String str2 = (String)paramMap.get("name");
    if (str2 != null)
      localPromotion.setName(String.valueOf(str2));
    String str3 = (String)paramMap.get("creative");
    if (str3 != null)
      localPromotion.setCreative(String.valueOf(str3));
    String str4 = (String)paramMap.get("position");
    if (str4 != null)
      localPromotion.setPosition(String.valueOf(str4));
    return localPromotion;
  }

  private Product zzS(Map<String, Object> paramMap)
  {
    Product localProduct = new Product();
    Object localObject1 = paramMap.get("id");
    if (localObject1 != null)
      localProduct.setId(String.valueOf(localObject1));
    Object localObject2 = paramMap.get("name");
    if (localObject2 != null)
      localProduct.setName(String.valueOf(localObject2));
    Object localObject3 = paramMap.get("brand");
    if (localObject3 != null)
      localProduct.setBrand(String.valueOf(localObject3));
    Object localObject4 = paramMap.get("category");
    if (localObject4 != null)
      localProduct.setCategory(String.valueOf(localObject4));
    Object localObject5 = paramMap.get("variant");
    if (localObject5 != null)
      localProduct.setVariant(String.valueOf(localObject5));
    Object localObject6 = paramMap.get("coupon");
    if (localObject6 != null)
      localProduct.setCouponCode(String.valueOf(localObject6));
    Object localObject7 = paramMap.get("position");
    if (localObject7 != null)
      localProduct.setPosition(zzC(localObject7).intValue());
    Object localObject8 = paramMap.get("price");
    if (localObject8 != null)
      localProduct.setPrice(zzB(localObject8).doubleValue());
    Object localObject9 = paramMap.get("quantity");
    if (localObject9 != null)
      localProduct.setQuantity(zzC(localObject9).intValue());
    Iterator localIterator = paramMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      Matcher localMatcher1 = zzaBE.matcher(str);
      if (localMatcher1.matches())
      {
        try
        {
          int j = Integer.parseInt(localMatcher1.group(1));
          localProduct.setCustomDimension(j, String.valueOf(paramMap.get(str)));
        }
        catch (NumberFormatException localNumberFormatException2)
        {
          zzbf.zzac("illegal number in custom dimension value: " + str);
        }
      }
      else
      {
        Matcher localMatcher2 = zzaBF.matcher(str);
        if (localMatcher2.matches())
          try
          {
            int i = Integer.parseInt(localMatcher2.group(1));
            localProduct.setCustomMetric(i, zzC(paramMap.get(str)).intValue());
          }
          catch (NumberFormatException localNumberFormatException1)
          {
            zzbf.zzac("illegal number in custom metric value: " + str);
          }
      }
    }
    return localProduct;
  }

  private Map<String, String> zzT(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza = (zzd.zza)paramMap.get(zzaBB);
    if (localzza != null)
      return zzc(localzza);
    if (zzaBG == null)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("transactionId", "&ti");
      localHashMap.put("transactionAffiliation", "&ta");
      localHashMap.put("transactionTax", "&tt");
      localHashMap.put("transactionShipping", "&ts");
      localHashMap.put("transactionTotal", "&tr");
      localHashMap.put("transactionCurrency", "&cu");
      zzaBG = localHashMap;
    }
    return zzaBG;
  }

  private Map<String, String> zzU(Map<String, zzd.zza> paramMap)
  {
    zzd.zza localzza = (zzd.zza)paramMap.get(zzaBC);
    if (localzza != null)
      return zzc(localzza);
    if (zzaBH == null)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("name", "&in");
      localHashMap.put("sku", "&ic");
      localHashMap.put("category", "&iv");
      localHashMap.put("price", "&ip");
      localHashMap.put("quantity", "&iq");
      localHashMap.put("currency", "&cu");
      zzaBH = localHashMap;
    }
    return zzaBH;
  }

  private void zza(Tracker paramTracker, Map<String, zzd.zza> paramMap)
  {
    String str = zzdt("transactionId");
    if (str == null)
      zzbf.zzZ("Cannot find transactionId in data layer.");
    while (true)
    {
      return;
      LinkedList localLinkedList = new LinkedList();
      Map localMap1;
      try
      {
        localMap1 = zzm((zzd.zza)paramMap.get(zzaBz));
        localMap1.put("&t", "transaction");
        Iterator localIterator1 = zzT(paramMap).entrySet().iterator();
        while (localIterator1.hasNext())
        {
          Map.Entry localEntry2 = (Map.Entry)localIterator1.next();
          zzb(localMap1, (String)localEntry2.getValue(), zzdt((String)localEntry2.getKey()));
        }
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        zzbf.zzb("Unable to send transaction", localIllegalArgumentException);
        return;
      }
      localLinkedList.add(localMap1);
      List localList = zzdu("transactionProducts");
      if (localList != null)
      {
        Iterator localIterator2 = localList.iterator();
        while (localIterator2.hasNext())
        {
          Map localMap2 = (Map)localIterator2.next();
          if (localMap2.get("name") == null)
          {
            zzbf.zzZ("Unable to send transaction item hit due to missing 'name' field.");
            return;
          }
          Map localMap3 = zzm((zzd.zza)paramMap.get(zzaBz));
          localMap3.put("&t", "item");
          localMap3.put("&ti", str);
          Iterator localIterator4 = zzU(paramMap).entrySet().iterator();
          while (localIterator4.hasNext())
          {
            Map.Entry localEntry1 = (Map.Entry)localIterator4.next();
            zzb(localMap3, (String)localEntry1.getValue(), (String)localMap2.get(localEntry1.getKey()));
          }
          localLinkedList.add(localMap3);
        }
      }
      Iterator localIterator3 = localLinkedList.iterator();
      while (localIterator3.hasNext())
        paramTracker.send((Map)localIterator3.next());
    }
  }

  private void zzb(Tracker paramTracker, Map<String, zzd.zza> paramMap)
  {
    HitBuilders.ScreenViewBuilder localScreenViewBuilder = new HitBuilders.ScreenViewBuilder();
    Map localMap1 = zzm((zzd.zza)paramMap.get(zzaBz));
    localScreenViewBuilder.setAll(localMap1);
    Object localObject4;
    if (zzf(paramMap, zzaBx))
    {
      localObject4 = this.zzaxx.get("ecommerce");
      if (!(localObject4 instanceof Map))
        break label756;
    }
    label685: label744: label750: label756: for (Map localMap7 = (Map)localObject4; ; localMap7 = null)
    {
      Map localMap2 = localMap7;
      while (true)
      {
        List localList1;
        if (localMap2 != null)
        {
          String str1 = (String)localMap1.get("&cu");
          if (str1 == null)
            str1 = (String)localMap2.get("currencyCode");
          if (str1 != null)
            localScreenViewBuilder.set("&cu", str1);
          Object localObject2 = localMap2.get("impressions");
          if ((localObject2 instanceof List))
          {
            Iterator localIterator4 = ((List)localObject2).iterator();
            while (true)
              if (localIterator4.hasNext())
              {
                Map localMap6 = (Map)localIterator4.next();
                try
                {
                  localScreenViewBuilder.addImpression(zzS(localMap6), (String)localMap6.get("list"));
                }
                catch (RuntimeException localRuntimeException4)
                {
                  zzbf.zzZ("Failed to extract a product from DataLayer. " + localRuntimeException4.getMessage());
                }
                continue;
                Object localObject1 = zzde.zzl((zzd.zza)paramMap.get(zzaBy));
                if (!(localObject1 instanceof Map))
                  break label750;
                localMap2 = (Map)localObject1;
                break;
              }
          }
          if (localMap2.containsKey("promoClick"))
            localList1 = (List)((Map)localMap2.get("promoClick")).get("promotions");
        }
        while (true)
        {
          if (localList1 != null)
          {
            Iterator localIterator3 = localList1.iterator();
            while (true)
              if (localIterator3.hasNext())
              {
                Map localMap5 = (Map)localIterator3.next();
                try
                {
                  localScreenViewBuilder.addPromotion(zzR(localMap5));
                }
                catch (RuntimeException localRuntimeException3)
                {
                  zzbf.zzZ("Failed to extract a promotion from DataLayer. " + localRuntimeException3.getMessage());
                }
                continue;
                if (!localMap2.containsKey("promoView"))
                  break label744;
                localList1 = (List)((Map)localMap2.get("promoView")).get("promotions");
                break;
              }
            if (localMap2.containsKey("promoClick"))
              localScreenViewBuilder.set("&promoa", "click");
          }
          String str2;
          Map localMap3;
          for (int i = 0; ; i = 1)
          {
            if (i == 0)
              break label685;
            Iterator localIterator1 = zzaBD.iterator();
            do
            {
              if (!localIterator1.hasNext())
                break;
              str2 = (String)localIterator1.next();
            }
            while (!localMap2.containsKey(str2));
            localMap3 = (Map)localMap2.get(str2);
            List localList2 = (List)localMap3.get("products");
            if (localList2 == null)
              break;
            Iterator localIterator2 = localList2.iterator();
            while (localIterator2.hasNext())
            {
              Map localMap4 = (Map)localIterator2.next();
              try
              {
                localScreenViewBuilder.addProduct(zzS(localMap4));
              }
              catch (RuntimeException localRuntimeException2)
              {
                zzbf.zzZ("Failed to extract a product from DataLayer. " + localRuntimeException2.getMessage());
              }
            }
            localScreenViewBuilder.set("&promoa", "view");
          }
          try
          {
            if (localMap3.containsKey("actionField"));
            ProductAction localProductAction;
            for (Object localObject3 = zzd(str2, (Map)localMap3.get("actionField")); ; localObject3 = localProductAction)
            {
              localScreenViewBuilder.setProductAction((ProductAction)localObject3);
              paramTracker.send(localScreenViewBuilder.build());
              return;
              localProductAction = new ProductAction(str2);
            }
          }
          catch (RuntimeException localRuntimeException1)
          {
            while (true)
              zzbf.zzZ("Failed to extract a product action from DataLayer. " + localRuntimeException1.getMessage());
          }
          localList1 = null;
        }
        localMap2 = null;
      }
    }
  }

  private void zzb(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if (paramString2 != null)
      paramMap.put(paramString1, paramString2);
  }

  private Map<String, String> zzc(zzd.zza paramzza)
  {
    Object localObject = zzde.zzl(paramzza);
    if (!(localObject instanceof Map))
      return null;
    Map localMap = (Map)localObject;
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator = localMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localLinkedHashMap.put(localEntry.getKey().toString(), localEntry.getValue().toString());
    }
    return localLinkedHashMap;
  }

  private ProductAction zzd(String paramString, Map<String, Object> paramMap)
  {
    ProductAction localProductAction = new ProductAction(paramString);
    Object localObject1 = paramMap.get("id");
    if (localObject1 != null)
      localProductAction.setTransactionId(String.valueOf(localObject1));
    Object localObject2 = paramMap.get("affiliation");
    if (localObject2 != null)
      localProductAction.setTransactionAffiliation(String.valueOf(localObject2));
    Object localObject3 = paramMap.get("coupon");
    if (localObject3 != null)
      localProductAction.setTransactionCouponCode(String.valueOf(localObject3));
    Object localObject4 = paramMap.get("list");
    if (localObject4 != null)
      localProductAction.setProductActionList(String.valueOf(localObject4));
    Object localObject5 = paramMap.get("option");
    if (localObject5 != null)
      localProductAction.setCheckoutOptions(String.valueOf(localObject5));
    Object localObject6 = paramMap.get("revenue");
    if (localObject6 != null)
      localProductAction.setTransactionRevenue(zzB(localObject6).doubleValue());
    Object localObject7 = paramMap.get("tax");
    if (localObject7 != null)
      localProductAction.setTransactionTax(zzB(localObject7).doubleValue());
    Object localObject8 = paramMap.get("shipping");
    if (localObject8 != null)
      localProductAction.setTransactionShipping(zzB(localObject8).doubleValue());
    Object localObject9 = paramMap.get("step");
    if (localObject9 != null)
      localProductAction.setCheckoutStep(zzC(localObject9).intValue());
    return localProductAction;
  }

  private String zzdt(String paramString)
  {
    Object localObject = this.zzaxx.get(paramString);
    if (localObject == null)
      return null;
    return localObject.toString();
  }

  private List<Map<String, String>> zzdu(String paramString)
  {
    Object localObject = this.zzaxx.get(paramString);
    if (localObject == null)
      return null;
    if (!(localObject instanceof List))
      throw new IllegalArgumentException("transactionProducts should be of type List.");
    Iterator localIterator = ((List)localObject).iterator();
    while (localIterator.hasNext())
      if (!(localIterator.next() instanceof Map))
        throw new IllegalArgumentException("Each element of transactionProducts should be of type Map.");
    return (List)localObject;
  }

  private boolean zzf(Map<String, zzd.zza> paramMap, String paramString)
  {
    zzd.zza localzza = (zzd.zza)paramMap.get(paramString);
    if (localzza == null)
      return false;
    return zzde.zzk(localzza).booleanValue();
  }

  private Map<String, String> zzm(zzd.zza paramzza)
  {
    if (paramzza == null)
      return new HashMap();
    Map localMap = zzc(paramzza);
    if (localMap == null)
      return new HashMap();
    String str = (String)localMap.get("&aip");
    if ((str != null) && (this.zzaBI.contains(str.toLowerCase())))
      localMap.remove("&aip");
    return localMap;
  }

  public void zzJ(Map<String, zzd.zza> paramMap)
  {
    Tracker localTracker = this.zzaBJ.zzdl("_GTM_DEFAULT_TRACKER_");
    localTracker.enableAdvertisingIdCollection(zzf(paramMap, "collect_adid"));
    if (zzf(paramMap, zzaBw))
    {
      zzb(localTracker, paramMap);
      return;
    }
    if (zzf(paramMap, zzaBv))
    {
      localTracker.send(zzm((zzd.zza)paramMap.get(zzaBz)));
      return;
    }
    if (zzf(paramMap, zzaBA))
    {
      zza(localTracker, paramMap);
      return;
    }
    zzbf.zzac("Ignoring unknown tag.");
  }
}