
repositories.remote << "http://repo1.maven.org/maven2"

VERSION_NUMBER = "1.0.0.001-SNAPSHOT"

PIRCBOT = "pircbot:pircbot:jar:1.4.2"

define "logBot" do
  project.group = "pircbot"
  project.version = VERSION_NUMBER
  
  compile.from(_("src")).with PIRCBOT
  
  package(:jar)
  package(:zip).include _("html"), _("config.ini"), _("run.sh")
  package(:zip).include package(:jar), :as => "lib/logBot.jar"
  package(:zip).include artifact(PIRCBOT), :as => "lib/pircbot.jar"
  
end