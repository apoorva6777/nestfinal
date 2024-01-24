variable "compartment_id" {
  description = "Display name used for compartment"
  type        = string
  default     = "ocid1.compartment.oc1..aaaaaaaafujaxb5oanlmpe4nuyzxjircz6cfm75pqp5b2cjqbri6de4qy7gq"
}


#################################
# VCN
#################################

# variable "vcn_cidr_blocks" {
#   description = ""
#   type        = list(string)
#   default     = "10.0.0.0/16"
# }


variable "vcn_display_name" {
  description = ""
  type        = string
  default     = "kj-oke-vcn"
}

variable "vcn_dns_label" {
  description = ""
  type        = string
  default     = "kjtestcluster"
}

variable "vcn_byoipv6cidr_details_id" {
  description = ""
  type        = string
  default     = null
}
variable "vcn_byoipv6cidr_details_cidr_block" {
  description = ""
  type        = string
  default     = null
}
#################################
# subnet
#################################

variable "subnet_one_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.20.0/24"
}

variable "subnet_two_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.10.0/24"
}

variable "subnet_three_cidr_block" {
  description = ""
  type        = string
  default     = "10.0.0.0/28"
}

variable "subnet_one_display_name" {
  description = ""
  type        = string
  default     = "kj-oke-svclbsubnet"
}

variable "subnet_two_display_name" {
  description = ""
  type        = string
  default     = "kj-oke-nodesubnet"
}
variable "subnet_three_display_name" {
  description = ""
  type        = string
  default     = "kj-oke-k8sApiEndpoint-subnet"
}

variable "subnet_one_dns_label" {
  description = ""
  type        = string
  default     = "lbsube3c343ca8"
}

variable "subnet_two_dns_label" {
  description = ""
  type        = string
  default     = "sub90bb31acf"
}

variable "subnet_three_dns_label" {
  description = ""
  type        = string
  default     = "subba6d11348"
}

variable "subnet_prohibit_internet_ingress" {
  description = ""
  type        = bool
  default     = false
}

variable "subnet_prohibit_public_ip_on_vnic" {
  description = ""
  type        = bool
  default     = false
}

variable "subnet_prohibit_internet_ingress_private" {
  description = ""
  type        = bool
  default     = true
}

variable "subnet_prohibit_public_ip_on_vnic_private" {
  description = ""
  type        = bool
  default     = true
}


#################################
# DHCP
#################################

variable "dhcp_options_display_name" {
  description = ""
  type        = string
  default     = "Default DHCP Options for kj oke-vcn"
}

variable "dhcp_options_domain_name_type" {
  description = ""
  type        = string
  default     = "CUSTOM_DOMAIN"
}

variable "dhcp_server_type" {
  description = ""
  type        = string
  default     = "VcnLocalPlusInternet"
}

variable "dhcp_dns_type_custom" {
  description = ""
  type        = string
  default     = "DomainNameServer"
}

variable "dhcp_search_domain_names" {
  description = ""
  type        = list(string)
  default = [
    "kjtestcluster.oraclevcn.com",
  ]
}

variable "dhcp_dns_server_type" {
  description = ""
  type        = string
  default     = null
}

variable "dhcp_dns_type" {
  description = ""
  type        = string
  default     = "SearchDomain"
}

#################################
# Route Table
#################################

variable "route_table_display_name" {
  description = ""
  type        = string
  default     = "oke-private-routetable"
}

variable "route_table_route_rules_description_private_igw" {
  description = ""
  type        = string
  default     = "traffic to the internet"
}

variable "route_table_route_rules_destination_private_igw" {
  description = ""
  type        = string
  default     = "0.0.0.0/0"
}

variable "route_table_route_rules_destination_type_private_igw" {
  description = ""
  type        = string
  default     = "CIDR_BLOCK"
}

variable "route_table_route_rules_description_private_sg" {
  description = ""
  type        = string
  default     = "traffic to OCI services"
}

