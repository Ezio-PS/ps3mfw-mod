#!/usr/bin/tclsh
#
# ps3mfw -- PS3 MFW creator
#
# Copyright (C) Anonymous Developers (Code Monkeys)
# Copyright (C) Ezio (For adding disabler for epilepsy message!)
# Copyright (C) mysis (For reversing and patches!)
#
# This software is distributed under the terms of the GNU General Public
# License ("GPL") version 3, as published by the Free Software Foundation.
#
 
# Priority: 2
# Description: [4.xx] Patch to disable epilepsy message
 
# Option --patch-epilepsy-cex: [4.xx] Patch to disable the epilepsy message on cex cfw!
# Option --patch-epilepsy-dex: [4.xx] Patch to disable the epilepsy message on dex cfw!
# Option --patch-epilepsy-rebug: [4.xx] Patch to disable the epilepsy message on rebug cfw!
 
# Type --patch-epilepsy-cex: boolean
# Type --patch-epilepsy-dex: boolean
# Type --patch-epilepsy-rebug: boolean
 
namespace eval ::patch_epilepsy {
 
    array set ::patch_epilepsy::options {
        --patch-epilepsy-cex true
		--patch-epilepsy-dex false
		--patch-epilepsy-rebug false
    }
 
    proc main { } {
		variable options
 
        if {$::patch_epilepsy::options(--patch-epilepsy-cex)} {
            set selfs {vsh.self}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_epilepsy::patch_epilepsy_cex_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_epilepsy::patch_epilepsy_cex_self
			}
		}
        if {$::patch_epilepsy::options(--patch-epilepsy-dex)} {
            set selfs {vsh.self}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs ::patch_epilepsy::patch_epilepsy_dex_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs ::patch_epilepsy::patch_epilepsy_dex_self
			}
		}
		if {$::patch_epilepsy::options(--patch-epilepsy-rebug)} {
            set selfs1 {vsh.self vsh.self.swp}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs1 ::patch_epilepsy::patch1_epilepsy_rebug_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs1 ::patch_epilepsy::patch1_epilepsy_rebug_self
			}
			set selfs2 {vsh.self.cexsp}
            if { ${::OLDROUTINE} == "1" } {
			::modify_devflash_files [file join dev_flash vsh module] $selfs2 ::patch_epilepsy::patch2_epilepsy_rebug_self
            } elseif { ${::OLDROUTINE} == "0" } {
			::modify_devflash_files2 [file join dev_flash vsh module] $selfs2 ::patch_epilepsy::patch2_epilepsy_rebug_self
			}
		}
    }
 
	proc patch_epilepsy_cex_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_epilepsy::patch_epilepsy_cex_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_epilepsy::patch_epilepsy_cex_elf
			}
    }
    proc patch_epilepsy_cex_elf {elf} {
        if {$::patch_epilepsy::options(--patch-epilepsy-cex)} {
            log "Patching [file tail $elf] to disable epilepsy message on cex cfw"
			log "Added by Ezio"
            set search  "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x01\x01\x01\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x00\x01\x01\xff\xff\xff\xff"
            catch_die {::patch_file_multi $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
 
	proc patch_epilepsy_dex_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_epilepsy::patch_epilepsy_dex_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_epilepsy::patch_epilepsy_dex_elf
			}
    }
    proc patch_epilepsy_dex_elf {elf} {
        if {$::patch_epilepsy::options(--patch-epilepsy-dex)} {
            log "Patching [file tail $elf] to disable epilepsy message on dex cfw"
			log "Added by Ezio"
			set search  "\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x01\x00\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\xff\xff\xff\xff"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
 
	proc patch1_epilepsy_rebug_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_epilepsy::patch1_epilepsy_rebug_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_epilepsy::patch1_epilepsy_rebug_elf
			}
    }
    proc patch1_epilepsy_rebug_elf {elf} {
        if {$::patch_epilepsy::options(--patch-epilepsy-rebug)} {
            log "Patching [file tail $elf] to disable epilepsy message on rebug cfw"
			log "Added by Ezio"
			set search  "\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x01\x00\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\xff\xff\xff\xff"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
 
	proc patch2_epilepsy_rebug_self {self} {
			if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_epilepsy::patch2_epilepsy_rebug_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_epilepsy::patch2_epilepsy_rebug_elf
			}
    }
    proc patch2_epilepsy_rebug_elf {elf} {
        if {$::patch_epilepsy::options(--patch-epilepsy-rebug)} {
            log "Patching [file tail $elf] to disable epilepsy message on rebug cfw"
			log "Added by Ezio"
			set search  "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x01\x01\x01\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x00\x01\x01\xff\xff\xff\xff"
            catch_die {::patch_elf $elf $search 0 $replace} \
                "Unable to patch self [file tail $elf]"
        }
    }
}