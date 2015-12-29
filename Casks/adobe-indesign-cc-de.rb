cask 'adobe-indesign-cc-de' do
  version :latest
  sha256 :no_check

  url 'http://trials3.adobe.com/AdobeProducts/IDSN/11/osx10/InDesign_11_LS20.dmg',
      :user_agent => :fake,
      :cookies => { 'MM_TRIALS' => '1234' }
  name 'Adobe InDesign CC 2015'
  homepage 'https://www.adobe.com/products/indesign.html'
  license :commercial

  preflight do
    deployment_xml = "#{staged_path}/Adobe InDesign CC 2015/deploy/install.xml"

    File.open(deployment_xml) do |xml_before|
      contents = xml_before.read.gsub!('>en_US<', '>de_DE<')
      File.open(deployment_xml, 'w+') { |xml_after| xml_after.write(contents) }
    end

    system '/usr/bin/sudo', '-E', '--', "#{staged_path}/Adobe InDesign CC 2015/Install.app/Contents/MacOS/Install", '--mode=silent', "--deploymentFile=#{deployment_xml}"
  end

  uninstall_preflight do
    system '/usr/bin/sudo', '-E', '--', "#{staged_path}/Adobe InDesign CC 2015/Install.app/Contents/MacOS/Install", '--mode=silent', "--deploymentFile=#{staged_path}/Adobe\ InDesign\ CC\ 2015/deploy/remove.xml"
  end

  uninstall :rmdir => '/Applications/Utilities/Adobe Installers'

  conflicts_with :cask => 'adobe-indesign-cc'
end
