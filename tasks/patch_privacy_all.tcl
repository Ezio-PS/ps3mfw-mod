#!/usr/bin/tclsh
#
# ps3mfw -- PS3 MFW creator
#
# Copyright (C) Anonymous Developers (Code Monkeys)
#
# This software is distributed under the terms of the GNU General Public
# License ("GPL") version 3, as published by the Free Software Foundation.
#

# Modified and fixed by Ezio

# Priority: 105
# Description: Patch all self/sprx to secure privacy

# Option --patch-playstati0n-net: Patch additional communication with playstation.net - [Warning]: use it only on 3.40-3.66 fw
# Option --patch-playstation-net: Patch all communications with playstation.net
# Option --patch-playstation-org: Patch all communications with playstation.org
# Option --patch-sony-com: Patch all communications with sony.com - [Warning]: use it only on 3.40-4.11 fw
# Option --patch-sony-co-jp: Patch all communications with sony.co.jp - [Warning]: use it only on 4.50 and lower fw
# Option --patch-bitwallet: Patch all communications with bitwallet.co.jp
# Option --patch-qriocity: Patch all communications with qriocity.com - [Warning]: use it only on 3.10-4.26 fw
# Option --patch-trendmicro: Patch all communications with trendmicro.com
# Option --patch-allmusic: Patch all communications with allmusic.com
# Option --patch-intertrust: Patch all communications with intertrust.com
# Option --patch-marlin-drm: Patch all communications with marlin-drm.com
# Option --patch-marlin-tmo: Patch all communications with marlin-tmo.com
# Option --patch-oasis-open: Patch all communications with oasis-open.org
# Option --patch-octopus-drm: Patch all communications with octopus-drm.com
# Option --patch-facebook: Patch all communications with facebook.com
# Option --patch-dtcp: Patch all communications with dtcp.com
# Option --patch-purl: Patch all communications with purl.org 
# Option --patch-xmlsoap: Patch all communications with xmlsoap.org 

# Type --patch-playstati0n-net: boolean
# Type --patch-playstation-net: boolean
# Type --patch-playstation-org: boolean
# Type --patch-sony-com: boolean
# Type --patch-sony-co-jp: boolean
# Type --patch-bitwallet: boolean
# Type --patch-qriocity: boolean
# Type --patch-trendmicro: boolean
# Type --patch-allmusic: boolean
# Type --patch-intertrust: boolean
# Type --patch-marlin-drm: boolean
# Type --patch-marlin-tmo: boolean
# Type --patch-oasis-open: boolean
# Type --patch-octopus-drm: boolean
# Type --patch-facebook: boolean
# Type --patch-dtcp: boolean
# Type --patch-purl: boolean
# Type --patch-xmlsoap: boolean

namespace eval ::patch_privacy_all {

    array set ::patch_privacy_all::options {
        --patch-allmusic true
        --patch-bitwallet true
		--patch-dtcp true
		--patch-facebook true
        --patch-intertrust true
        --patch-marlin-drm true
        --patch-marlin-tmo true
        --patch-oasis-open true
        --patch-octopus-drm true
        --patch-playstation-net true
		--patch-playstati0n-net false
        --patch-playstation-org true
		--patch-purl true
        --patch-qriocity false
        --patch-sony-com false
		--patch-sony-co-jp false
        --patch-trendmicro true
		--patch-xmlsoap true
    }