variable "route_table_route_rules_destination_private_sg" {
  description = ""
  type        = string
  default     = "all-iad-services-in-oracle-services-network"
}

variable "route_table_route_rules_destination_type_private_sg" {
  description = ""
  type        = string
  default     = "SERVICE_CIDR_BLOCK"
}

#####################################
# default route table 
###################################
variable "route_table_route_rules_description_public" {
  description = ""
  type        = string
  default     = "traffic to/from internet"
}

variable "route_table_route_rules_destination_public" {
  description = ""
  type        = string
  default     = "0.0.0.0/0"
}

variable "route_table_route_rules_destination_type_public" {
  description = ""
  type        = string
  default     = "CIDR_BLOCK"
}

variable "default_route_table_display_name_" {
  description = ""
  type        = string
  default     = "oke-public-routetable"
}


##################################################
# service gateway
##################################################
variable "service_gateway_display_name" {
  description = ""
  type        = string
  default     = "oke-sg-kj-test"
}

variable "service_gateway_service_id" {
  description = ""
  type        = string
  default     = "ocid1.service.oc1.iad.aaaaaaaam4zfmy2rjue6fmglumm3czgisxzrnvrwqeodtztg7hwa272mlfna"
}

##################################################
# nat gateway
##################################################

variable "nat_gateway_block_traffic" {
  description = ""
  type        = bool
  default     = "false"
}

variable "nat_gateway_display_name" {
  description = ""
  type        = string
  default     = "oke-ngw"
}

##################################################
# igw 
##################################################


variable "internet_gateway_display_name" {
  description = ""
  type        = string
  default     = "oke-igw-kj-test"
}

variable "internet_gateway_enabled" {
  description = ""
  type        = bool
  default     = "true"
}

##################################################
# dynamic blocks
##################################################

variable "configure_byoipv6" {
  description = "Set this variable to true if you want to configure BYOIPv6 (Bring Your Own IPv6) for the resource."
  type        = bool
  default     = false
}


##################################################
# kubernetes cluster 
##################################################


variable "cluster_cluster_pod_network_options_cni_type" {
  description = ""
  type        = string
  default     = "OCI_VCN_IP_NATIVE"
}

variable "cluster_endpoint_config_is_public_ip_enabled" {
  description = ""
  type        = bool
  default     = "true"
}

variable "cluster_image_policy_config_is_policy_enabled" {
  description = ""
  type        = bool
  default     = "false"
}

variable "cluster_kubernetes_version" {
  description = ""
  type        = string
  default     = "v1.27.2"
}

variable "cluster_name" {
  description = ""
  type        = string
  default     = "kj-test-cluster"
}

variable "cluster_options_add_ons_is_kubernetes_dashboard_enabled" {
  description = ""
  type        = bool
  default     = "false"
}
variable "cluster_options_add_ons_is_tiller_enabled" {
  description = ""
  type        = bool
  default     = "false"
}

variable "cluster_options_admission_controller_options_is_pod_security_policy_enabled" {
  description = ""
  type        = bool
  default     = "false"
}

variable "cluster_options_kubernetes_network_config_pods_cidr" {
  description = ""
  type        = string
  default     = "10.244.0.0/16"
}
variable "cluster_options_kubernetes_network_config_services_cidr" {
  description = ""
  type        = string
  default     = "10.96.0.0/16"
}


#############################################
# node pool
#############################################
variable "node_pool_initial_node_labels_key" {
  description = ""
  type        = string
  default     = "name"
}

variable "node_pool_initial_node_labels_value" {
  description = ""
  type        = string
  default     = "kj-cluster"
}

variable "node_pool_kubernetes_version" {
  description = ""
  type        = string
  default     = "v1.27.2"
}

variable "node_pool_name" {
  description = ""
  type        = string
  default     = "pool1"
}

