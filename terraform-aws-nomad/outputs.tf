output nomad_security_group {
    value = module.nomad_cluster.nomad_security_group
}

output nomad_db_subnet_group {
    value = aws_db_subnet_group.db_subnet_polymath.name
}