    proc main { } {
		variable options

        if {$::patch_privacy_all::options(--patch-allmusic)} {
            set selfs {x3_amgsdk.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_allmusic_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_allmusic_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-bitwallet)} {
            set selfs {edy_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_bitwallet_co_jp_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_bitwallet_co_jp_self
			}
		}
		if {$::patch_privacy_all::options(--patch-dtcp)} {
            set selfs {mintx_client.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_dtcp_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_dtcp_com_self
			}
		}
		if {$::patch_privacy_all::options(--patch-facebook)} {
            set selfs {eula_net_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_facebook_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_facebook_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-intertrust)} {
            set selfs {mcore.self msmw2.sprx}
            if { ${::OLDROUTINE} == "1" } {
		    ::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_intertrust_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
	        ::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_intertrust_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-marlin-drm)} {
            set selfs {mcore.self}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_marlin_drm_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
		    ::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_marlin_drm_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-marlin-tmo)} {
            set selfs {mcore.self msmw2.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_marlin_tmo_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
		    ::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_marlin_tmo_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-oasis-open)} {
            set selfs {mcore.self msmw2.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_oasis_open_org_self
            } elseif { ${::OLDROUTINE} == "0" } {
		    ::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_oasis_open_org_self
			}
		}
        if {$::patch_privacy_all::options(--patch-octopus-drm)} {
            set selfs {mcore.self msmw2.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_octopus_drm_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
		    ::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_octopus_drm_com_self
			}
		}
		if {$::patch_privacy_all::options(--patch-playstati0n-net)} {
        set selfs {sysconf_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch0_playstation_net_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch0_playstation_net_self
			}
		}
        if {$::patch_privacy_all::options(--patch-playstation-net)} {
        set selfs1 {libad_core.sprx libmedi.sprx libsysutil_np_commerce2.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash sys external] $selfs1 ::patch_privacy_all::patch1_playstation_net_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash sys external] $selfs1 ::patch_privacy_all::patch1_playstation_net_self
			}
        set selfs2 {game_ext_plugin.sprx np_eula_plugin.sprx photo_network_sharing_plugin.sprx x3_mdimp11.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs2 ::patch_privacy_all::patch1_playstation_net_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs2 ::patch_privacy_all::patch1_playstation_net_self
			}
		}
		if {$::patch_privacy_all::options(--patch-playstation-net)} {
        set selfs1 {libsysutil_np_clans.sprx libsysutil_np_util.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash sys external] $selfs1 ::patch_privacy_all::patch2_playstation_net_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash sys external] $selfs1 ::patch_privacy_all::patch2_playstation_net_self
			}
        set selfs2 {autodownload_plugin.sprx download_plugin.sprx esehttp.sprx eula_cddb_plugin.sprx eula_hcopy_plugin.sprx eula_net_plugin.sprx explore_category_friend.sprx explore_category_game.sprx explore_category_music.sprx explore_category_network.sprx explore_category_photo.sprx explore_category_psn.sprx explore_category_sysconf.sprx explore_category_tv.sprx explore_category_user.sprx explore_category_video.sprx explore_plugin.sprx explore_plugin_ft.sprx explore_plugin_np.sprx friendtrophy_plugin.sprx hknw_plugin.sprx nas_plugin.sprx newstore_plugin.sprx np_trophy_plugin.sprx np_trophy_util.sprx profile_plugin.sprx regcam_plugin.sprx videoeditor_plugin.sprx videoplayer_plugin.sprx videoplayer_util.sprx vsh.self x3_mdimp7.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs2 ::patch_privacy_all::patch2_playstation_net_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs2 ::patch_privacy_all::patch2_playstation_net_self
			}
		}
        if {$::patch_privacy_all::options(--patch-playstation-org)} {
            set selfs {netconf_plugin.sprx sysconf_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_playstation_org_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_playstation_org_self
			}
		}
		if {$::patch_privacy_all::options(--patch-purl)} {
            set selfs {mintx_client.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_purl_org_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_purl_org_self
			}
		}
        if {$::patch_privacy_all::options(--patch-qriocity)} {
            set selfs {regcam_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_qriocity_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_qriocity_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-sony-com)} {
            set selfs {eula_net_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_sony_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_sony_com_self
			}
		}
        if {$::patch_privacy_all::options(--patch-sony-co-jp)} {
            set selfs {videodownloader_plugin.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_sony_co_jp_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_sony_co_jp_self
			}
		}
        if {$::patch_privacy_all::options(--patch-trendmicro)} {
            set selfs {silk.sprx silk_nas.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_trendmicro_com_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_trendmicro_com_self
			}
		}
		if {$::patch_privacy_all::options(--patch-xmlsoap)} {
            set selfs {mintx_client.sprx}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_xmlsoap_org_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_privacy_all::patch_xmlsoap_org_self
			}
		}
    }
	
	proc patch0_playstation_net_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch0_playstation_net_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch0_playstation_net_elf
			}
    }
    proc patch0_playstation_net_elf {elf} {
        if {$::patch_privacy_all::options(--patch-playstati0n-net)} {
            log "Patching [file tail $elf] to disable communication with playstation.net"
#           playstation.net
            set search  "\x70\x6c\x61\x79\x73\x74\x61\x74\x69\x6f\x6e\x2e\x6e\x65\x74"
#           aaaaaaaaaaa.net
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x6e\x65\x74"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
	proc patch1_playstation_net_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch1_playstation_net_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch1_playstation_net_elf
			}
    }
    proc patch1_playstation_net_elf {elf} {
        if {$::patch_privacy_all::options(--patch-playstation-net)} {
            log "Patching [file tail $elf] to disable communication with playstation.net"
#           playstation.net
            set search  "\x70\x6c\x61\x79\x73\x74\x61\x74\x69\x6f\x6e\x2e\x6e\x65\x74"
#           aaaaaaaaaaa.net
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x6e\x65\x74"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
	proc patch2_playstation_net_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch2_playstation_net_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch2_playstation_net_elf
			}
    }
    proc patch2_playstation_net_elf {elf} {
        if {$::patch_privacy_all::options(--patch-playstation-net)} {
            log "Patching [file tail $elf] to disable communication with playstation.net"
#           playstation.net
            set search  "\x70\x6c\x61\x79\x73\x74\x61\x74\x69\x6f\x6e\x2e\x6e\x65\x74"
#           aaaaaaaaaaa.net
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x6e\x65\x74"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_playstation_org_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_playstation_org_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_playstation_org_elf
			}
    }
    proc patch_playstation_org_elf {elf} {
        if {$::patch_privacy_all::options(--patch-playstation-org)} {
            log "Patching [file tail $elf] to disable communication with playstation.org"
#           playstation.org
            set search  "\x70\x6c\x61\x79\x73\x74\x61\x74\x69\x6f\x6e\x2e\x6f\x72\x67"
#           aaaaaaaaaaa.org
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x6f\x72\x67"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_sony_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_sony_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_sony_com_elf
			}
    }
    proc patch_sony_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-sony-com)} {
            log "Patching [file tail $elf] to disable communication with sony.com"
#           sony.com
            set search  "\x73\x6f\x6e\x79\x2e\x63\x6f\x6d"
#           aaaa.com
            set replace "\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_sony_co_jp_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_sony_co_jp_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_sony_co_jp_elf
			}
    }
    proc patch_sony_co_jp_elf {elf} {
        if {$::patch_privacy_all::options(--patch-sony-co-jp)} {
            log "Patching [file tail $elf] to disable communication with sony.co.jp"
#           sony.co.jp
            set search  "\x73\x6f\x6e\x79\x2e\x63\x6f\x2e\x6a\x70"
#           aaaa.co.jp
            set replace "\x61\x61\x61\x61\x2e\x63\x6f\x2e\x6a\x70"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_bitwallet_co_jp_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_bitwallet_co_jp_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_bitwallet_co_jp_elf
			}
    }
    proc patch_bitwallet_co_jp_elf {elf} {
        if {$::patch_privacy_all::options(--patch-bitwallet)} {
            log "Patching [file tail $elf] to disable communication with bitwallet.co.jp"
#           bitwallet.co.jp
            set search  "\x62\x69\x74\x77\x61\x6c\x6c\x65\x74\x2e\x63\x6f\x2e\x6a\x70"
#           aaaaaaaaa.co.jp
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x2e\x6a\x70"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_qriocity_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_qriocity_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_qriocity_com_elf
			}
    }
    proc patch_qriocity_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-qriocity)} {
            log "Patching [file tail $elf] to disable communication with qriocity.com"
#           qriocity.com
            set search  "\x71\x72\x69\x6f\x63\x69\x74\x79\x2e\x63\x6f\x6d"
#           aaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_trendmicro_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_trendmicro_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_trendmicro_com_elf
			}
    }
    proc patch_trendmicro_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-trendmicro)} {
            log "Patching [file tail $elf] to disable communication with trendmicro.com"
#           trendmicro.com
            set search  "\x74\x72\x65\x6e\x64\x6d\x69\x63\x72\x6f\x2e\x63\x6f\x6d"
#           aaaaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_allmusic_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_allmusic_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_allmusic_com_elf
			}
    }
    proc patch_allmusic_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-allmusic)} {
            log "Patching [file tail $elf] to disable communication with allmusic.com"
#           allmusic.com
            set search  "\x61\x6c\x6c\x6d\x75\x73\x69\x63\x2e\x63\x6f\x6d"
#           aaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_intertrust_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_intertrust_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_intertrust_com_elf
			}
    }
    proc patch_intertrust_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-intertrust)} {
            log "Patching [file tail $elf] to disable communication with intertrust.com"
#           intertrust.com
            set search  "\x69\x6e\x74\x65\x72\x74\x72\x75\x73\x74\x2e\x63\x6f\x6d"
#           aaaaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_marlin_tmo_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_marlin_tmo_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_marlin_tmo_com_elf
			}
    }
    proc patch_marlin_tmo_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-marlin-tmo)} {
            log "Patching [file tail $elf] to disable communication with marlin-tmo.com"
#           marlin-tmo.com
            set search  "\x6d\x61\x72\x6c\x69\x6e\x2d\x74\x6d\x6f\x2e\x63\x6f\x6d"
#           aaaaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_marlin_drm_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_marlin_drm_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_marlin_drm_com_elf
			}
    }
    proc patch_marlin_drm_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-marlin-drm)} {
            log "Patching [file tail $elf] to disable communication with marlin-drm.com"
#           marlin-drm.com
            set search  "\x6d\x61\x72\x6c\x69\x6e\x2d\x64\x72\x6d\x2e\x63\x6f\x6d"
#           aaaaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_oasis_open_org_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_oasis_open_org_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_oasis_open_org_elf
			}
    }
    proc patch_oasis_open_org_elf {elf} {
        if {$::patch_privacy_all::options(--patch-oasis-open)} {
            log "Patching [file tail $elf] to disable communication with oasis-open.org"
#           oasis-open.org
            set search  "\x6f\x61\x73\x69\x73\x2d\x6f\x70\x65\x6e\x2e\x6f\x72\x67"
#           aaaaaaaaaa.org
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x6f\x72\x67"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }

	proc patch_octopus_drm_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_octopus_drm_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_octopus_drm_com_elf
			}
    }
    proc patch_octopus_drm_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-octopus-drm)} {
            log "Patching [file tail $elf] to disable communication with octopus-drm.com"
#           octopus-drm.com
            set search  "\x6f\x63\x74\x6f\x70\x75\x73\x2d\x64\x72\x6d\x2e\x63\x6f\x6d"
#           aaaaaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
	proc patch_facebook_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_facebook_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_facebook_com_elf
			}
    }
    proc patch_facebook_com_elf {elf} {
        if {$::patch_privacy_all::options(--patch-facebook)} {
            log "Patching [file tail $elf] to disable communication with facebook.com"
#           facebook.com
            set search  "\x66\x61\x63\x65\x62\x6f\x6f\x6b\x2e\x63\x6f\x6d"
#           aaaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
    proc patch_dtcp_com_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_dtcp_com_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_dtcp_com_elf
			}
    }
    proc patch_dtcp_com_elf {elf} {
		if {$::patch_privacy_all::options(--patch-dtcp)} {
            log "Patching [file tail $elf] to disable communication with dtcp.com"
#           dtcp.com
            set search  "\x64\x74\x63\x70\x2e\x63\x6f\x6d"
#           aaaa.com
            set replace "\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
	proc patch_purl_org_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_purl_org_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_purl_org_elf
			}
    }
    proc patch_purl_org_elf {elf} {
		if {$::patch_privacy_all::options(--patch-purl)} {
            log "Patching [file tail $elf] to disable communication with purl.org"
#           purl.org
            set search  "\x70\x75\x72\x6c\x2e\x6f\x72\x67"
#           aaaa.com
            set replace "\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
	
	proc patch_xmlsoap_org_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_privacy_all::patch_xmlsoap_org_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_privacy_all::patch_xmlsoap_org_elf
			}
    }
    proc patch_xmlsoap_org_elf {elf} {
		if {$::patch_privacy_all::options(--patch-xmlsoap)} {
            log "Patching [file tail $elf] to disable communication with xmlsoap.org"
#           xmlsoap.org
            set search  "\x78\x6d\x6c\x73\x6f\x61\x70\x2e\x6f\x72\x67"
#           aaaaaaa.com
            set replace "\x61\x61\x61\x61\x61\x61\x61\x2e\x63\x6f\x6d"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
}
