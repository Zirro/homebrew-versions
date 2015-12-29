cask 'xquartz-beta' do
  version '2.7.9_beta1'
  sha256 '13b026a1bcd02eff988be1875e40fea5d73bc9e39972d9e586687d647b198906'

  url "https://xquartz.macosforge.org/downloads/SL/XQuartz-#{version}.dmg"
  appcast 'https://xquartz-dl.macosforge.org/sparkle/beta.xml',
          :sha256 => '9792f0d6abd547e523f6ca33c4dd3847134bc3d46d77ac91b93fe932d6123568'
  name 'XQuartz'
  homepage 'https://xquartz.macosforge.org/'
  license :oss

  pkg 'XQuartz.pkg'

  postflight do
    Pathname.new(File.expand_path('~')).join('Library', 'Logs').mkpath

    # Set default path to X11 to avoid the need of manual setup
    system '/usr/bin/defaults', 'write', 'com.apple.applescript', 'ApplicationMap', '-dict-add', 'X11', 'file://localhost/Applications/Utilities/XQuartz.app/'

    # Load & start XServer to avoid the need of relogin
    system '/bin/launchctl', 'load', '/Library/LaunchAgents/org.macosforge.xquartz.startx.plist'

    # Set automatic Updates for Beta Versions
    system 'defaults', 'write', 'org.macosforge.xquartz.X11', 'SUFeedURL', 'http://xquartz.macosforge.org/downloads/sparkle/beta.xml'
  end

  uninstall :quit => 'org.macosforge.xquartz.X11',
            :launchctl => 'org.macosforge.xquartz.*',
            :pkgutil => 'org.macosforge.xquartz.pkg',
            :delete => '/opt/X11/'
  zap       :delete => [
                        '~/Library/Caches/org.macosforge.xquartz.X11',
                        '~/Library/Logs/X11',
                        '~/Library/Logs/X11.org.macosforge.xquartz.log',
                        '~/Library/Logs/X11.org.macosforge.xquartz.log.old',
                        '~/Library/Preferences/org.macosforge.xquartz.X11.plist',
                        '~/Library/Saved Application State/org.macosforge.xquartz.X11.savedState',
                        '~/.Xauthority',
                       ],
            :rmdir => '~/.fonts'
end
