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

# Option --patch-disable-epilepsy-message-on-cex: [4.xx] Patch to disable the epilepsy message on cex cfw!
# Option --patch-disable-epilepsy-message-on-dex: [4.xx] Patch to disable the epilepsy message on dex cfw!
# Option --patch-disable-epilepsy-message-on-rebug: [4.xx] Patch to disable the epilepsy message on rebug cfw!

# Type --patch-disable-epilepsy-message-on-cex: boolean
# Type --patch-disable-epilepsy-message-on-dex: boolean
# Type --patch-disable-epilepsy-message-on-rebug: boolean

namespace eval ::patch_epilepsy {

    array set ::patch_epilepsy::options {
        --patch-disable-epilepsy-message-on-cex true
		--patch-disable-epilepsy-message-on-dex false
		--patch-disable-epilepsy-message-on-rebug false
    }

    proc main {} {
		    set self [file join dev_flash vsh module vsh.self]
			set ::SELF "vsh.self"
        if { ${::OLDROUTINE} == "1" } {
		::modify_devflash_file $self ::patch_epilepsy::patch_self
		} elseif { ${::OLDROUTINE} == "0" } {
		::modify_devflash_file2 $self ::patch_epilepsy::patch_self
		}
	}

    proc patch_self { self } {
            if { ${::OLDROUTINE} == "1" } {
			::modify_self_file $self ::patch_epilepsy::patch_elf
			} elseif { ${::OLDROUTINE} == "0" } {
			::modify_self_file2 $self ::patch_epilepsy::patch_elf
			}
    }

    proc patch_elf { elf } {
        if {$::patch_epilepsy::options(--patch-disable-epilepsy-message-on-cex) } {
            log "Patching [file tail $elf] to disable epilepsy message on cex cfw"
			log "Added by Ezio"
			
            set search  "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x01\x01\x01\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x02\x00\x00\x00\x01\x02\x00\x01\x01\xff\xff\xff\xff"

            catch_die {::patch_elf $elf $search 0 $replace} \
			"Unable to patch self [file tail $elf]"
        }

		if {$::patch_epilepsy::options(--patch-disable-epilepsy-message-on-dex) } {
		    log "Patching [file tail $elf] to disable epilepsy message on dex cfw"
			log "Added by Ezio"

			set search  "\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x01\x00\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\xff\xff\xff\xff"
			
			catch_die {::patch_elf $elf $search 2 $replace} \
			"Unable to patch self [file tail $elf]"
		}

		if {$::patch_epilepsy::options(--patch-disable-epilepsy-message-on-rebug) } {
		    log "Patching [file tail $elf] to disable epilepsy message on rebug cfw"
			log "Added by Ezio"
			
            set search  "\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x01\x00\xff\xff\xff\xff"
			set replace "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x01\x00\xff\xff\xff\xff"
			
			catch_die {::patch_elf $elf $search 0 $replace} \
			"Unable to patch self [file tail $elf]"
		}
    }
}
