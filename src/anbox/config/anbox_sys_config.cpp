#include "anbox/config/anbox_sys_config.h"

#include <string>

namespace anbox{
namespace config{

Sys_config::Sys_config():ipv4_broadcast_(""),
						bridge_name_(""),
						ipv4_network_(""),
						ipv4_addr_(""),
						ipv4_nat_(""){

}

std::string Sys_config::bridge_name(){
	return bridge_name_;
}

config::Sys_config Sys_config::update_bridge_name(std::string bridge_name){
	bridge_name_ = bridge_name;
	return this;
}

std::string Sys_config::ipv4_broadcast(){
	return ipv4_broadcast_;
}

config::Sys_config Sys_config::update_ipv4_broadcast(std::string ipv4_broadcast){
	ipv4_broadcast_ = ipv4_broadcast;
	return this;
}


std::string Sys_config::ipv4_network() {
	return ipv4_network_;
}

config::Sys_config Sys_config::update_ipv4_network(std::string ipv4_network){
	ipv4_network_ = ipv4_network;
	return this;
}

std::string Sys_config::ipv4_addr(){
	return ipv4_addr_;
}

config::Sys_config Sys_config::update_ipv4_addr(std::string ipv4_addr){
	ipv4_addr_ = ipv4_addr;
	return this;
}

std::uint16_t Sys_config::ipv4_nat(){
	return ipv4_nat_;
}

config::Sys_config Sys_config::update_ipv4_nat(std::uint16_t ipv4_nat){
	ipv4_nat_ = ipv4_nat;
	return this;
}

}
}