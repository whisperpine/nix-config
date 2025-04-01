{ ... }:
{
  programs.sqls.enable = true;

  # programs.sqls.settings = {
  #   lowercaseKeywords = false;
  #   connections = [
  #     {
  #       driver = "postgresql";
  #       # dataSourceName = "postgresql://devuser:devpassword@localhost:5432/myappdb";
  #       host = "127.0.0.1";
  #       port = 5432;
  #       proto = "tcp";
  #       user = "devuser";
  #       passwd = "devpassword";
  #       dbName = "myappdb";
  #     }
  #   ];
  # };

}