variable "node_pool_node_config_details_is_pv_encryption_in_transit_enabled" {
  description = ""
  type        = bool
  default     = null
}

variable "node_pool_node_config_details_node_pool_pod_network_option_details_cni_type" {
  description = ""
  type        = string
  default     = "OCI_VCN_IP_NATIVE"
}

variable "node_pool_node_config_details_node_pool_pod_network_option_details_max_pods_per_node" {
  description = ""
  type        = string
  default     = "31"
}
variable "image_policy_config_kms_key_id" {
  description = "The OCID of the Key Management service key to be used for signing the image policy."
  type        = string
  default     = null
}

variable "node_pool_node_config_details_placement_configs_preemptible_node_config_preemption_action_type" {
  description = ""
  type        = string
  default     = null
}
variable "node_pool_node_config_details_placement_configs_preemptible_node_config_preemption_action_is_preserve_boot_volume" {
  description = ""
  type        = bool
  default     = false
}

variable "node_pool_node_config_details_size" {
  description = ""
  type        = string
  default     = "2"
}

variable "node_pool_node_eviction_node_pool_settings_eviction_grace_duration" {
  description = ""
  type        = string
  default     = "PT1H"
}
variable "node_pool_node_eviction_node_pool_settings_is_force_delete_after_grace_duration" {
  description = ""
  type        = string
  default     = null
}


variable "node_pool_node_shape" {
  description = ""
  type        = string
  default     = "VM.Standard.E3.Flex"
}

variable "node_pool_node_shape_config_memory_in_gbs" {
  description = ""
  type        = string
  default     = "8"
}
variable "node_pool_node_shape_config_ocpus" {
  description = ""
  type        = string
  default     = "4"
}

variable "node_pool_node_source_details_image_id" {
  description = ""
  type        = string
  default     = "ocid1.image.oc1.iad.aaaaaaaairuqkf7p2b37jpyklvnqhxxlhyr3fpk55jmi5yklnkdrbsao7msa"
}
variable "node_pool_node_source_details_source_type" {
  description = ""
  type        = string
  default     = "IMAGE"
}

variable "node_pool_node_pool_cycling_details_is_node_cycling_enabled" {
  description = ""
  type        = bool
  default     = false
}
variable "node_pool_node_pool_cycling_details_maximum_surge" {
  description = ""
  type        = string
  default     = "1"
}
variable "node_pool_node_pool_cycling_details_maximum_unavailable" {
  description = ""
  type        = string
  default     = "0"
}

variable "node_pool_quantity_per_subnet" {
  description = ""
  type        = string
  default     = null
}
variable "node_pool_ssh_public_key" {
  description = ""
  type        = string
  default     = null
}
variable "node_pool_subnet_ids" {
  description = ""
  type        = list(string)
  default     = null
}

##################################################
# policy variables
##################################################


variable "policy_description" {
  description = "Description for the policy. Provide a meaningful description to explain the purpose or intent of this policy."
  type        = string
  default     = "Policy for Kubernetes Cluster Autoscaler as a Cluster Standalone Program"
}

variable "policy_name" {
  description = "Name for the policy. Specify a unique and identifiable name for the policy."
  type        = string
  default     = "kj-oke-test-policy"
}


variable "policy_statement" {
  description = "statements for the policy to be added"
  #   type        = string
  default = ["Allow dynamic-group transility-dynamic-group to manage cluster-node-pools in compartment Transility-oci",
    "Allow dynamic-group transility-dynamic-group to manage instance-family in compartment Transility-oci",
    "Allow dynamic-group transility-dynamic-group to use subnets in compartment Transility-oci",
    "Allow dynamic-group transility-dynamic-group to read virtual-network-family in compartment Transility-oci",
    "Allow dynamic-group transility-dynamic-group to use vnics in compartment Transility-oci",
    "Allow dynamic-group transility-dynamic-group to inspect compartments in compartment Transility-oci"
  ]
}
