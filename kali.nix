pkgs:
with builtins;
let
  kaliBase = {
    cifs-utils = pkgs.cifs-utils.meta.name;
    ftp = pkgs.netkittftp.meta.name;
    iw = pkgs.iw.meta.name;
    lvm2 = pkgs.lvm2.meta.name;
    mlocate = pkgs.mlocate.meta.name;
    netcat-traditional = pkgs.netcat-openbsd.meta.name;
    nfs-common = pkgs.nfs-utils.meta.name;
    openssh-server = pkgs.openssh.meta.name;
    openvpn = pkgs.openvpn.meta.name;
    p7zip-full = (pkgs.p7zip.override (_: { enableUnfree = true; })).meta.name;
    parted = pkgs.parted.meta.name;
    # rfkill = pkgs.rfkill; # FIXME: pkgs.util-linu.meta.namex
    samba = pkgs.samba.meta.name;
    snmp = pkgs.net-snmp.meta.name;
    sudo = pkgs.sudo.meta.name;
    tcpdump = pkgs.tcpdump.meta.name;
    testdisk = pkgs.testdisk.meta.name;
    tftp = pkgs.netkittftp.meta.name;
    tightvncserver = pkgs.tightvnc.meta.name;
    tmux = pkgs.tmux.meta.name;
    unrar = pkgs.unrar.meta.name;
    vim = pkgs.vim.meta.name;
    whois = pkgs.whois.meta.name;
  };

  kaliTools = pkgs.callPackage ./kali-tools.nix { };
in
{
  base = kaliBase;
} // mapAttrs
  (_: deps: listToAttrs (map
    (dep: {
      name = dep;
      value = kaliTools.${dep};
    })
    deps))
  (fromJSON (readFile ./kali-groups.json))

