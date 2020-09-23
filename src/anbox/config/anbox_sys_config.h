/*
 * Copyright (C) 2016 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authored by: Thomas Voß <thomas.voss@canonical.com>
 *
 */

#ifndef ANBOX_SYS_CONFIG_H_
#define ANBOX_SYS_CONFIG_H_

#include <cstdint>
#include <string>

namespace anbox {
namespace config {

class Sys_config {
public:
	std::string bridge_name() const;
	std::string ipv4_broadcast() const;
	std::string ipv4_network() const;
	std::string ipv4_addr() const;
	std::string ipv4_netmask() const;
	std::uint16_t ipv4_nat() const;

	config::Sys_config update_ipv4_broadcast(std::string ipv4_broadcast) const;
	config::Sys_config update_ipv4_network(std::string ipv4_network) const;
	config::Sys_config update_ipv4_addr(std::string ipv4_addr) const;
	config::Sys_config update_ipv4_nat(std::uint16_t ipv4_nat) const;

private:
	std::string bridge_name_;
	std::string ipv4_broadcast_;
	std::string ipv4_network_;
	std::string ipv4_addr_;
	std::string ipv4_netmask_;
	std::uint16_t ipv4_nat_;
}



}  // namespace build
}  // namespace anbox

#endif  // ANBOX_CONFIG_H_
