package com.google.android.gms.drive.query;

import com.google.android.gms.drive.metadata.CustomPropertyKey;
import com.google.android.gms.drive.metadata.SearchableCollectionMetadataField;
import com.google.android.gms.drive.metadata.SearchableMetadataField;
import com.google.android.gms.drive.metadata.SearchableOrderedMetadataField;
import com.google.android.gms.drive.metadata.internal.AppVisibleCustomProperties.zza;
import com.google.android.gms.drive.query.internal.ComparisonFilter;
import com.google.android.gms.drive.query.internal.FieldOnlyFilter;
import com.google.android.gms.drive.query.internal.HasFilter;
import com.google.android.gms.drive.query.internal.InFilter;
import com.google.android.gms.drive.query.internal.LogicalFilter;
import com.google.android.gms.drive.query.internal.NotFilter;
import com.google.android.gms.drive.query.internal.Operator;

public class Filters
{
  public static Filter and(Filter paramFilter, Filter[] paramArrayOfFilter)
  {
    return new LogicalFilter(Operator.zzWR, paramFilter, paramArrayOfFilter);
  }

  public static Filter and(Iterable<Filter> paramIterable)
  {
    return new LogicalFilter(Operator.zzWR, paramIterable);
  }

  public static Filter contains(SearchableMetadataField<String> paramSearchableMetadataField, String paramString)
  {
    return new ComparisonFilter(Operator.zzWU, paramSearchableMetadataField, paramString);
  }

  public static Filter eq(CustomPropertyKey paramCustomPropertyKey, String paramString)
  {
    return new HasFilter(SearchableField.zzWt, new AppVisibleCustomProperties.zza().zza(paramCustomPropertyKey, paramString).zzkW());
  }

  public static <T> Filter eq(SearchableMetadataField<T> paramSearchableMetadataField, T paramT)
  {
    return new ComparisonFilter(Operator.zzWM, paramSearchableMetadataField, paramT);
  }

  public static <T extends Comparable<T>> Filter greaterThan(SearchableOrderedMetadataField<T> paramSearchableOrderedMetadataField, T paramT)
  {
    return new ComparisonFilter(Operator.zzWP, paramSearchableOrderedMetadataField, paramT);
  }

  public static <T extends Comparable<T>> Filter greaterThanEquals(SearchableOrderedMetadataField<T> paramSearchableOrderedMetadataField, T paramT)
  {
    return new ComparisonFilter(Operator.zzWQ, paramSearchableOrderedMetadataField, paramT);
  }

  public static <T> Filter in(SearchableCollectionMetadataField<T> paramSearchableCollectionMetadataField, T paramT)
  {
    return new InFilter(paramSearchableCollectionMetadataField, paramT);
  }

  public static <T extends Comparable<T>> Filter lessThan(SearchableOrderedMetadataField<T> paramSearchableOrderedMetadataField, T paramT)
  {
    return new ComparisonFilter(Operator.zzWN, paramSearchableOrderedMetadataField, paramT);
  }

  public static <T extends Comparable<T>> Filter lessThanEquals(SearchableOrderedMetadataField<T> paramSearchableOrderedMetadataField, T paramT)
  {
    return new ComparisonFilter(Operator.zzWO, paramSearchableOrderedMetadataField, paramT);
  }

  public static Filter not(Filter paramFilter)
  {
    return new NotFilter(paramFilter);
  }

  public static Filter openedByMe()
  {
    return new FieldOnlyFilter(SearchableField.LAST_VIEWED_BY_ME);
  }

  public static Filter or(Filter paramFilter, Filter[] paramArrayOfFilter)
  {
    return new LogicalFilter(Operator.zzWS, paramFilter, paramArrayOfFilter);
  }

  public static Filter or(Iterable<Filter> paramIterable)
  {
    return new LogicalFilter(Operator.zzWS, paramIterable);
  }

  public static Filter sharedWithMe()
  {
    return new FieldOnlyFilter(SearchableField.zzWs);
  }
}