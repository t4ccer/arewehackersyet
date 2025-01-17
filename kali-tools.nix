{ pkgs, ... }:
with pkgs;
let
  resolvePackage = name: { pkg ? null }:
    if pkg != null
    then pkg
    else if builtins.hasAttr name pkgs
    then pkgs.${name}
    else {meta.name = "cantfind";};

  packages = {
    "0trace" = { };
    "aesfix" = { };
    "aeskeyfind" = { };
    "afflib-tools" = { pkg = pkgs.afflib; };
    "afl++" = { pkg = pkgs.aflplusplus; };
    "aircrack-ng" = { };
    "airgeddon" = { };
    "amass" = { };
    "apache-users" = { };
    "apache2" = { pkg = pkgs.apacheHttpd; };
    "apktool" = { };
    "arachni" = { };
    "armitage" = { };
    "arping | iputils-arping" = { pkg = pkgs.arping; };
    "asleap" = { };
    "assetfinder" = { };
    "autopsy" = { };
    "backdoor-factory" = { };
    "bed" = { };
    "beef-xss" = { };
    "bettercap" = { };
    "binwalk" = { pkg = pkgs.python3Packages.binwalk-full; };
    "bluelog" = { };
    "blueranger" = { };
    "bluesnarfer" = { };
    "bluez" = { };
    "bluez-hcidump" = { };
    "braa" = { };
    "btscanner" = { };
    "bulk-extractor" = { };
    "bully" = { };
    "burpsuite" = { };
    "bytecode-viewer" = { };
    "cabextract" = { };
    "cadaver" = { };
    "ccrypt" = { };
    "cdpsnarf" = { };
    "cewl" = { };
    "chirp" = { };
    "chkrootkit" = { };
    "chntpw" = { };
    "cisco-auditing-tool" = { };
    "cisco-global-exploiter" = { };
    "cisco-ocs" = { };
    "cisco-torch" = { };
    "clamav" = { };
    "clang" = { };
    "cmospwd" = { };
    "commix" = { };
    "cookie-cadger" = { };
    "copy-router-config" = { };
    "cowpatty" = { };
    "crackle" = { };
    "crackmapexec" = { };
    "creddump7" = { };
    "crunch" = { };
    "cryptsetup" = { };
    "cryptsetup-initramfs" = { };
    "cryptsetup-nuke-password" = { };
    "cutecom" = { };
    "cutycapt" = { };
    "cymothoa" = { };
    "darkstat" = { };
    "davtest" = { };
    "dbd" = { };
    "dc3dd" = { };
    "dcfldd" = { };
    "ddrescue" = { };
    "default-mysql-server" = { };
    "defectdojo" = { };
    "dex2jar" = { };
    "dhcpig" = { };
    "dirb" = { };
    "dirbuster" = { };
    "dmitry" = { };
    "dns2tcp" = { };
    "dnschef" = { };
    "dnsenum" = { };
    "dnsmap" = { };
    "dnsrecon" = { };
    "dnstracer" = { };
    "dnswalk" = { };
    "dotdotpwn" = { };
    "dradis" = { };
    "driftnet" = { };
    "dsniff" = { };
    "dumpzilla" = { };
    "eapmd5pass" = { };
    "edb-debugger" = { };
    "enum4linux" = { };
    "enumiax" = { };
    "ettercap-graphical | ettercap-text-only" = { pkg = pkgs.ettercap; };
    "ewf-tools" = { };
    "exe2hexbat" = { };
    "exifprobe" = { };
    "exiv2" = { };
    "exploitdb" = { };
    "ext3grep" = { };
    "ext4magic" = { };
    "extundelete" = { };
    "eyewitness" = { };
    "faraday" = { };
    "fcrackzip" = { };
    "fern-wifi-cracker" = { };
    "ferret-sidejack" = { };
    "ferret-sidejack" = { };
    "fierce" = { };
    "fiked" = { };
    "firewalk" = { };
    "firmware-mod-kit" = { };
    "flashrom" = { };
    "flasm" = { };
    "foremost" = { };
    "forensic-artifacts" = { };
    "forensics-colorize" = { };
    "fping" = { };
    "fragrouter" = { };
    "freeradius-wpe" = { pkg = pkgs.freeradius; };
    "freerdp2-x11" = { };
    "ftester" = { };
    "fwbuilder" = { };
    "galleta" = { };
    "gdb" = { };
    "ghidra" = { };
    "gnuradio" = { };
    "gpart" = { };
    "gparted" = { };
    "gpp-decrypt" = { };
    "gqrx-sdr" = { pkg = pkgs.gqrx; };
    "gr-air-modes" = { };
    "gr-iqbal" = { };
    "gr-osmosdr" = { pkg = gnuradio3_9Packages.osmosdr; };
    "grokevt" = { };
    "guymager" = { };
    "gvm" = { };
    "hackrf" = { };
    "hakrawler" = { };
    "hamster-sidejack" = { };
    "hash-identifier" = { };
    "hashcat" = { };
    "hashcat-utils" = { };
    "hashdeep" = { };
    "hashid" = { };
    "hashrat" = { };
    "hb-honeypot" = { };
    "heartleech" = { };
    "hexinject" = { };
    "hostapd-wpe" = { };
    "hping3" = { pkg = pkgs.hping; };
    "httprint" = { };
    "httrack" = { };
    "hydra" = { pkg = pkgs.thc-hydra; };
    "hydra-gtk" = { pkg = pkgs.thc-hydra.override (_: { withGUI = true; }); };
    "hyperion" = { };
    "iaxflood" = { };
    "ike-scan" = { };
    "impacket-scripts" = { };
    "inetsim" = { };
    "inspectrum" = { };
    "intrace" = { };
    "inviteflood" = { };
    "iodine" = { };
    "irpas" = { };
    "isr-evilgrade" = { };
    "iw" = { };
    "jadx" = { };
    "javasnoop" = { };
    "jboss-autopwn" = { };
    "jd-gui" = { };
    "john" = { };
    "johnny" = { };
    "joomscan" = { };
    "jsql-injection" = { };
    "kali-autopilot" = { };
    "kalibrate-rtl" = { };
    "killerbee" = { };
    "kismet" = { };
    "laudanum" = { };
    "lbd" = { };
    "legion" = { };
    "libfindrtp" = { };
    "libfreefare-bin" = { pkg = pkgs.libfreefare; };
    "libhivex-bin" = { pkg = pkgs.hivex; };
    "libnfc-bin" = { pkg = pkgs.libnfc; };
    "libsmali-java" = { };
    "lime-forensics" = { };
    "lvm2" = { };
    "lynis" = { };
    "mac-robber" = { };
    "macchanger" = { };
    "magicrescue" = { };
    "maltego" = { };
    "maryam" = { };
    "maskprocessor" = { };
    "masscan" = { };
    "md5deep" = { };
    "mdbtools" = { };
    "mdk3" = { };
    "mdk4" = { };
    "medusa" = { };
    "memdump" = { };
    "metacam" = { };
    "metagoofil" = { };
    "metasploit-framework" = { pkg = pkgs.metasploit; };
    "mfcuk" = { };
    "mfoc" = { };
    "mfterm" = { };
    "mimikatz" = { };
    "minicom" = { };
    "miredo" = { };
    "missidentify" = { };
    "mitmproxy" = { };
    "msfpc" = { };
    "multimon-ng" = { };
    "myrescue" = { };
    "nasm" = { };
    "nasty" = { };
    "nbtscan" = { };
    "ncat" = { };
    "ncat-w32" = { };
    "ncrack" = { };
    "netdiscover" = { };
    "netmask" = { };
    "netsniff-ng" = { };
    "nikto" = { };
    "nipper-ng" = { };
    "nishang" = { };
    "nmap" = { };
    "oclgausscrack" = { };
    "ohrwurm" = { };
    "ollydbg" = { };
    "onesixtyone" = { };
    "openocd" = { };
    "openvas" = { };
    "ophcrack" = { };
    "ophcrack-cli" = { };
    "oscanner" = { };
    "osrframework" = { };
    "outguess" = { };
    "owasp-mantra-ff" = { };
    "p0f" = { };
    "p7zip-full" = { pkg = pkgs.p7zip; };
    "pack" = { };
    "pack2" = { };
    "padbuster" = { };
    "paros" = { };
    "parted" = { };
    "pasco" = { };
    "passing-the-hash" = { };
    "patator" = { pkg = pkgs.python3Packages.patator; };
    "pdf-parser" = { };
    "pdfcrack" = { };
    "pdfid" = { };
    "peass" = { };
    "pev" = { };
    "php" = { };
    "php-mysql" = { pkg = phpExtensions.mysqlnd; };
    "pipal" = { };
    "pixiewps" = { };
    "plaso" = { };
    "plecost" = { };
    "polenum" = { };
    "powercat" = { };
    "powersploit" = { };
    "protos-sip" = { };
    "proxmark3" = { };
    "proxychains" = { };
    "proxychains4" = { };
    "proxychains4" = { };
    "proxytunnel" = { };
    "pst-utils" = { };
    "ptunnel" = { };
    "pwnat" = { };
    "python3-capstone" = { pkg = pkgs.python3Packages.capstone; };
    "python3-dfdatetime" = { };
    "python3-dfvfs" = { };
    "python3-dfwinreg" = { };
    "python3-distorm3" = { pkg = pkgs.python3Packages.distorm3; };
    "qemu" = { };
    "qemu-system-x86" = { };
    "qemu-user" = { };
    "qsslcaudit" = { };
    "radare2" = { };
    "radare2-cutter" = { };
    "rainbowcrack" = { };
    "rarcrack" = { };
    "rcracki-mt" = { };
    "reaver" = { pkg = pkgs.reaverwps; };
    "rebind" = { };
    "recon-ng" = { };
    "recordmydesktop" = { };
    "recoverdm" = { };
    "recoverjpeg" = { };
    "redfang" = { };
    "redsocks" = { };
    "reglookup" = { };
    "regripper" = { };
    "rekall-core" = { };
    "rephrase" = { };
    "responder" = { };
    "rfcat" = { };
    "rfdump" = { };
    "rfkill" = { };
    "rifiuti" = { };
    "rifiuti2" = { };
    "rizin-cutter" = { };
    "rkhunter" = { };
    "rsakeyfind" = { };
    "rsmangler" = { };
    "rtlsdr-scanner" = { };
    "rtpbreak" = { };
    "rtpflood" = { };
    "rtpinsertsound" = { };
    "rtpmixsound" = { };
    "rz-ghidra" = { };
    "safecopy" = { };
    "sakis3g" = { };
    "samdump2" = { };
    "sandsifter" = { };
    "sbd" = { };
    "scalpel" = { };
    "scrounge-ntfs" = { };
    "sctpscan" = { };
    "seclists" = { };
    "secure-socket-funneling-windows-binaries" = { };
    "sentrypeer" = { };
    "set" = { pkg = pkgs.social-engineer-toolkit; };
    "sfuzz" = { };
    "shellnoob" = { };
    "shellter" = { };
    "sidguesser" = { };
    "siege" = { };
    "siparmyknife" = { };
    "sipcrack" = { };
    "sipp" = { };
    "sipsak" = { };
    "sipvicious" = { };
    "skipfish" = { };
    "sleuthkit" = { };
    "slowhttptest" = { };
    "smali" = { };
    "smbmap" = { };
    "smtp-user-enum" = { };
    "sniffjoke" = { };
    "snmpcheck" = { pkg = pkgs.net-snmp; };
    "spectools" = { };
    "spiderfoot" = { };
    "spike" = { };
    "spooftooph" = { };
    "sqldict" = { };
    "sqlitebrowser" = { };
    "sqlmap" = { };
    "sqlninja" = { };
    "sqlsus" = { };
    "ssdeep" = { };
    "ssldump" = { };
    "sslh" = { };
    "sslscan" = { };
    "sslsniff" = { };
    "sslsplit" = { };
    "sslyze" = { };
    "statsprocessor" = { };
    "steghide" = { };
    "stegsnow" = { };
    "stunnel4" = { };
    "sucrack" = { };
    "swaks" = { };
    "t50" = { };
    "tcpdump" = { };
    "tcpflow" = { };
    "tcpick" = { };
    "tcpreplay" = { };
    "termineter" = { };
    "tftpd32" = { };
    "thc-ipv6" = { };
    "thc-pptp-bruter" = { };
    "thc-ssl-dos" = { };
    "theharvester" = { };
    "tiger" = { };
    "tlssled" = { };
    "tnscmd10g" = { };
    "truecrack" = { };
    "twofi" = { };
    "ubertooth" = { };
    "udptunnel" = { };
    "uhd-host" = { pkg = pkgs.uhd; };
    "uhd-images" = { };
    "undbx" = { };
    "unhide" = { };
    "unicornscan" = { };
    "uniscan" = { };
    "unix-privesc-check" = { };
    "unrar | unar" = { pkg = pkgs.unrar; };
    "upx-ucl" = { };
    "urlcrazy" = { };
    "veil" = { };
    "vinetto" = { };
    "voiphopper" = { };
    "volatility" = { };
    "wafw00f" = { };
    "wapiti" = { };
    "watobo" = { };
    "wce" = { };
    "webacoo" = { };
    "webscarab" = { };
    "webshells" = { };
    "weevely" = { };
    "wfuzz" = { };
    "whatweb" = { };
    "wifi-honey" = { };
    "wifite" = { pkg = pkgs.wifite2; };
    "windows-binaries" = { };
    "windows-privesc-check" = { };
    "winregfs" = { };
    "wireshark" = { };
    "witnessme" = { };
    "wordlists" = { };
    "wpscan" = { };
    "xmount" = { };
    "xplico" = { };
    "xprobe" = { };
    "xsser" = { };
    "yara" = { };
    "yersinia" = { };
    "zaproxy" = { pkg = pkgs.zap; };
  };
in
builtins.mapAttrs resolvePackage packages
