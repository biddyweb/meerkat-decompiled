package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.util.logging.Level;

public class JuliLogger extends Logger
{
  java.util.logging.Logger logger;

  public JuliLogger(String paramString)
  {
    this.logger = java.util.logging.Logger.getLogger(paramString);
  }

  public void logDebug(String paramString)
  {
    this.logger.log(Level.FINE, paramString);
  }

  public void logError(String paramString)
  {
    this.logger.log(Level.SEVERE, paramString);
  }

  public void logWarn(String paramString)
  {
    this.logger.log(Level.WARNING, paramString);
  }
}