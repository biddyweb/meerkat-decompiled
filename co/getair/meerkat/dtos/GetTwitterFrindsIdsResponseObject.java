package co.getair.meerkat.dtos;

import java.util.List;

public class GetTwitterFrindsIdsResponseObject
{
  private List<String> ids;
  private long next_cursor;
  private String next_cursor_str;
  private long previous_cursor;
  private String previous_cursor_str;

  public List<String> getIds()
  {
    return this.ids;
  }

  public long getNext_cursor()
  {
    return this.next_cursor;
  }

  public long getPrevious_cursor()
  {
    return this.previous_cursor;
  }
}